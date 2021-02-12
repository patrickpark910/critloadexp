'''
CRITICAL LOADING EXPERIMENT

Written by Patrick Park (RO, Physics '22)
ppark@reed.edu
First published Dec. 24, 2020
Last updated Jan. 16, 2021

'''

import os, sys, multiprocessing
import numpy as np
import pandas as pd
import matplotlib
import matplotlib.pyplot as plt
from matplotlib.ticker import MultipleLocator

# from mcnp_funcs import *

# Variables
filepath = "C:/MCNP6/facilities/reed/critloadexp" # do NOT include / at the end
inputs_folder_name = "inputs"
outputs_folder_name = "outputs"
water = "102" # m102 is the mat id for H2O in MCNP materials cards
water_density = "-1.00" # Density of water-- needs to be specified bc it varies with temp & pressure. Negative indicates units of g/cm3 in MCNP syntax. 
# universes = {'A':"5504",'B':"5505",'C':"5506",'D':"5507",'E':"5508",'F':"5509"} # testing only

core_pos = {'B1','B2','B3','B4','B5','B6',
            'C1','C2','C3','C4','C6','C7','C8','C10','C11','C12',
            'D1','D2','D3','D4','D5','D6','D7','D8','D9','D10','D11','D12',
            'D13','D14','D15','D16','D17','D18',
            'E2','E3','E4','E5','E6','E7','E8','E9','E10','E11','E12',
            'E13','E14','E15','E16','E17','E18','E19','E20','E21','E22','E23','E24',
            'F1','F2','F3','F4','F5','F7','F8','F14','F15','F16','F17','F18',
            'F19','F20','F21','F22','F24','F26','F27','F28','F29','F30'}

fe_id = {'B1':'7202','B2':'9678','B3':'9679','B4':'7946','B5':'7945','B6':'8104',
         'C1':'4086','C2':'4070','C3':'8102','C4':'3856','C6':'8103',
         'C7':'4117','C8':'8105','C10':'8736','C11':'8735','C12':'10705',
         'D1':'3679','D2':'8732','D3':'4103','D4':'8734','D5':'3685','D6':'4095',
         'D7':'4104','D8':'4054','D9':'4118','D10':'3677','D11':'4131','D12':'4065',
         'D13':'3851','D14':'3866','D15':'8733','D16':'4094','D17':'4129','D18':'3874',
         'E2':'3872','E3':'4106','E4':'3671','E5':'4062','E6':'4121','E7':'4114',
         'E8':'4077','E9':'3674','E10':'4071','E11':'4122','E12':'4083','E13':'3853',
         'E14':'4134','E15':'4133','E16':'4085','E17':'4110','E18':'4055','E19':'3862',
         'E20':'4064','E21':'3858','E22':'4053','E23':'3748','E24':'3852',
         'F1':'4057','F2':'4125','F3':'4074','F4':'4069','F5':'4088','F7':'3868',
         'F8':'4120','F14':'3810','F15':'4130','F16':'4091','F17':'3673','F18':'3682',
         'F19':'4132','F20':'4046','F21':'3865','F22':'3743','F24':'3835','F26':'3676',
         'F27':'3840','F28':'3854','F29':'4049','F30':'4127'}

sop_fe = 'C10 D15 D14 F20 D16 E19 C11 F21' # str of FEs removed during standard procedure
keff_csv_name = "keff.csv"
inv_M_csv_name = "inv_M.csv"

