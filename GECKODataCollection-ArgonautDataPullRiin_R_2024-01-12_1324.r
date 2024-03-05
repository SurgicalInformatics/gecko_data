# REDCap factoring script
# -  in variable names removed
# - ff_label() instead of Hmisc.
# - leading and trailing spaces in some label names removed
# - long labels shortened
# Further info on changes:
# https://surgicalinformatics.github.io/cookbook/redcap.html#applying-a-redcap-factoring-script
library(finalfit)
library(magrittr)

# Making factors ----
data$period= factor(data$period,levels=c("1","2","3","4","5","6","7","8"))
data$gender= factor(data$gender,levels=c("1","2"))
data$asa= factor(data$asa,levels=c("1","2","3","4","5","6"))
data$bmi= factor(data$bmi,levels=c("1","2","3","4","5","6","7"))
data$frailty= factor(data$frailty,levels=c("1","2","3","4","5","6","7","8","9","10"))
data$pt_comorbid_dm= factor(data$pt_comorbid_dm,levels=c("1","2","3","4"))
data$pt_comorbid_tumour= factor(data$pt_comorbid_tumour,levels=c("1","2","3"))
data$pt_comorbid_liver= factor(data$pt_comorbid_liver,levels=c("1","2","3"))
data$pt_comorbid_ckd= factor(data$pt_comorbid_ckd,levels=c("1","2","3","4","5","6","7"))
data$hist_ac= factor(data$hist_ac,levels=c("1","0"))
data$pre_img_us= factor(data$pre_img_us,levels=c("1","2","3","4","5"))
data$pre_img_ct= factor(data$pre_img_ct,levels=c("1","2","3","4","5"))
data$pre_img_mrcp= factor(data$pre_img_mrcp,levels=c("1","2","3","4","5"))
data$pre_img_ercp= factor(data$pre_img_ercp,levels=c("1","2","3","4","5"))
data$pre_img_eus= factor(data$pre_img_eus,levels=c("1","2","3","4","5"))
data$pre_img_hida= factor(data$pre_img_hida,levels=c("1","2","3","4","5"))
data$pre_urgency= factor(data$pre_urgency,levels=c("1","2","3"))
data$pre_urgency_ele_list= factor(data$pre_urgency_ele_list,levels=c("1","2","3"))
data$pre_indication= factor(data$pre_indication,levels=c("1","2","3","4","5","6","7","8"))
data$pre_indication_tg= factor(data$pre_indication_tg,levels=c("1","2","3"))
data$pre_indication_tg_doc= factor(data$pre_indication_tg_doc,levels=c("1","2"))
data$pre_indication_atlanta= factor(data$pre_indication_atlanta,levels=c("1","2","3"))
data$pre_indication_atlanta_doc= factor(data$pre_indication_atlanta_doc,levels=c("1","2"))
data$preop_data_fields_complete= factor(data$preop_data_fields_complete,levels=c("0","1","2"))
data$op_anaes_regional= factor(data$op_anaes_regional,levels=c("1","2"))
data$op_anaes_inhaled= factor(data$op_anaes_inhaled,levels=c("1","2","3","4","5","6"))
data$op_abx_yn= factor(data$op_abx_yn,levels=c("1","2","3"))
data$op_abx_indication= factor(data$op_abx_indication,levels=c("1","2","3"))
data$op_operator= factor(data$op_operator,levels=c("1","2","3","4"))
data$op_operator_n= factor(data$op_operator_n,levels=c("1","2","3","4"))
data$op_operator_cons= factor(data$op_operator_cons,levels=c("1","2","3","4","5","6","7"))
data$op_operator_trainee_op= factor(data$op_operator_trainee_op,levels=c("1","2","3"))
data$op_operator_trainee_cons= factor(data$op_operator_trainee_cons,levels=c("1","2","3"))
data$op_approach= factor(data$op_approach,levels=c("1","2","3","4"))
data$op_approach_mis_type= factor(data$op_approach_mis_type,levels=c("1","2"))
data$op_approach_open_reason= factor(data$op_approach_open_reason,levels=c("1","2","3","4","5"))
data$op_approach_conv_reason= factor(data$op_approach_conv_reason,levels=c("1","2","3","4","5","6","7","8","9"))
data$op_approach_mis_gas= factor(data$op_approach_mis_gas,levels=c("1","2","3"))
data$op_approach_mis_reuse= factor(data$op_approach_mis_reuse,levels=c("1","2","3"))
data$op_nassar= factor(data$op_nassar,levels=c("1","2","3","4","5","6"))
data$op_cvs_yn= factor(data$op_cvs_yn,levels=c("1","2","3"))
data$op_cvs_to= factor(data$op_cvs_to,levels=c("1","2","3"))
data$op_performed= factor(data$op_performed,levels=c("1","2","3"))
data$op_performed_tcs= factor(data$op_performed_tcs,levels=c("1","2"))
data$op_performed_stc= factor(data$op_performed_stc,levels=c("1","2"))
data$op_performed_no= factor(data$op_performed_no,levels=c("1","2"))
data$op_drain_yn= factor(data$op_drain_yn,levels=c("1","2"))
data$op_biliary_var= factor(data$op_biliary_var,levels=c("1","2","3"))
data$op_img_desc= factor(data$op_img_desc,levels=c("1","2"))
data$op_img_desc_select= factor(data$op_img_desc_select,levels=c("1","2","3"))
data$op_img_stone_yn= factor(data$op_img_stone_yn,levels=c("1","2"))
data$op_img_stone_mx= factor(data$op_img_stone_mx,levels=c("1","2","3","4","5"))
data$op_cbd_explore= factor(data$op_cbd_explore,levels=c("1","2","3"))
data$op_cbd_explore_close= factor(data$op_cbd_explore_close,levels=c("1","2"))
data$op_contam= factor(data$op_contam,levels=c("1","2","3","4"))
data$op_reuse_gown= factor(data$op_reuse_gown,levels=c("1","2","3"))
data$op_reuse_gown_usage= factor(data$op_reuse_gown_usage,levels=c("1","2"))
data$op_reuse_drape= factor(data$op_reuse_drape,levels=c("1","2","3"))
data$intraop_data_fields_complete= factor(data$intraop_data_fields_complete,levels=c("0","1","2"))
data$postop30_cd= factor(data$postop30_cd,levels=c("1","2","3","4","5","6","7","8"))
data$postop30_cd_drain= factor(data$postop30_cd_drain,levels=c("1","0"))
data$postop30_cd_reop= factor(data$postop30_cd_reop,levels=c("1","0"))
data$postop30_cc_yn= factor(data$postop30_cc_yn,levels=c("1","0"))
data$postop30_reimg= factor(data$postop30_reimg,levels=c("1","2"))
data$postop30_comp_ssi= factor(data$postop30_comp_ssi,levels=c("1","2","3","4","5","6","7","8"))
data$postop30_comp_ppc= factor(data$postop30_comp_ppc,levels=c("1","2","3","4","5","6","7","8"))
data$postop30_comp_leak= factor(data$postop30_comp_leak,levels=c("1","2","3","4","5","6","7","8"))
data$postop30_comp_bleed= factor(data$postop30_comp_bleed,levels=c("1","2","3","4","5","6","7","8"))
data$postop30_comp_collec= factor(data$postop30_comp_collec,levels=c("1","2","3","4","5","6","7","8"))
data$postop30_comp_ap= factor(data$postop30_comp_ap,levels=c("1","2","3","4","5","6","7","8"))
data$postop30_readm= factor(data$postop30_readm,levels=c("1","0"))
data$day_outcomes_complete= factor(data$day_outcomes_complete,levels=c("0","1","2"))
data$bdi_yn= factor(data$bdi_yn,levels=c("1","0"))
data$bdi_pres= factor(data$bdi_pres,levels=c("1","2","3","4","5"))
data$bdi_strasberg= factor(data$bdi_strasberg,levels=c("1","2","3","4","5","6","7","8","9","10"))
data$bdi_concvasc= factor(data$bdi_concvasc,levels=c("1","2","3"))
data$bdi_concvasc_loc= factor(data$bdi_concvasc_loc,levels=c("1","2","3","4"))
data$bdi_spec= factor(data$bdi_spec,levels=c("1","2","3"))
data$bdi_spec_transfer= factor(data$bdi_spec_transfer,levels=c("1","0"))
data$bdi_repair_spec= factor(data$bdi_repair_spec,levels=c("1","2","3"))
data$bdi_repair_method= factor(data$bdi_repair_method,levels=c("1","2","3","4","5"))
data$bdi_repair_vasc= factor(data$bdi_repair_vasc,levels=c("1","0"))
data$bdi_data_fields_complete= factor(data$bdi_data_fields_complete,levels=c("0","1","2"))
data$hist_exam_yn= factor(data$hist_exam_yn,levels=c("1","2"))
data$hist_ind= factor(data$hist_ind,levels=c("1","2"))
data$hist_result= factor(data$hist_result,levels=c("1","2"))
data$hist_tnm_t= factor(data$hist_tnm_t,levels=c("1","2","3","4","5","6","7"))
data$hist_tnm_n= factor(data$hist_tnm_n,levels=c("1","2","3"))
data$hist_tnm_m= factor(data$hist_tnm_m,levels=c("1","2"))
data$hist_mdt= factor(data$hist_mdt,levels=c("1","2","3"))
data$hist_rev_surg= factor(data$hist_rev_surg,levels=c("1","2","3"))
data$hist_rev_surg_type_liv= factor(data$hist_rev_surg_type_liv,levels=c("1","2","3","4"))
data$hist_rev_surg_rms= factor(data$hist_rev_surg_rms,levels=c("1","2","3"))
data$hist_rev_surg_li= factor(data$hist_rev_surg_li,levels=c("1","0"))
data$hist_rev_surg_pi= factor(data$hist_rev_surg_pi,levels=c("1","0"))
data$hist_recur= factor(data$hist_recur,levels=c("1","0"))
data$histology_data_fields_complete= factor(data$histology_data_fields_complete,levels=c("0","1","2"))
data$inclusion_exclusion= factor(data$inclusion_exclusion,levels=c("1","2","3","4","5"))
data$include_or_exclude_record_complete= factor(data$include_or_exclude_record_complete,levels=c("0","1","2"))

