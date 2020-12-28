import os, sys
import numpy as np

# Variables
filepath = "C:/MCNP6/facilities/reed/critloadexp"
water = "102" # m102 is the mat id for H2O in MCNP materials cards
water_density = "-1.00" # Density of water-- needs to be specified bc it varies with temp & pressure. Negative indicates units of g/cm3 in MCNP syntax. 
universes = {'A':"5504",'B':"5505",'C':"5506",'D':"5507",'E':"5508",'F':"5509"}

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

# '''
# old_cos_pos, old_fe_id are the core positions and fuel elements from the 2016 input deck from M. McCarthy
# As of 2020, F ring has been filled with FEs
# 
# 
# old_core_pos = {'B1','B2','B3','B4','B5','B6','C1','C2','C3','C4','C6','C7','C8','C10','C11','C12','D1','D2','D3','D4','D5','D6','D7','D8','D9','D10','D11','D12','D13','D14','D15','D16','D17','D18','E2','E3','E4','E5','E6','E7','E8','E9','E10','E11','E12','E13','E14','E15','E16','E17','E18','E19','E20','E21','E22','E23','E24','F16'}
#
# old_fe_id = {'B1':'5488','B2':'5478','B3':'5480','B4':'5504','B5':'5525','B6':'4968','C1':'5487','C2':'5491','C3':'5496','C4':'5507','C6':'5533','C7':'5473','C8':'5476','C10':'5481','C11':'5525','C12':'5484','D1':'5495','D2':'5475','D3':'5479','D4':'5482','D5':'5485','D6':'5486','D7':'5492','D8':'5497','D9':'5500','D10':'5514','D11':'5515','D12':'5516','D13':'5517','D14':'5526','D15':'4970','D16':'5529','D17':'5530','D18':'5531','E2':'5501','E3':'5472','E4':'5474','E5':'5477','E6':'5483','E7':'5489','E8':'5490','E9':'1471','E10':'5528','E11':'5498','E12':'5503','E13':'5506','E14':'5509','E15':'5510','E16':'5511','E17':'5513','E18':'5518','E19':'5519','E20':'5520','E21':'5521','E22':'5522','E23':'5524','E24':'5527','F16':'277'}
# '''

# This section takes user cmd inputs and replaces fuel element (FE) materials with water
opts = [] 
while len(opts)==0:
    user_input = input("Input core positions separated by a space, or type 'quit' to quit: ")
    if user_input=="quit": 
        print('quit engaged')
        exit()
    user_input = user_input.split(' ')
    for c in user_input: 
        if c in core_pos: opts.append(c) #user_input is matched with a FE

for c in set(user_input)-set(core_pos):
	print(f"Error check 1: There is no fuel element in core position {c}! Skipping {c}...")

file = open(f"{filepath}/cle.i",'r') # opens MCNP input deck
fe_id_found = {c:0 for c in opts}
print(f'length of {opts}, {len(opts)}, {fe_id_found}')

for row in file:
    entries = row.split(' ')
    k = 1
    for c in opts:
        print(c)
        if entries[0][:4]==fe_id[c]:
            fe_id_found[c]+=1
            while entries[k]=='': k+=1
            entries[k]=water
            k+=1
            while entries[k]=='': k+=1
            entries[k]=water_density
    opts = '-'.join(opts)
    print(opts)
    print(' '.join(entries),file=open(f"{filepath}/cle-{opts}.i",'a'),end='')
    print(f"{filepath}/cle-{opts}.i")

for c in fe_id_found:
	if fe_id_found[c]==0:
		print(f"Error check 2: There is no fuel element in core position {c}!")