# 
def main(argv):
    os.chdir(f'{filepath}')
    '''
    base_deck = find_base_file(filepath)
    check_kcode(filepath,base_deck)
    opts = [] 
    while len(opts)==0:
        user_input = input(f"Input core positions separated by a space, 'sop' to input the standard procedure for the 1/M experiment ({sop_fe}), or 'quit' to quit: ") # 'A1 B1 C1 C5 C9 D1 E1 F1' # 'C10 D15 D14 F20 D16 C19 C11 F21' # 
        if user_input.lower() in ['s','sop']:
            user_input = sop_fe 
        elif user_input.lower() in ['q','quit','kill']: 
            sys.exit()
        user_input = user_input.split(' ')
        for c in user_input: 
            if c.upper() in core_pos: opts.append(c) # user_input is matched with a FE
            else: print(f"**WARNING: There is no fuel element in core position {c}!")

    inputs_created = replace_mats(filepath, inputs_folder_name, base_deck, opts)
    
    if not check_run_mcnp(): sys.exit()
        
    num_of_fe_to_be_repl = 1
    tasks = get_tasks()

    run_mcnp(filepath,f"{filepath}/{base_deck}",outputs_folder_name,tasks) # runs base case
    
    while num_of_fe_to_be_repl <= len(opts):
        new_input_deck = 'cle-'+'-'.join(opts[:num_of_fe_to_be_repl])+'.i'
        run_mcnp(filepath,f"{filepath}/{inputs_folder_name}/{new_input_deck}",outputs_folder_name,tasks)
        num_of_fe_to_be_repl += 1

    print('MCNP calculations complete!')

    # Deletes MCNP runtape and source dist files.
    delete_files(f"{filepath}/{outputs_folder_name}",r=True,s=True)

    files_to_extract_keff = []
    base_output = 'o_'+base_deck.split('/')[-1].split(".")[0]+'.o'
    files_to_extract_keff.append(base_output) 
    for name in inputs_created:
        output = 'o_'+base_deck.split('/')[-1].split(".")[0]+f'-{name}'+'.o'
        files_to_extract_keff.append(output)


    # Setup a dataframe to collect keff values
    keff_df = pd.DataFrame(columns=["output file", "keff", "keff unc"])
    keff_df["output file"] = files_to_extract_keff
    keff_df.set_index("output file",inplace=True)

    for file in files_to_extract_keff:
        keff, keff_unc = extract_keff(f"{filepath}/{outputs_folder_name}/{file}")
        keff_df.loc[file,f"keff"] = keff 
        keff_df.loc[file,f"keff unc"] = keff_unc 

    print(keff_df)

    keff_df.to_csv(keff_csv_name, encoding='utf8')
    print(f"All {len(files_to_extract_keff)} keff values and their uncertainties have been extracted to '{keff_csv_name}'.")

    calc_inv_M(keff_csv_name)
    # '''
    
    plot_inv_M(inv_M_csv_name)

    

#
#
# Helper Functions
#
#

def replace_mats(filepath, inputs_folder_name, base_deck, opts):
    fe_id_found = {c:0 for c in opts}
    inputs_created = []

    # If the inputs folder doesn't exist, create it.
    if not os.path.isdir(f"{filepath}/{inputs_folder_name}"): os.mkdir(f"{filepath}/{inputs_folder_name}")

    num_of_fe_to_be_repl = 1

    while num_of_fe_to_be_repl <= len(opts):
        file = open(f"{filepath}/{base_deck}",'r') # opens MCNP input deck, must be in while loop
        fe_to_be_repl= opts[:num_of_fe_to_be_repl] 
        new_file_name = '-'.join(fe_to_be_repl)
        input_already_exists = f"cle-{new_file_name}.i" in os.listdir(f'{filepath}/{inputs_folder_name}')
        for line in file:
            entries = line.split(' ')
            entry_no = 1 
            for c in fe_to_be_repl:
                if entries[0][:4]==fe_id[c.upper()]:
                    fe_id_found[c]+=1
                    if not input_already_exists:
                        while entries[entry_no]=='': entry_no+=1
                        entries[entry_no]=water
                        entry_no+=1
                        while entries[entry_no]=='': entry_no+=1
                        entries[entry_no]=water_density
            if not input_already_exists: print(' '.join(entries),file=open(f"{filepath}/{inputs_folder_name}/cle-{new_file_name}.i",'a'),end='')
        if not input_already_exists: print(f"Created input deck 'cle-{new_file_name}.i'")    
        else: print(f"--Input deck will be skipped because 'cle-{new_file_name}.i' already exists.")
        inputs_created.append(new_file_name)
        num_of_fe_to_be_repl += 1
        
    for c in fe_id_found:
    	if fe_id_found[c]==0:
    		print(f"Python was unable to find any instances of the fuel element in core position {c}!")           
    
    return inputs_created


def calc_inv_M(keff_csv_name):
    inv_M_df = pd.read_csv(keff_csv_name)
    inv_M_df.columns =['output file', 'inv M', 'inv M unc']
    inv_M_df['inv M'] = 1 - inv_M_df['inv M']
    inv_M_df = inv_M_df.iloc[::-1]
    inv_M_df.to_csv(inv_M_csv_name, index=False, encoding='utf8')
    print(f"All {len(inv_M_df.index)} 1/M values have been calculated in '{inv_M_csv_name}'.")