# making factors: checkbox variables ----
data$pt_comorbid___1 = factor(data$pt_comorbid___1,levels=c("0","1"))
data$pt_comorbid___2 = factor(data$pt_comorbid___2,levels=c("0","1"))
data$pt_comorbid___3 = factor(data$pt_comorbid___3,levels=c("0","1"))
data$pt_comorbid___4 = factor(data$pt_comorbid___4,levels=c("0","1"))
data$pt_comorbid___5 = factor(data$pt_comorbid___5,levels=c("0","1"))
data$pt_comorbid___6 = factor(data$pt_comorbid___6,levels=c("0","1"))
data$pt_comorbid___7 = factor(data$pt_comorbid___7,levels=c("0","1"))
data$pt_comorbid___8 = factor(data$pt_comorbid___8,levels=c("0","1"))
data$pt_comorbid___9 = factor(data$pt_comorbid___9,levels=c("0","1"))
data$pt_comorbid___10 = factor(data$pt_comorbid___10,levels=c("0","1"))
data$pt_comorbid___11 = factor(data$pt_comorbid___11,levels=c("0","1"))
data$pt_comorbid___12 = factor(data$pt_comorbid___12,levels=c("0","1"))
data$pt_comorbid___13 = factor(data$pt_comorbid___13,levels=c("0","1"))
data$pt_comorbid___14 = factor(data$pt_comorbid___14,levels=c("0","1"))
data$pt_comorbid___15 = factor(data$pt_comorbid___15,levels=c("0","1"))
data$pt_comorbid___16 = factor(data$pt_comorbid___16,levels=c("0","1"))
data$pt_comorbid___17 = factor(data$pt_comorbid___17,levels=c("0","1"))
data$pt_comorbid___18 = factor(data$pt_comorbid___18,levels=c("0","1"))
data$pt_comorbid___19 = factor(data$pt_comorbid___19,levels=c("0","1"))

data$pre_img_finding___1 = factor(data$pre_img_finding___1,levels=c("0","1"))
data$pre_img_finding___2 = factor(data$pre_img_finding___2,levels=c("0","1"))
data$pre_img_finding___3 = factor(data$pre_img_finding___3,levels=c("0","1"))
data$pre_img_finding___4 = factor(data$pre_img_finding___4,levels=c("0","1"))
data$pre_img_finding___5 = factor(data$pre_img_finding___5,levels=c("0","1"))
data$pre_img_finding___6 = factor(data$pre_img_finding___6,levels=c("0","1"))

data$op_anaes___1 = factor(data$op_anaes___1,levels=c("0","1"))
data$op_anaes___2 = factor(data$op_anaes___2,levels=c("0","1"))
data$op_anaes___3 = factor(data$op_anaes___3,levels=c("0","1"))
data$op_anaes___4 = factor(data$op_anaes___4,levels=c("0","1"))
data$op_anaes___5 = factor(data$op_anaes___5,levels=c("0","1"))

