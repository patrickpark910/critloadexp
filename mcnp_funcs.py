'''
AUXILLIARY MCNP FUNCTIONS

Written by Patrick Park (RO, Physics '22)
ppark@reed.edu
Last updated Dec. 30, 2020

'''

import os, sys, multiprocessing, glob
import numpy as np
import pandas as pd

def find_base_file(filepath):
    # filepath: string with current folder directory name, e.g. "C:/MCNP6/facilities/reed/rodcal-mcnp"
    base_input_name = None
    while base_input_name == None:
        potential_base_input_name = input('Input base MCNP file name, including extension: ')
        if potential_base_input_name in ['q','quit','kill']: sys.exit()
        elif potential_base_input_name in os.listdir(f'{filepath}'):
            base_input_name = potential_base_input_name
        else: print(f"'{potential_base_input_name}' cannot be found. Try again, or type 'quit' to quit.")
    return base_input_name # Name of the base input deck as string

def check_kcode(filepath,base_file):
    kcode_checked = False
    for line in reversed(list(open(f'{filepath}/{base_file}','r'))):
        entries = line.split(' ')
        if entries[0] == 'kcode': 
            kcode_checked=True
    if kcode_checked == True:
        print(f"Checked that '{base_file}' contains kcode card.")
    else:
        print('The kcode card could not be found in the base deck. The following input decks will be produced without a kcode card, which is necessary for keff calculations in MCNP.')
            
        '''
        kcode_card = input(f"The kcode card could not be found in '{base_file}'. It needs to be added if you want to calculate keff with MCNP. Would you like to add it now? ")
        if kcode_card in ['y','yes']: add_kcode()
        else: sys.exit()
        '''
            
    return kcode_checked # True or False

def add_kcode(): # for now, kcode must be added manually
    pass

def check_run_mcnp():
    ask_to_run_mcnp = input("Would you like to run MCNP now? Type 'yes' to run or 'no' to quit: ")
    if ask_to_run_mcnp.lower() in ['y','yes']: return True
    elif ask_to_run_mcnp.lower() in ['n','no','q','quit','kill']: return False
    else: return check_run_mcnp()
    # Loops until it returns True or False on whether to go ahead and run MCNP.

def get_tasks():
    cores = multiprocessing.cpu_count()
    tasks = input(f"How many CPU cores should be used? Free: {cores}. Use: ")
    if not tasks:
        print(f'The number of tasks is set to the available number of cores: {cores}.')
        tasks = cores
    else:
        try: 
            tasks = int(tasks)
            if tasks < 1 or tasks > multiprocessing.cpu_count():
                raise
        except:
            print(f'Number of tasks is inappropriate. Using maximum number of CPU cores: {cores}')
            tasks = cores 
    return tasks # Integer between 1 and total number of cores available.
    
def run_mcnp(filepath, input_deck_filepath, outputs_folder_name, tasks_to_use):
    if not os.path.isdir(f"{filepath}/{outputs_folder_name}"): os.mkdir(f"{filepath}/{outputs_folder_name}")
    if 'o_'+input_deck_filepath.split('/')[-1].split(".")[0]+'.o' not in os.listdir(f"{filepath}/{outputs_folder_name}"):
        print('Running MCNP...')
        output_deck_filepath = f"{filepath}/{outputs_folder_name}/o_{input_deck_filepath.split('/')[-1].split('.')[0]}"
        os.system(f"mcnp6 i={input_deck_filepath} n={output_deck_filepath}. tasks {tasks_to_use}")
    else: 
        print(f"--This MCNP run will be skipped because the output for {input_file.split('/')[-1]} already exists.")
 
def delete_files(target_folder_filepath,o=False, r=False, s=False):
    # Default args are False unless specified in command
    # NB: os.remove(f'*.r') does not work bc os.remove does not take wildcards (*)
    # if o: 
    #    for file in glob.glob(f'{target_folder_filepath}/*.o'): os.remove(file) 
    if r: 
        for file in glob.glob(f'{target_folder_filepath}/*.r'): os.remove(file) 
    if s: 
        for file in glob.glob(f'{target_folder_filepath}/*.s'): os.remove(file)

def extract_keff(target_filepath):
    # target_outputs: list of output file names from which to read keff values
    # keff_file_name: string with desired file name of collected keffs + .csv
    get_keff = False
    found_keff = False

    for line in open(target_filepath):
        if not found_keff:
            if line.startswith(" the estimated average keffs"):
                get_keff = True
            elif get_keff and line.startswith("       col/abs/trk len"):
                keff, keff_unc = float(line.split()[2]), float(line.split()[3])
                # print(f"{target_filepath.split('/')[-1]}: keff = {keff} +/- {keff_unc}")
                found_keff = True
    if not found_keff: print("--Error: keff cannot be found")
    return keff, keff_unc

'''   
# Old extract_keff() for cle.py. Need backwards compatibility with new extract_keff()

def extract_keff(target_outputs, keff_file_name):
    # target_outputs: list of output file names from which to read keff values
    # keff_file_name: string with desired file name of collected keffs + .csv
    keff_df = pd.DataFrame(columns=['FE removed', 'keff', 'keff unc'])
    for fe_removed in target_outputs:
        file_to_extract_from = open(f'{filepath}/{fe_removed}')
        get_keff = False
        found_keff = False
        for line in file_to_extract_from:
            if not found_keff:
                if line.startswith(" the estimated average keffs"):
                    get_keff = True
                elif get_keff and line.startswith("       col/abs/trk len"):
                    keff, keff_unc = float(line.split()[2]), float(line.split()[3])
                    found_keff = True
        print(f'keff = {keff} +/- {keff_unc} with core positions {fe_removed} vacated.')
        keff_df.loc[len(keff_df)] = [fe_removed, keff, keff_unc]
    keff_df.to_csv(keff_file_name, index=False, encoding='utf8')
    print(f"All {len(target_outputs)} keff values and their uncertainties have been extracted to '{keff_file_name}'.")
    return keff_file_name
'''