def plot_inv_M(csv_file):
    inv_M_df = pd.read_csv(csv_file)
    
    num_fe_loaded = np.arange(0,len(inv_M_df.index))
    num_fe_added = num_fe_loaded - 8
    num_fe_added_1 = num_fe_added[:-1]
    inv_M_mcnp = inv_M_df.iloc[num_fe_loaded,1]
    inv_M_exp = [.0833,.07142,.07142,.0625,.0555,.0500,.0435,.0400]
    
    my_dpi = 320
    dot_marker_size = 2
    line_width = 0.5
    data_line_width = 0.75
    ax_label = 'x-small'
    tick_label = 'xx-small'
    
    fig, ax = plt.subplots(figsize=(673/my_dpi, 673/my_dpi), dpi=my_dpi,facecolor='w',edgecolor='k')
    ax.plot(num_fe_added, inv_M_mcnp, '-bo', label="MCNP", markersize=dot_marker_size, linewidth=data_line_width)
    ax.plot(num_fe_added_1, inv_M_exp,'-ro', label="Experimental", markersize=dot_marker_size, linewidth=data_line_width)
      
    x1,y1,x2,y2 = num_fe_added[-2],inv_M_df.iloc[num_fe_loaded[-2],1],num_fe_added[-1],inv_M_df.iloc[num_fe_loaded[-1],1]
    line_eqn_mcnp = lambda x_mcnp : ((y2-y1)/(x2-x1)) * (x_mcnp - x1) + y1 # make use of line equation to form function line_eqn(x) that generated y
    xrange_mcnp = np.arange(num_fe_added[-1],(num_fe_added[-1]+20)) # generate range of x values based on your graph
    plt.plot(xrange_mcnp, [ line_eqn_mcnp(x_mcnp) for x_mcnp in xrange_mcnp], color='b', linestyle='--', linewidth=data_line_width) # plot the line with generate x ranges and created y ranges
    
    x3,y3,x4,y4 = num_fe_added[-3], inv_M_exp[num_fe_loaded[-3]], num_fe_added[-2], inv_M_exp[num_fe_loaded[-2]]
    line_eqn_exp = lambda x_exp : ((y4-y3)/(x4-x3)) * (x_exp - x3) + y3 
    xrange_exp = np.arange(num_fe_added_1[-1],(num_fe_added_1[-1]+20)) # generate range of x values based on your graph
    plt.plot(xrange_exp, [ line_eqn_exp(x_exp) for x_exp in xrange_exp], color='r', linestyle='--', linewidth=data_line_width) # plot the line with generate x ranges and created y ranges

    for axis in ['top','bottom','left','right']: ax.spines[axis].set_linewidth(line_width)
    
    ax.set_xlim([-8,3])
    ax.set_ylim([0,.1])

    ax.xaxis.set_major_locator(MultipleLocator(1))
    ax.yaxis.set_major_locator(MultipleLocator(0.01))
    
    #ax.minorticks_on()
    #ax.xaxis.set_minor_locator(MultipleLocator(1))
    #ax.yaxis.set_minor_locator(MultipleLocator(0.005))
    
    ax.tick_params(axis='both', which='both', labelsize=tick_label,width=line_width)
    
    ax.grid(b=True, which='major', color='#999999', linestyle='-', linewidth=line_width)
    ax.grid(which='minor', linestyle=':', linewidth=line_width, color='gray')
    
    ax.set_xlabel(r'Fuel elements added  (0 = standard)',fontsize=ax_label)
    ax.set_ylabel(r'1/M  ($1-k_{eff}$)',fontsize=ax_label)
    ax.legend(title=f'Key', title_fontsize=tick_label, ncol=1, fontsize=tick_label,loc='upper right')
    # fontsize: int or {'xx-small', 'x-small', 'small', 'medium', 'large', 'x-large', 'xx-large'}

    plt.savefig(f'results-square.png', bbox_inches = 'tight', pad_inches = 0.1, dpi=my_dpi)
    
    
if __name__ == "__main__":
    main(sys.argv[1:])
        