data$op_anaes_local___1 = factor(data$op_anaes_local___1,levels=c("0","1"))
data$op_anaes_local___2 = factor(data$op_anaes_local___2,levels=c("0","1"))

data$op_cvs_elements___1 = factor(data$op_cvs_elements___1,levels=c("0","1"))
data$op_cvs_elements___2 = factor(data$op_cvs_elements___2,levels=c("0","1"))
data$op_cvs_elements___3 = factor(data$op_cvs_elements___3,levels=c("0","1"))
data$op_cvs_elements___4 = factor(data$op_cvs_elements___4,levels=c("0","1"))

data$op_img___1 = factor(data$op_img___1,levels=c("0","1"))
data$op_img___2 = factor(data$op_img___2,levels=c("0","1"))
data$op_img___3 = factor(data$op_img___3,levels=c("0","1"))
data$op_img___4 = factor(data$op_img___4,levels=c("0","1"))
data$op_img___5 = factor(data$op_img___5,levels=c("0","1"))

data$op_comp___1 = factor(data$op_comp___1,levels=c("0","1"))
data$op_comp___2 = factor(data$op_comp___2,levels=c("0","1"))
data$op_comp___3 = factor(data$op_comp___3,levels=c("0","1"))
data$op_comp___4 = factor(data$op_comp___4,levels=c("0","1"))
data$op_comp___5 = factor(data$op_comp___5,levels=c("0","1"))
data$op_comp___6 = factor(data$op_comp___6,levels=c("0","1"))

data$postop30_reimg_type___1 = factor(data$postop30_reimg_type___1,levels=c("0","1"))
data$postop30_reimg_type___2 = factor(data$postop30_reimg_type___2,levels=c("0","1"))
data$postop30_reimg_type___3 = factor(data$postop30_reimg_type___3,levels=c("0","1"))
data$postop30_reimg_type___4 = factor(data$postop30_reimg_type___4,levels=c("0","1"))

data$bdi_img___1 = factor(data$bdi_img___1,levels=c("0","1"))
data$bdi_img___2 = factor(data$bdi_img___2,levels=c("0","1"))
data$bdi_img___3 = factor(data$bdi_img___3,levels=c("0","1"))
data$bdi_img___4 = factor(data$bdi_img___4,levels=c("0","1"))
data$bdi_img___5 = factor(data$bdi_img___5,levels=c("0","1"))
data$bdi_img___6 = factor(data$bdi_img___6,levels=c("0","1"))
data$bdi_img___7 = factor(data$bdi_img___7,levels=c("0","1"))
data$bdi_img___8 = factor(data$bdi_img___8,levels=c("0","1"))
data$bdi_img___9 = factor(data$bdi_img___9,levels=c("0","1"))

data$bdi_mx___1 = factor(data$bdi_mx___1,levels=c("0","1"))
data$bdi_mx___2 = factor(data$bdi_mx___2,levels=c("0","1"))
data$bdi_mx___3 = factor(data$bdi_mx___3,levels=c("0","1"))
data$bdi_mx___4 = factor(data$bdi_mx___4,levels=c("0","1"))
data$bdi_mx___5 = factor(data$bdi_mx___5,levels=c("0","1"))

data$bdi_repair_comp___1 = factor(data$bdi_repair_comp___1,levels=c("0","1"))
data$bdi_repair_comp___2 = factor(data$bdi_repair_comp___2,levels=c("0","1"))
data$bdi_repair_comp___3 = factor(data$bdi_repair_comp___3,levels=c("0","1"))
data$bdi_repair_comp___4 = factor(data$bdi_repair_comp___4,levels=c("0","1"))
data$bdi_repair_comp___5 = factor(data$bdi_repair_comp___5,levels=c("0","1"))
data$bdi_repair_comp___6 = factor(data$bdi_repair_comp___6,levels=c("0","1"))

data$hist_staging___1 = factor(data$hist_staging___1,levels=c("0","1"))
data$hist_staging___2 = factor(data$hist_staging___2,levels=c("0","1"))
data$hist_staging___3 = factor(data$hist_staging___3,levels=c("0","1"))
data$hist_staging___4 = factor(data$hist_staging___4,levels=c("0","1"))

data$hist_adjv___1 = factor(data$hist_adjv___1,levels=c("0","1"))
data$hist_adjv___2 = factor(data$hist_adjv___2,levels=c("0","1"))
data$hist_adjv___3 = factor(data$hist_adjv___3,levels=c("0","1"))

data$hist_rev_surg_type___1 = factor(data$hist_rev_surg_type___1,levels=c("0","1"))
data$hist_rev_surg_type___2 = factor(data$hist_rev_surg_type___2,levels=c("0","1"))
data$hist_rev_surg_type___3 = factor(data$hist_rev_surg_type___3,levels=c("0","1"))


# Setting levels ----
levels(data$period)=c("Period 1: 31st Jul - 13th Aug 2023","Period 2: 14th Aug - 27th Aug 2023","Period 3: 28th Aug - 10th Sept 2023","Period 4: 11th Sept - 24th Sept 2023","Period 5: 25th Sept - 8th Oct 2023","Period 6: 9th Oct - 22nd Oct 2023","Period 7: 23rd Oct - 5th Nov 2023","Period 8: 6th Nov - 19th Nov 2023")
levels(data$gender)=c("Female","Male")
levels(data$asa)=c("I","II","III","IV","V","Unknown")
levels(data$bmi)=c("<18.5","18.5-24.9","25.0-29.9","30.0-34.9","35.0-39.9","40+","Unknown")
levels(data$frailty)=c("1 (Very fit)","2 (Well)","3 (Managing well)","4 (Vulnerable)","5 (Mildly frail)","6 (Moderately frail)","7 (Severely frail)","8 (Very severely frail)","9 (Terminally ill)","Unknown")
levels(data$pt_comorbid_dm)=c("Diet-Controlled","Medication (non-insulin) controlled","Insulin-controlled","Unknown")
levels(data$pt_comorbid_tumour)=c("Localised","Metastatic","Unknown")
levels(data$pt_comorbid_liver)=c("Mild","Moderate to Severe","Unknown")
levels(data$pt_comorbid_ckd)=c("Stage I","Stage II","Stage IIIa","Stage IIIb","Stage IV","Stage V","Unknown")
levels(data$hist_ac)=c("Yes","No")
levels(data$pre_img_us)=c("Yes","No (Not available)","No (Not indicated)","No (Patient declined)","Unknown")
levels(data$pre_img_ct)=c("Yes","No (Not available)","No (Not indicated)","No (Patient declined)","Unknown")
levels(data$pre_img_mrcp)=c("Yes","No (Not available)","No (Not indicated)","No (Patient declined)","Unknown")
levels(data$pre_img_ercp)=c("Yes","No (Not available)","No (Not indicated)","No (Patient declined)","Unknown")
levels(data$pre_img_eus)=c("Yes","No (Not available)","No (Not indicated)","No (Patient declined)","Unknown")
levels(data$pre_img_hida)=c("Yes","No (Not available)","No (Not indicated)","No (Patient declined)","Unknown")
levels(data$pre_urgency)=c("Elective","Delayed","Emergency")
levels(data$pre_urgency_ele_list)=c("No","Yes","Unknown")
levels(data$pre_indication)=c("Acute calculous cholecystitis","Biliary colic","Acalculous cholecystitis","Chronic calculous cholecystitis","Common Bile Duct (CBD) stone","Gallbladder polyp","Dyskinesia","Gallstone pancreatitis")
levels(data$pre_indication_tg)=c("I","II","III")
levels(data$pre_indication_tg_doc)=c("No","Yes")
levels(data$pre_indication_atlanta)=c("Mild","Moderate","Severe")
levels(data$pre_indication_atlanta_doc)=c("No","Yes")
levels(data$preop_data_fields_complete)=c("Incomplete","Unverified","Complete")
levels(data$op_anaes_regional)=c("Spine-related","Regional nerve block")
levels(data$op_anaes_inhaled)=c("Sevoflurane","Halothane","Desflurane","Nitric Oxide (N2O)","Isoflurane","Unknown")
levels(data$op_abx_yn)=c("No","Yes","Unknown")
levels(data$op_abx_indication)=c("Prophylactic","Intraoperative spillage","Cholecystitis")
levels(data$op_operator)=c("Consultant or attending","Senior trainee","Junior trainee","Non-surgeon")
levels(data$op_operator_n)=c("0-50","51-100","101-200",">200")
levels(data$op_operator_cons)=c("General","Oesophago-gastric (OG)","HPB","Colorectal","Breast","Vascular","Other {op_operator_cons_other}")
levels(data$op_operator_trainee_op)=c("No","Yes","Unknown")
levels(data$op_operator_trainee_cons)=c("No","Yes","Unknown")
levels(data$op_approach)=c("Open","Open conversion","Laparoscopic","Robotic")
levels(data$op_approach_mis_type)=c("Standard","Single Incision Laparoscopic Surgery (SILS)")
levels(data$op_approach_open_reason)=c("No laparoscopic equipment","Surgeon not trained in laparoscopy","Laparoscopy equipment broken","Multiple previous surgery","Disease severity")
levels(data$op_approach_conv_reason)=c("Suboptimal view","Adhesions","Not able to safely dissect CVS","Suspected bile duct injury","Patient unable to tolerate pneumoperitoneum","Bleeding","Bowel injury","Laparoscopic or robotic equipment failure","Suspected or actual cholecystoduodenal or cholecystocolonic fistula")
levels(data$op_approach_mis_gas)=c("No","Yes","Unknown")
levels(data$op_approach_mis_reuse)=c("No","Yes","Unknown")
levels(data$op_nassar)=c("I","II","III","IV","V","Unknown")
levels(data$op_cvs_yn)=c("Yes (CVS documented as obtained)","No (CVS documented as not obtained)","CVS not documented")
levels(data$op_cvs_to)=c("No","Yes","Unknown")
levels(data$op_performed)=c("Total cholecystectomy","Subtotal cholecystectomy","Not performed")
levels(data$op_performed_tcs)=c("Standard approach","Fundus-first (top down) approach")
levels(data$op_performed_stc)=c("Reconstituting (closes off the lower end of the gallbladder, creating a remnant gallbladder)","Fenestrated (does not occlude the gallbladder but may suture the cystic duct internally)")
levels(data$op_performed_no)=c("Diagnostic laparoscopy","Cholecystostomy")
levels(data$op_drain_yn)=c("No","Yes")
levels(data$op_biliary_var)=c("No","Yes","Unknown")
levels(data$op_img_desc)=c("Selective","Routine")
levels(data$op_img_desc_select)=c("Raised liver function test","Concern of a bile duct injury","Pre-operative imaging suggestive of CBD stone")
levels(data$op_img_stone_yn)=c("Stone","No stone")
levels(data$op_img_stone_mx)=c("Flushing with saline and smooth muscle relaxant","Fogarty catheter trawl","Basket retrieval","Choledocholescope","No intraoperative treatment attempted")
levels(data$op_cbd_explore)=c("Yes (Trancystic)","Yes (Choledochotomy)","No")
levels(data$op_cbd_explore_close)=c("Primary closure","T-tube")
levels(data$op_contam)=c("Clean","Clean-Contaminated","Contaminated","Dirty")
levels(data$op_reuse_gown)=c("No","Yes {op_reuse_gown_usage}","Unknown")
levels(data$op_reuse_gown_usage)=c("All scrubbed staff","Some scrubbed staff")
levels(data$op_reuse_drape)=c("No","Yes","Unknown")
levels(data$intraop_data_fields_complete)=c("Incomplete","Unverified","Complete")
levels(data$postop30_cd)=c("0 (no complications)","I","II","IIIa","IIIb","IVa","IVb","V (death)")
levels(data$postop30_cd_drain)=c("Yes","No")
levels(data$postop30_cd_reop)=c("Yes","No")
levels(data$postop30_cc_yn)=c("Yes","No")
levels(data$postop30_reimg)=c("No","Yes {postop30_reimg_type}")
levels(data$postop30_comp_ssi)=c("0 (no complication)","I","II","IIIa","IIIb","IVa","IVb","V (death)")
levels(data$postop30_comp_ppc)=c("0 (no complication)","I","II","IIIa","IIIb","IVa","IVb","V (death)")
levels(data$postop30_comp_leak)=c("0 (no complication)","I","II","IIIa","IIIb","IVa","IVb","V (death)")
levels(data$postop30_comp_bleed)=c("0 (no complication)","I","II","IIIa","IIIb","IVa","IVb","V (death)")
levels(data$postop30_comp_collec)=c("0 (no complication)","I","II","IIIa","IIIb","IVa","IVb","V (death)")
levels(data$postop30_comp_ap)=c("0 (no complication)","I","II","IIIa","IIIb","IVa","IVb","V (death)")
levels(data$postop30_readm)=c("Yes","No")
levels(data$day_outcomes_complete)=c("Incomplete","Unverified","Complete")
levels(data$bdi_yn)=c("Yes","No")
levels(data$bdi_pres)=c("Intraoperatively","Controlled bile leak from surgically placed abdominal drain","Abdominal pain due to uncontrolled bile leak","Obstructive jaundice or cholangitis","Intra-abdominal abscess or biloma")
levels(data$bdi_strasberg)=c("A","B","C","D","E1","E2","E3","E4","E5","Unknown")
levels(data$bdi_concvasc)=c("No","Yes {bdi_concvasc_loc}","Unknown")
levels(data$bdi_concvasc_loc)=c("Right hepatic artery","Common hepatic artery","Main portal vein","Right portal vein")
levels(data$bdi_spec)=c("No","Yes","Not required (Injury occurred at specialist HPB centre)")
levels(data$bdi_spec_transfer)=c("Yes","No")
levels(data$bdi_repair_spec)=c("HPB surgeon","Upper GI surgeon","General surgeon")
levels(data$bdi_repair_method)=c("Roux-en-Y Hepaticojejunostomy","CBD repair without T-tube","CBD repair with T-tube","CBD end to end anastomosis","Hepaticoduodenostomy")
levels(data$bdi_repair_vasc)=c("Yes","No")
levels(data$bdi_data_fields_complete)=c("Incomplete","Unverified","Complete")
levels(data$hist_exam_yn)=c("Yes, sent for examination","No, not sent for examination")
levels(data$hist_ind)=c("Routine","Selective")
levels(data$hist_result)=c("Benign","Malignant")
levels(data$hist_tnm_t)=c("Tis","T1a (lamina propria)","T1b (muscularis)","T2a (peritoneal side)","T2b (hepatic side)","T3","T4")
levels(data$hist_tnm_n)=c("N0","N1 (1-3 nodes)","N2 (>3 nodes)")
levels(data$hist_tnm_m)=c("M0","M1")
levels(data$hist_mdt)=c("No","Yes","Unknown")
levels(data$hist_rev_surg)=c("Yes","No (not required)","No (unresectable tumour)")
levels(data$hist_rev_surg_type_liv)=c("Liver bed","One segment","Two segments","≥ 3 segments")
levels(data$hist_rev_surg_rms)=c("R0","R1","R2")
levels(data$hist_rev_surg_li)=c("Yes","No")
levels(data$hist_rev_surg_pi)=c("Yes","No")
levels(data$hist_recur)=c("Yes","No")
levels(data$histology_data_fields_complete)=c("Incomplete","Unverified","Complete")
levels(data$inclusion_exclusion)=c("Include - this is a valid record for a patient who fulfils inclusion criteria","Exclude - patient does not fulfil inclusion criteria","Exclude - duplicate record","Exclude - patient withdrew consent","Exclude - test/practice record or record created by error")
levels(data$include_or_exclude_record_complete)=c("Incomplete","Unverified","Complete")

# levels of checkbox variables ----
levels(data$pt_comorbid___1)=c("Unchecked","Checked")
levels(data$pt_comorbid___2)=c("Unchecked","Checked")
levels(data$pt_comorbid___3)=c("Unchecked","Checked")
levels(data$pt_comorbid___4)=c("Unchecked","Checked")
levels(data$pt_comorbid___5)=c("Unchecked","Checked")
levels(data$pt_comorbid___6)=c("Unchecked","Checked")
levels(data$pt_comorbid___7)=c("Unchecked","Checked")
levels(data$pt_comorbid___8)=c("Unchecked","Checked")
levels(data$pt_comorbid___9)=c("Unchecked","Checked")
levels(data$pt_comorbid___10)=c("Unchecked","Checked")
levels(data$pt_comorbid___11)=c("Unchecked","Checked")
levels(data$pt_comorbid___12)=c("Unchecked","Checked")
levels(data$pt_comorbid___13)=c("Unchecked","Checked")
levels(data$pt_comorbid___14)=c("Unchecked","Checked")
levels(data$pt_comorbid___15)=c("Unchecked","Checked")
levels(data$pt_comorbid___16)=c("Unchecked","Checked")
levels(data$pt_comorbid___17)=c("Unchecked","Checked")
levels(data$pt_comorbid___18)=c("Unchecked","Checked")
levels(data$pt_comorbid___19)=c("Unchecked","Checked")

levels(data$pre_img_finding___1)=c("Unchecked","Checked")
levels(data$pre_img_finding___2)=c("Unchecked","Checked")
levels(data$pre_img_finding___3)=c("Unchecked","Checked")
levels(data$pre_img_finding___4)=c("Unchecked","Checked")
levels(data$pre_img_finding___5)=c("Unchecked","Checked")
levels(data$pre_img_finding___6)=c("Unchecked","Checked")

levels(data$op_anaes___1)=c("Unchecked","Checked")
levels(data$op_anaes___2)=c("Unchecked","Checked")
levels(data$op_anaes___3)=c("Unchecked","Checked")
levels(data$op_anaes___4)=c("Unchecked","Checked")
levels(data$op_anaes___5)=c("Unchecked","Checked")

levels(data$op_anaes_local___1)=c("Unchecked","Checked")
levels(data$op_anaes_local___2)=c("Unchecked","Checked")

levels(data$op_cvs_elements___1)=c("Unchecked","Checked")
levels(data$op_cvs_elements___2)=c("Unchecked","Checked")
levels(data$op_cvs_elements___3)=c("Unchecked","Checked")
levels(data$op_cvs_elements___4)=c("Unchecked","Checked")

levels(data$op_img___1)=c("Unchecked","Checked")
levels(data$op_img___2)=c("Unchecked","Checked")
levels(data$op_img___3)=c("Unchecked","Checked")
levels(data$op_img___4)=c("Unchecked","Checked")
levels(data$op_img___5)=c("Unchecked","Checked")

levels(data$op_comp___1)=c("Unchecked","Checked")
levels(data$op_comp___2)=c("Unchecked","Checked")
levels(data$op_comp___3)=c("Unchecked","Checked")
levels(data$op_comp___4)=c("Unchecked","Checked")
levels(data$op_comp___5)=c("Unchecked","Checked")
levels(data$op_comp___6)=c("Unchecked","Checked")

levels(data$postop30_reimg_type___1)=c("Unchecked","Checked")
levels(data$postop30_reimg_type___2)=c("Unchecked","Checked")
levels(data$postop30_reimg_type___3)=c("Unchecked","Checked")
levels(data$postop30_reimg_type___4)=c("Unchecked","Checked")

levels(data$bdi_img___1)=c("Unchecked","Checked")
levels(data$bdi_img___2)=c("Unchecked","Checked")
levels(data$bdi_img___3)=c("Unchecked","Checked")
levels(data$bdi_img___4)=c("Unchecked","Checked")
levels(data$bdi_img___5)=c("Unchecked","Checked")
levels(data$bdi_img___6)=c("Unchecked","Checked")
levels(data$bdi_img___7)=c("Unchecked","Checked")
levels(data$bdi_img___8)=c("Unchecked","Checked")
levels(data$bdi_img___9)=c("Unchecked","Checked")

levels(data$bdi_mx___1)=c("Unchecked","Checked")
levels(data$bdi_mx___2)=c("Unchecked","Checked")
levels(data$bdi_mx___3)=c("Unchecked","Checked")
levels(data$bdi_mx___4)=c("Unchecked","Checked")
levels(data$bdi_mx___5)=c("Unchecked","Checked")

levels(data$bdi_repair_comp___1)=c("Unchecked","Checked")
levels(data$bdi_repair_comp___2)=c("Unchecked","Checked")
levels(data$bdi_repair_comp___3)=c("Unchecked","Checked")
levels(data$bdi_repair_comp___4)=c("Unchecked","Checked")
levels(data$bdi_repair_comp___5)=c("Unchecked","Checked")
levels(data$bdi_repair_comp___6)=c("Unchecked","Checked")

levels(data$hist_staging___1)=c("Unchecked","Checked")
levels(data$hist_staging___2)=c("Unchecked","Checked")
levels(data$hist_staging___3)=c("Unchecked","Checked")
levels(data$hist_staging___4)=c("Unchecked","Checked")

levels(data$hist_adjv___1)=c("Unchecked","Checked")
levels(data$hist_adjv___2)=c("Unchecked","Checked")
levels(data$hist_adjv___3)=c("Unchecked","Checked")

levels(data$hist_rev_surg_type___1)=c("Unchecked","Checked")
levels(data$hist_rev_surg_type___2)=c("Unchecked","Checked")
levels(data$hist_rev_surg_type___3)=c("Unchecked","Checked")

# Removing curly brackets and HTML tags ----
data = data %>% 
  # remove subvariable labels (in {var})
  mutate(across(where(is_character), ~str_remove_all(., " \\s*\\{[^\\)]+\\}"))) %>% 
  # remove HTML tags
  mutate(across(where(is_character), ~str_remove_all(., "<b>|</b>")))

# Setting Labels ----

data$record_id %<>% ff_label("Record ID")
data$redcap_data_access_group %<>% ff_label("Data Access Group")
data$time_entered %<>% ff_label("Time")
data$user_start %<>% ff_label("User started the form")
data$intro_text %<>% ff_label("IMPORTANT NOTE")
data$period %<>% ff_label("Data collection period")
data$age_years %<>% ff_label("Age")
data$gender %<>% ff_label("Sex at birth")
data$asa %<>% ff_label("ASA grade (ASA grade descriptions found here)")
data$bmi %<>% ff_label("Body Mass Index (BMI)")
data$frailty %<>% ff_label("Clinical Frailty Scale")
data$pt_comorbid_dm %<>% ff_label("Diabetes")
data$pt_comorbid_tumour %<>% ff_label("Solid Tumour")
data$pt_comorbid_liver %<>% ff_label("Liver disease")
data$pt_comorbid_ckd %<>% ff_label("Chronic Kidney Disease")
data$hist_ac %<>% ff_label("History of acute cholecystitis or cholangitis")
data$admission_prior %<>% ff_label("Number of admissions 12 months")
data$pre_img_us %<>% ff_label("Ultrasound scan (USS)")
data$pre_img_ct %<>% ff_label("Computed Tomography (CT)")
data$pre_img_mrcp %<>% ff_label("Magnetic Resonance Cholangiopancreatography (MRCP)")
data$pre_img_ercp %<>% ff_label("Endoscopic Retrograde Cholangiopancreatography (ERCP)")
data$pre_img_eus %<>% ff_label("Endoscopic Ultrasound (EUS)")
data$pre_img_hida %<>% ff_label("Hepatobiliary IminoDiacetic Acid (HIDA)")
data$pre_img_finding %<>% ff_label("Preoperative imaging findings")
data$pre_img_finding_cbd %<>% ff_label("Dilated CBD diameter")
data$pre_symp_adm_day %<>% ff_label("Days between first biliary symptom onset and diagnosis")
data$pre_symp_adm_months %<>% ff_label("months symptom to diagnosis")
data$pre_diag_dec_day %<>% ff_label("Days between diagnosis and decision to operate")
data$pre_diag_dec_months %<>% ff_label("months diagnosis to decision to operate")
data$pre_dec_op_day %<>% ff_label("Days between decision to operate and surgery performed")
data$pre_dec_op_months %<>% ff_label("months decision to operate to surgery")
data$pre_urgency %<>% ff_label("Urgency of surgery")
data$pre_urgency_ele_list %<>% ff_label("Elective waiting list")
data$pre_indication %<>% ff_label("Indication of surgery")
data$pre_indication_tg %<>% ff_label("Tokyo grade")
data$pre_indication_tg_doc %<>% ff_label("Was the Tokyo grade documented in patient notes?")
data$pre_indication_atlanta %<>% ff_label("Atlanta criteria")
data$pre_indication_atlanta_doc %<>% ff_label("Was the Atlanta criteria documented in patient notes?")
data$missing_total_pre %<>% ff_label("Total number of missing key data fields in the pre-operative form")
data$preop_data_fields_complete %<>% ff_label("Complete?")
data$op_anaes %<>% ff_label("Mode of anaesthesia")
data$op_anaes_local %<>% ff_label("Local anaesthesia")
data$op_anaes_regional %<>% ff_label("Regional anaesthesia")
data$op_anaes_inhaled %<>% ff_label("General inhaled anaesthesia")
data$op_abx_yn %<>% ff_label("Intraoperative antibiotics")
data$op_abx_indication %<>% ff_label("Indication for intraoperative antibiotics")
data$op_operator %<>% ff_label("Primary operator")
data$op_operator_n %<>% ff_label("Number of cholecystectomies performed by the primary operator prior to this procedure")
data$op_operator_cons %<>% ff_label("Consultant specialty")
data$op_operator_cons_other %<>% ff_label("Consultant specialty other")
data$op_operator_trainee_op %<>% ff_label("Was this a training operation?")
data$op_operator_trainee_cons %<>% ff_label("Was a consultant present?")
data$op_approach %<>% ff_label("Operative approach")
data$op_approach_mis_type %<>% ff_label("Minimally invasive (laparoscopic or robotic) technique")
data$op_approach_open_reason %<>% ff_label("Reason for open operative approach")
data$op_approach_conv_reason %<>% ff_label("Reason operation is converted to open")
data$op_approach_mis_gas %<>% ff_label("Gassless laparoscopic or robotic technique")
data$op_approach_mis_reuse %<>% ff_label("Reusable laparoscopic equipment")
data$op_nassar %<>% ff_label("Nassar grade")
data$op_cvs_yn %<>% ff_label("Critical View of Safety (CVS)")
data$op_cvs_elements %<>% ff_label("Elements of the Critical View of Safety (CVS) achieved")
data$op_cvs_to %<>% ff_label("Was there a time-out to verify CVS")
data$op_performed %<>% ff_label("Operation performed")
data$op_performed_tcs %<>% ff_label("Total cholecystectomy technique")
data$op_performed_stc %<>% ff_label("Subtotal cholecystectomy technique")
data$op_performed_no %<>% ff_label("Operation not performed")
data$op_drain_yn %<>% ff_label("Abdominal drain insertion")
data$op_biliary_var %<>% ff_label("Anatomical Biliary variant")
data$op_img %<>% ff_label("Intraoperative CBD Assessment")
data$op_img_desc %<>% ff_label("Decision for intraoperative CBD Assessment")
data$op_img_desc_select %<>% ff_label("Reason for selective decision of intraoperative CBD Assessment")
data$op_img_stone_yn %<>% ff_label("Intraoperative CBD assessment findings")
data$op_img_stone_mx %<>% ff_label("Intraoperative CBD stone management")
data$op_cbd_explore %<>% ff_label("Common Bile Duct exploration")
data$op_cbd_explore_close %<>% ff_label("Choledochotomy closure")
data$op_contam %<>% ff_label("Operative contamination")
data$op_comp %<>% ff_label("Intraoperative complications")
data$op_reuse_gown %<>% ff_label("Reusable gowns")
data$op_reuse_gown_usage %<>% ff_label("Reusable gowns usage")
data$op_reuse_drape %<>% ff_label("Reusable drapes")
data$missing_total_intraop %<>% ff_label("Total number of missing key data fields in the intraoperative form")
data$intraop_data_fields_complete %<>% ff_label("Complete?")
data$postop30_cd %<>% ff_label("30-day Clavien Dindo Complication Grade")
data$postop30_cd_drain %<>% ff_label("Radiological drainage")
data$postop30_cd_reop %<>% ff_label("Re-operation")
data$op_cd_death %<>% ff_label("Time from index cholecystectomy to death")
data$postop30_cc_yn %<>% ff_label("Unplanned critical care admission")
data$post30_cc_los %<>% ff_label("Critical care length of stay")
data$postop30_reimg %<>% ff_label("Unplanned re-imaging")
data$postop30_reimg_type %<>% ff_label("Re-imaging type")
data$postop30_comp_ssi %<>% ff_label("Surgical site infection")
data$postop30_comp_ppc %<>% ff_label("Postoperative pulmonary complications")
data$postop30_comp_leak %<>% ff_label("Bile leak")
data$postop30_comp_bleed %<>% ff_label("Bleeding")
data$postop30_comp_collec %<>% ff_label("Intra-abdominal collection")
data$postop30_comp_ap %<>% ff_label("Acute pancreatitis")
data$post30_los %<>% ff_label("Length of stay")
data$postop30_readm %<>% ff_label("30-day readmission")
data$postop30_readm_los %<>% ff_label("Readmission length of stay")
data$missing_total_postop30 %<>% ff_label("Total number of missing key data fields in the 30-day outcomes form")
data$day_outcomes_complete %<>% ff_label("Complete?")
data$bdi_yn %<>% ff_label("Bile Duct Injury (BDI)")
data$bdi_pres %<>% ff_label("Presentation of BDI")
data$bdi_day %<>% ff_label("Days from index cholecystectomy to BDI diagnosis")
data$bdi_strasberg %<>% ff_label("Strasberg BDI grade")
data$bdi_concvasc %<>% ff_label("Concomitant vascular injury")
data$bdi_concvasc_loc %<>% ff_label("Concomitant vascular injury location")
data$bdi_img %<>% ff_label("Imaging modality to investigate and confirm BDI")
data$bdi_spec %<>% ff_label("Discussion with a specialist HPB centre")
data$bdi_spec_day %<>% ff_label("Time from injury to referral")
data$bdi_spec_transfer %<>% ff_label("Transferred to specialist HPB centre")
data$bdi_mx %<>% ff_label("Management of Bile duct injuryTick all that apply")
data$bdi_ercp_day %<>% ff_label("Time from index cholecystectomy to ERCP for BDI management")
data$bdi_ercpstent_day %<>% ff_label("Time from index cholecystectomy to ERCP and stent for BDI management")
data$bdi_ptc_day %<>% ff_label("Time from index cholecystectomy to PTC for BDI management")
data$bdi_washout_day %<>% ff_label("Time from index cholecystectomy to washout for BDI management")
data$bdi_repair_day %<>% ff_label("Time from index cholecystectomy to surgical repair for BDI management")
data$bdi_repair_spec %<>% ff_label("Specialty of surgeon performing BDI repair")
data$bdi_repair_method %<>% ff_label("Method of BDI surgical repair")
data$bdi_repair_vasc %<>% ff_label("Vascular repair")
data$bdi_repair_comp %<>% ff_label("One-year complications post BDI surgical repairTick all that apply")
data$bdi_repair_stric_day %<>% ff_label("Time from BDI surgical repair to stricture formation")
data$bdi_repair_chol_day %<>% ff_label("Time from BDI surgical repair to cholangitis")
data$bdi_repair_anas_day %<>% ff_label("Time from BDI surgical repair to anastomotic leakage")
data$bdi_repair_coll_day %<>% ff_label("Time from BDI surgical repair to intra-abdominal abscess or biloma")
data$bdi_repair_reop_day %<>% ff_label("Time from BDI surgical repair to re-repair")
data$bdi_data_fields_complete %<>% ff_label("Complete?")
data$hist_exam_yn %<>% ff_label("Histological specimen sent for examination")
data$hist_ind %<>% ff_label("Indication for sending specimen for histological examination")
data$hist_result_day %<>% ff_label("Time from index cholecystectomy to histology result")
data$hist_result %<>% ff_label("Histology result")
data$hist_staging %<>% ff_label("Staging investigations after index cholecystectomyTick all that apply")
data$hist_staging_cttap_day %<>% ff_label("Time from histology result to CT thorax abdomen pelvis staging")
data$hist_staging_mri_day %<>% ff_label("Time from histology result to MRI liver staging")
data$hist_staging_pet_day %<>% ff_label("Time from histology result to PET-CT staging")
data$hist_staging_lap_day %<>% ff_label("Time from histology result to laparoscopy staging")
data$hist_tnm_t %<>% ff_label("T category")
data$hist_tnm_n %<>% ff_label("N category")
data$hist_tnm_m %<>% ff_label("M category")
data$hist_mdt %<>% ff_label("Discussed at MDT")
data$hist_adjv %<>% ff_label("Adjuvant treatmentTick all that apply")
data$hist_rev_surg %<>% ff_label("Revisional surgery completed")
data$hist_rev_surg_type %<>% ff_label("Revisional surgery typeTick all that apply")
data$hist_rev_surg_type_liv %<>% ff_label("Liver resection extent")
data$hist_rev_surg_day %<>% ff_label("Time from histology result to revisional surgery")
data$hist_rev_surg_rms %<>% ff_label("Resection margin status")
data$hist_rev_surg_li %<>% ff_label("Lymphovascular invasion")
data$hist_rev_surg_pi %<>% ff_label("Perineural invasion")
data$hist_recur %<>% ff_label("Recurrence on imaging at one year")
data$hist_recur_day %<>% ff_label("Time from surgery to recurrence")
data$histology_data_fields_complete %<>% ff_label("Complete?")
data$inclusion_exclusion %<>% ff_label("Should this record be included in the analysis?")
data$include_or_exclude_record_complete %<>% ff_label("Complete?")

# labelling checkbox variables ----
label(data$pt_comorbid___1)="Myocardial Infraction (MI)"
label(data$pt_comorbid___2)="Congestive Heart Failure (CHF)"
label(data$pt_comorbid___3)="Peripheral Vascular Disease (PVD)"
label(data$pt_comorbid___4)="Cerebrovascular Accident (CVA) or Transient Ischaemic Attack (TIA)"
label(data$pt_comorbid___5)="Dementia"
label(data$pt_comorbid___6)="Chronic Obstructive Pulmonary Disease (COPD)"
label(data$pt_comorbid___7)="Connective Tissue Disease (CTD)"
label(data$pt_comorbid___8)="Peptic Ulcer Disease (PUD)"
label(data$pt_comorbid___9)="Hemiplegia"
label(data$pt_comorbid___10)="Leukaemia"
label(data$pt_comorbid___11)="Lymphoma"
label(data$pt_comorbid___12)="HIV/AIDS"
label(data$pt_comorbid___13)="Hypertension"
label(data$pt_comorbid___14)="Inflammatory Bowel Disease (IBD)"
label(data$pt_comorbid___15)="Diabetes Mellitus"
label(data$pt_comorbid___16)="Solid Tumour"
label(data$pt_comorbid___17)="Liver Disease"
label(data$pt_comorbid___18)="Chronic Kidney Disease (CKD)"
label(data$pt_comorbid___19)="None of the Above)"

label(data$pre_img_finding___1)="Gallstones"
label(data$pre_img_finding___2)="Thick-walled Gallbladder"
label(data$pre_img_finding___3)="Pericholecystic fluid"
label(data$pre_img_finding___4)="CBD stones"
label(data$pre_img_finding___5)="Dilated CBD"
label(data$pre_img_finding___6)="Polyp(s"

label(data$op_anaes___1)="Local"
label(data$op_anaes___2)="Regional"
label(data$op_anaes___3)="Sedation (e.g., midazolam)"
label(data$op_anaes___4)="General Inhaled"
label(data$op_anaes___5)="Total Intravenous Volatile Anaesthetic (TIVA)"

label(data$op_anaes_local___1)="Subcutaneous"
label(data$op_anaes_local___2)="Intraperitoneal"

label(data$op_cvs_elements___1)="Clearing fat and fibrous tissue from the hepatocystic triangle"
label(data$op_cvs_elements___2)="The lower third of the gallbladder being cleared from the cystic plate"
label(data$op_cvs_elements___3)="Only two structures are attached to the gallbladder"
label(data$op_cvs_elements___4)="None of the above"

label(data$op_img___1)="Intraoperative cholangiogram (IOC)"
label(data$op_img___2)="Incisionless fluorescent cholangiography"
label(data$op_img___3)="Laparoscopic ultrasound"
label(data$op_img___4)="Intraoperative ERCP"
label(data$op_img___5)="None of the above"

label(data$op_comp___1)="Bile spilt"
label(data$op_comp___2)="Stones Spilt"
label(data$op_comp___3)="Bleeding"
label(data$op_comp___4)="Major vascular injury"
label(data$op_comp___5)="Bowel injury"
label(data$op_comp___6)="None"

label(data$postop30_reimg_type___1)="USS"
label(data$postop30_reimg_type___2)="CT"
label(data$postop30_reimg_type___3)="MRI"
label(data$postop30_reimg_type___4)="ERCP"

label(data$bdi_img___1)="On-table cholangiography (OTC)"
label(data$bdi_img___2)="USS"
label(data$bdi_img___3)="MRCP"
label(data$bdi_img___4)="CT"
label(data$bdi_img___5)="ERCP"
label(data$bdi_img___6)="Percutaneous transhepatic cholangiography (PTC)"
label(data$bdi_img___7)="Nuclear medicine scan (e.g., Functional liver scan)"
label(data$bdi_img___8)="Tubogram"
label(data$bdi_img___9)="None"

label(data$bdi_mx___1)="ERCP only"
label(data$bdi_mx___2)="ERCP and stent"
label(data$bdi_mx___3)="PTC"
label(data$bdi_mx___4)="Washout only"
label(data$bdi_mx___5)="Surgical repair"

label(data$bdi_repair_comp___1)="Stricture formation"
label(data$bdi_repair_comp___2)="Cholangitis"
label(data$bdi_repair_comp___3)="Anastomotic leakage"
label(data$bdi_repair_comp___4)="Intra-abdominal abscess or biloma"
label(data$bdi_repair_comp___5)="Re-repair"
label(data$bdi_repair_comp___6)="None"

label(data$hist_staging___1)="CT thorax abdomen pelvis"
label(data$hist_staging___2)="MRI liver"
label(data$hist_staging___3)="PET-CT"
label(data$hist_staging___4)="Staging laparoscopy"

label(data$hist_adjv___1)="Chemotherapy"
label(data$hist_adjv___2)="Radiotherapy"
label(data$hist_adjv___3)="None"

label(data$hist_rev_surg_type___1)="Liver resection"
label(data$hist_rev_surg_type___2)="Bile duct resection"
label(data$hist_rev_surg_type___3)="Lymph node dissection"