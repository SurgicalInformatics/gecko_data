library(finalfit)
library(magrittr)

data$period.factor = factor(data$period,levels=c("1","2","3","4","5","6","7","8"))
data$gender.factor = factor(data$gender,levels=c("1","2"))
data$asa.factor = factor(data$asa,levels=c("1","2","3","4","5","6"))
data$bmi.factor = factor(data$bmi,levels=c("1","2","3","4","5","6","7"))
data$frailty.factor = factor(data$frailty,levels=c("1","2","3","4","5","6","7","8","9","10"))
data$pt_comorbid_dm.factor = factor(data$pt_comorbid_dm,levels=c("1","2","3","4"))
data$pt_comorbid_tumour.factor = factor(data$pt_comorbid_tumour,levels=c("1","2","3"))
data$pt_comorbid_liver.factor = factor(data$pt_comorbid_liver,levels=c("1","2","3"))
data$pt_comorbid_ckd.factor = factor(data$pt_comorbid_ckd,levels=c("1","2","3","4","5","6","7"))
data$hist_ac.factor = factor(data$hist_ac,levels=c("1","0"))
data$pre_img_us.factor = factor(data$pre_img_us,levels=c("1","2","3","4","5"))
data$pre_img_ct.factor = factor(data$pre_img_ct,levels=c("1","2","3","4","5"))
data$pre_img_mrcp.factor = factor(data$pre_img_mrcp,levels=c("1","2","3","4","5"))
data$pre_img_ercp.factor = factor(data$pre_img_ercp,levels=c("1","2","3","4","5"))
data$pre_img_eus.factor = factor(data$pre_img_eus,levels=c("1","2","3","4","5"))
data$pre_img_hida.factor = factor(data$pre_img_hida,levels=c("1","2","3","4","5"))
data$pre_urgency.factor = factor(data$pre_urgency,levels=c("1","2","3"))
data$pre_urgency_ele_list.factor = factor(data$pre_urgency_ele_list,levels=c("1","2","3"))
data$pre_indication.factor = factor(data$pre_indication,levels=c("1","2","3","4","5","6","7","8"))
data$pre_indication_tg.factor = factor(data$pre_indication_tg,levels=c("1","2","3"))
data$pre_indication_tg_doc.factor = factor(data$pre_indication_tg_doc,levels=c("1","2"))
data$pre_indication_atlanta.factor = factor(data$pre_indication_atlanta,levels=c("1","2","3"))
data$pre_indication_atlanta_doc.factor = factor(data$pre_indication_atlanta_doc,levels=c("1","2"))
data$preop_data_fields_complete.factor = factor(data$preop_data_fields_complete,levels=c("0","1","2"))
data$op_anaes_regional.factor = factor(data$op_anaes_regional,levels=c("1","2"))
data$op_anaes_inhaled.factor = factor(data$op_anaes_inhaled,levels=c("1","2","3","4","5","6"))
data$op_abx_yn.factor = factor(data$op_abx_yn,levels=c("1","2","3"))
data$op_abx_indication.factor = factor(data$op_abx_indication,levels=c("1","2","3"))
data$op_operator.factor = factor(data$op_operator,levels=c("1","2","3","4"))
data$op_operator_n.factor = factor(data$op_operator_n,levels=c("1","2","3","4"))
data$op_operator_cons.factor = factor(data$op_operator_cons,levels=c("1","2","3","4","5","6","7"))
data$op_operator_trainee_op.factor = factor(data$op_operator_trainee_op,levels=c("1","2","3"))
data$op_operator_trainee_cons.factor = factor(data$op_operator_trainee_cons,levels=c("1","2","3"))
data$op_approach.factor = factor(data$op_approach,levels=c("1","2","3","4"))
data$op_approach_mis_type.factor = factor(data$op_approach_mis_type,levels=c("1","2"))
data$op_approach_open_reason.factor = factor(data$op_approach_open_reason,levels=c("1","2","3","4","5"))
data$op_approach_conv_reason.factor = factor(data$op_approach_conv_reason,levels=c("1","2","3","4","5","6","7","8","9"))
data$op_approach_mis_gas.factor = factor(data$op_approach_mis_gas,levels=c("1","2","3"))
data$op_approach_mis_reuse.factor = factor(data$op_approach_mis_reuse,levels=c("1","2","3"))
data$op_nassar.factor = factor(data$op_nassar,levels=c("1","2","3","4","5","6"))
data$op_cvs_yn.factor = factor(data$op_cvs_yn,levels=c("1","2","3"))
data$op_cvs_to.factor = factor(data$op_cvs_to,levels=c("1","2","3"))
data$op_performed.factor = factor(data$op_performed,levels=c("1","2","3"))
data$op_performed_tcs.factor = factor(data$op_performed_tcs,levels=c("1","2"))
data$op_performed_stc.factor = factor(data$op_performed_stc,levels=c("1","2"))
data$op_performed_no.factor = factor(data$op_performed_no,levels=c("1","2"))
data$op_drain_yn.factor = factor(data$op_drain_yn,levels=c("1","2"))
data$op_biliary_var.factor = factor(data$op_biliary_var,levels=c("1","2","3"))
data$op_img_desc.factor = factor(data$op_img_desc,levels=c("1","2"))
data$op_img_desc_select.factor = factor(data$op_img_desc_select,levels=c("1","2","3"))
data$op_img_stone_yn.factor = factor(data$op_img_stone_yn,levels=c("1","2"))
data$op_img_stone_mx.factor = factor(data$op_img_stone_mx,levels=c("1","2","3","4","5"))
data$op_cbd_explore.factor = factor(data$op_cbd_explore,levels=c("1","2","3"))
data$op_cbd_explore_close.factor = factor(data$op_cbd_explore_close,levels=c("1","2"))
data$op_contam.factor = factor(data$op_contam,levels=c("1","2","3","4"))
data$op_reuse_gown.factor = factor(data$op_reuse_gown,levels=c("1","2","3"))
data$op_reuse_gown_usage.factor = factor(data$op_reuse_gown_usage,levels=c("1","2"))
data$op_reuse_drape.factor = factor(data$op_reuse_drape,levels=c("1","2","3"))
data$intraop_data_fields_complete.factor = factor(data$intraop_data_fields_complete,levels=c("0","1","2"))
data$postop30_cd.factor = factor(data$postop30_cd,levels=c("1","2","3","4","5","6","7","8"))
data$postop30_cd_drain.factor = factor(data$postop30_cd_drain,levels=c("1","0"))
data$postop30_cd_reop.factor = factor(data$postop30_cd_reop,levels=c("1","0"))
data$postop30_cc_yn.factor = factor(data$postop30_cc_yn,levels=c("1","0"))
data$postop30_reimg.factor = factor(data$postop30_reimg,levels=c("1","2"))
data$postop30_comp_ssi.factor = factor(data$postop30_comp_ssi,levels=c("1","2","3","4","5","6","7","8"))
data$postop30_comp_ppc.factor = factor(data$postop30_comp_ppc,levels=c("1","2","3","4","5","6","7","8"))
data$postop30_comp_leak.factor = factor(data$postop30_comp_leak,levels=c("1","2","3","4","5","6","7","8"))
data$postop30_comp_bleed.factor = factor(data$postop30_comp_bleed,levels=c("1","2","3","4","5","6","7","8"))
data$postop30_comp_collec.factor = factor(data$postop30_comp_collec,levels=c("1","2","3","4","5","6","7","8"))
data$postop30_comp_ap.factor = factor(data$postop30_comp_ap,levels=c("1","2","3","4","5","6","7","8"))
data$postop30_readm.factor = factor(data$postop30_readm,levels=c("1","0"))
data$day_outcomes_complete.factor = factor(data$day_outcomes_complete,levels=c("0","1","2"))
data$bdi_yn.factor = factor(data$bdi_yn,levels=c("1","0"))
data$bdi_pres.factor = factor(data$bdi_pres,levels=c("1","2","3","4","5"))
data$bdi_strasberg.factor = factor(data$bdi_strasberg,levels=c("1","2","3","4","5","6","7","8","9","10"))
data$bdi_concvasc.factor = factor(data$bdi_concvasc,levels=c("1","2","3"))
data$bdi_concvasc_loc.factor = factor(data$bdi_concvasc_loc,levels=c("1","2","3","4"))
data$bdi_spec.factor = factor(data$bdi_spec,levels=c("1","2","3"))
data$bdi_spec_transfer.factor = factor(data$bdi_spec_transfer,levels=c("1","0"))
data$bdi_repair_spec.factor = factor(data$bdi_repair_spec,levels=c("1","2","3"))
data$bdi_repair_method.factor = factor(data$bdi_repair_method,levels=c("1","2","3","4","5"))
data$bdi_repair_vasc.factor = factor(data$bdi_repair_vasc,levels=c("1","0"))
data$bdi_data_fields_complete.factor = factor(data$bdi_data_fields_complete,levels=c("0","1","2"))
data$hist_exam_yn.factor = factor(data$hist_exam_yn,levels=c("1","2"))
data$hist_ind.factor = factor(data$hist_ind,levels=c("1","2"))
data$hist_result.factor = factor(data$hist_result,levels=c("1","2"))
data$hist_tnm_t.factor = factor(data$hist_tnm_t,levels=c("1","2","3","4","5","6","7"))
data$hist_tnm_n.factor = factor(data$hist_tnm_n,levels=c("1","2","3"))
data$hist_tnm_m.factor = factor(data$hist_tnm_m,levels=c("1","2"))
data$hist_mdt.factor = factor(data$hist_mdt,levels=c("1","2","3"))
data$hist_rev_surg.factor = factor(data$hist_rev_surg,levels=c("1","2","3"))
data$hist_rev_surg_type_liv.factor = factor(data$hist_rev_surg_type_liv,levels=c("1","2","3","4"))
data$hist_rev_surg_rms.factor = factor(data$hist_rev_surg_rms,levels=c("1","2","3"))
data$hist_rev_surg_li.factor = factor(data$hist_rev_surg_li,levels=c("1","0"))
data$hist_rev_surg_pi.factor = factor(data$hist_rev_surg_pi,levels=c("1","0"))
data$hist_recur.factor = factor(data$hist_recur,levels=c("1","0"))
data$histology_data_fields_complete.factor = factor(data$histology_data_fields_complete,levels=c("0","1","2"))
data$inclusion_exclusion.factor = factor(data$inclusion_exclusion,levels=c("1","2","3","4","5"))
data$include_or_exclude_record_complete.factor = factor(data$include_or_exclude_record_complete,levels=c("0","1","2"))
levels(data$period.factor)=c("Period 1: 31st Jul - 13th Aug 2023","Period 2: 14th Aug - 27th Aug 2023","Period 3: 28th Aug - 10th Sept 2023","Period 4: 11th Sept - 24th Sept 2023","Period 5: 25th Sept - 8th Oct 2023","Period 6: 9th Oct - 22nd Oct 2023","Period 7: 23rd Oct - 5th Nov 2023","Period 8: 6th Nov - 19th Nov 2023")
levels(data$gender.factor)=c("Female","Male")
levels(data$asa.factor)=c("I (normal healthy patient)","II (mild systemic disease without significant functional limitation)","III (severe systemic disease with significant functional limitation)","IV (severe systemic disease with constant threat to life)","V (critically ill patient not expected to survive without the operation)","Unknown")
levels(data$bmi.factor)=c("Underweight BMI Below 18.5","Normal weight BMI 18.5-24.9","Pre-obesity BMI 25.0-29.9","Obesity class I BMI 30.0-34.9","Obesity class II BMI 35.0-39.9","Obesity class III BMI 40+","Unknown")
levels(data$frailty.factor)=c("1 (Very fit)","2 (Well)","3 (Managing well)","4 (Vulnerable)","5 (Mildly frail)","6 (Moderately frail)","7 (Severely frail)","8 (Very severely frail)","9 (Terminally ill)","Unknown")
levels(data$pt_comorbid_dm.factor)=c("Diet-Controlled","Medication (non-insulin) controlled","Insulin-controlled","Unknown")
levels(data$pt_comorbid_tumour.factor)=c("Localised","Metastatic","Unknown")
levels(data$pt_comorbid_liver.factor)=c("Mild","Moderate to Severe","Unknown")
levels(data$pt_comorbid_ckd.factor)=c("Stage I","Stage II","Stage IIIa","Stage IIIb","Stage IV","Stage V","Unknown")
levels(data$hist_ac.factor)=c("Yes","No")
levels(data$pre_img_us.factor)=c("Yes","No (Not available)","No (Not indicated)","No (Patient declined)","Unknown")
levels(data$pre_img_ct.factor)=c("Yes","No (Not available)","No (Not indicated)","No (Patient declined)","Unknown")
levels(data$pre_img_mrcp.factor)=c("Yes","No (Not available)","No (Not indicated)","No (Patient declined)","Unknown")
levels(data$pre_img_ercp.factor)=c("Yes","No (Not available)","No (Not indicated)","No (Patient declined)","Unknown")
levels(data$pre_img_eus.factor)=c("Yes","No (Not available)","No (Not indicated)","No (Patient declined)","Unknown")
levels(data$pre_img_hida.factor)=c("Yes","No (Not available)","No (Not indicated)","No (Patient declined)","Unknown")
levels(data$pre_urgency.factor)=c("Elective","Delayed","Emergency")
levels(data$pre_urgency_ele_list.factor)=c("No","Yes","Unknown")
levels(data$pre_indication.factor)=c("Acute calculous cholecystitis","Biliary colic","Acalculous cholecystitis","Chronic calculous cholecystitis","Common Bile Duct (CBD) stone","Gallbladder polyp","Dyskinesia","Gallstone pancreatitis")
levels(data$pre_indication_tg.factor)=c("I","II","III")
levels(data$pre_indication_tg_doc.factor)=c("No","Yes")
levels(data$pre_indication_atlanta.factor)=c("Mild","Moderate","Severe")
levels(data$pre_indication_atlanta_doc.factor)=c("No","Yes")
levels(data$preop_data_fields_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$op_anaes_regional.factor)=c("Spine-related","Regional nerve block")
levels(data$op_anaes_inhaled.factor)=c("Sevoflurane","Halothane","Desflurane","Nitric Oxide (N2O)","Isoflurane","Unknown")
levels(data$op_abx_yn.factor)=c("No","Yes","Unknown")
levels(data$op_abx_indication.factor)=c("Prophylactic","Intraoperative spillage","Cholecystitis")
levels(data$op_operator.factor)=c("Consultant or attending {op_operator_cons}","Senior trainee (i.e., senior registrar or resident with >4 years surgical training/residency)","Junior trainee (i.e., junior registrar or resident with ≤ 4 years surgical training/residency)","Non-surgeon (e.g., medical practitioner or nurse)")
levels(data$op_operator_n.factor)=c("0-50","51-100","101-200",">200")
levels(data$op_operator_cons.factor)=c("General","Oesophago-gastric (OG)","HPB","Colorectal","Breast","Vascular","Other {op_operator_cons_other}")
levels(data$op_operator_trainee_op.factor)=c("No","Yes","Unknown")
levels(data$op_operator_trainee_cons.factor)=c("No","Yes","Unknown")
levels(data$op_approach.factor)=c("Open","Open conversion","Laparoscopic","Robotic")
levels(data$op_approach_mis_type.factor)=c("Standard","Single Incision Laparoscopic Surgery (SILS)")
levels(data$op_approach_open_reason.factor)=c("No laparoscopic equipment","Surgeon not trained in laparoscopy","Laparoscopy equipment broken","Multiple previous surgery","Disease severity")
levels(data$op_approach_conv_reason.factor)=c("Suboptimal view","Adhesions","Not able to safely dissect CVS","Suspected bile duct injury","Patient unable to tolerate pneumoperitoneum","Bleeding","Bowel injury","Laparoscopic or robotic equipment failure","Suspected or actual cholecystoduodenal or cholecystocolonic fistula")
levels(data$op_approach_mis_gas.factor)=c("No","Yes","Unknown")
levels(data$op_approach_mis_reuse.factor)=c("No","Yes","Unknown")
levels(data$op_nassar.factor)=c("I","II","III","IV","V","Unknown")
levels(data$op_cvs_yn.factor)=c("Yes (CVS documented as obtained)","No (CVS documented as not obtained)","CVS not documented")
levels(data$op_cvs_to.factor)=c("No","Yes","Unknown")
levels(data$op_performed.factor)=c("Total cholecystectomy {op_performed_tcs}","Subtotal cholecystectomy {op_performed_stc}","Not performed {op_performed_no}")
levels(data$op_performed_tcs.factor)=c("Standard approach","Fundus-first (top down) approach")
levels(data$op_performed_stc.factor)=c("Reconstituting (closes off the lower end of the gallbladder, creating a remnant gallbladder)","Fenestrated (does not occlude the gallbladder but may suture the cystic duct internally)")
levels(data$op_performed_no.factor)=c("Diagnostic laparoscopy","Cholecystostomy")
levels(data$op_drain_yn.factor)=c("No","Yes")
levels(data$op_biliary_var.factor)=c("No","Yes","Unknown")
levels(data$op_img_desc.factor)=c("Selective","Routine")
levels(data$op_img_desc_select.factor)=c("Raised liver function test","Concern of a bile duct injury","Pre-operative imaging suggestive of CBD stone")
levels(data$op_img_stone_yn.factor)=c("Stone","No stone")
levels(data$op_img_stone_mx.factor)=c("Flushing with saline and smooth muscle relaxant","Fogarty catheter trawl","Basket retrieval","Choledocholescope","No intraoperative treatment attempted")
levels(data$op_cbd_explore.factor)=c("Yes (Trancystic)","Yes (Choledochotomy)","No")
levels(data$op_cbd_explore_close.factor)=c("Primary closure","T-tube")
levels(data$op_contam.factor)=c("Clean (Gastrointestinal (GI) and genitourinary (GU) tract not entered)","Clean-Contaminated (GI or GU tracts entered but no gross contamination)","Contaminated (GI or GU tracts entered with gross spillage or major break in sterile technique)","Dirty (There is already contamination prior to operation, e.g., faeces or bile).")
levels(data$op_reuse_gown.factor)=c("No","Yes {op_reuse_gown_usage}","Unknown")
levels(data$op_reuse_gown_usage.factor)=c("All scrubbed staff","Some scrubbed staff")
levels(data$op_reuse_drape.factor)=c("No","Yes","Unknown")
levels(data$intraop_data_fields_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$postop30_cd.factor)=c("0 (no complications)","I","II","IIIa","IIIb","IVa","IVb","V (death)")
levels(data$postop30_cd_drain.factor)=c("Yes","No")
levels(data$postop30_cd_reop.factor)=c("Yes","No")
levels(data$postop30_cc_yn.factor)=c("Yes","No")
levels(data$postop30_reimg.factor)=c("No","Yes {postop30_reimg_type}")
levels(data$postop30_comp_ssi.factor)=c("0 (no complication)","I","II","IIIa","IIIb","IVa","IVb","V (death)")
levels(data$postop30_comp_ppc.factor)=c("0 (no complication)","I","II","IIIa","IIIb","IVa","IVb","V (death)")
levels(data$postop30_comp_leak.factor)=c("0 (no complication)","I","II","IIIa","IIIb","IVa","IVb","V (death)")
levels(data$postop30_comp_bleed.factor)=c("0 (no complication)","I","II","IIIa","IIIb","IVa","IVb","V (death)")
levels(data$postop30_comp_collec.factor)=c("0 (no complication)","I","II","IIIa","IIIb","IVa","IVb","V (death)")
levels(data$postop30_comp_ap.factor)=c("0 (no complication)","I","II","IIIa","IIIb","IVa","IVb","V (death)")
levels(data$postop30_readm.factor)=c("Yes","No")
levels(data$day_outcomes_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$bdi_yn.factor)=c("Yes","No")
levels(data$bdi_pres.factor)=c("Intraoperatively","Controlled bile leak from surgically placed abdominal drain","Abdominal pain due to uncontrolled bile leak","Obstructive jaundice or cholangitis","Intra-abdominal abscess or biloma")
levels(data$bdi_strasberg.factor)=c("A","B","C","D","E1","E2","E3","E4","E5","Unknown")
levels(data$bdi_concvasc.factor)=c("No","Yes {bdi_concvasc_loc}","Unknown")
levels(data$bdi_concvasc_loc.factor)=c("Right hepatic artery","Common hepatic artery","Main portal vein","Right portal vein")
levels(data$bdi_spec.factor)=c("No","Yes","Not required (Injury occurred at specialist HPB centre)")
levels(data$bdi_spec_transfer.factor)=c("Yes","No")
levels(data$bdi_repair_spec.factor)=c("HPB surgeon","Upper GI surgeon","General surgeon")
levels(data$bdi_repair_method.factor)=c("Roux-en-Y Hepaticojejunostomy","CBD repair without T-tube","CBD repair with T-tube","CBD end to end anastomosis","Hepaticoduodenostomy")
levels(data$bdi_repair_vasc.factor)=c("Yes","No")
levels(data$bdi_data_fields_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$hist_exam_yn.factor)=c("Yes, sent for examination","No, not sent for examination")
levels(data$hist_ind.factor)=c("Routine","Selective")
levels(data$hist_result.factor)=c("Benign","Malignant")
levels(data$hist_tnm_t.factor)=c("Tis","T1a (lamina propria)","T1b (muscularis)","T2a (peritoneal side)","T2b (hepatic side)","T3","T4")
levels(data$hist_tnm_n.factor)=c("N0","N1 (1-3 nodes)","N2 (>3 nodes)")
levels(data$hist_tnm_m.factor)=c("M0","M1")
levels(data$hist_mdt.factor)=c("No","Yes","Unknown")
levels(data$hist_rev_surg.factor)=c("Yes","No (not required)","No (unresectable tumour)")
levels(data$hist_rev_surg_type_liv.factor)=c("Liver bed","One segment","Two segments","≥ 3 segments")
levels(data$hist_rev_surg_rms.factor)=c("R0","R1","R2")
levels(data$hist_rev_surg_li.factor)=c("Yes","No")
levels(data$hist_rev_surg_pi.factor)=c("Yes","No")
levels(data$hist_recur.factor)=c("Yes","No")
levels(data$histology_data_fields_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$inclusion_exclusion.factor)=c("Include - this is a valid record for a patient who fulfils inclusion criteria","Exclude - patient does not fulfil inclusion criteria","Exclude - duplicate record","Exclude - patient withdrew consent","Exclude - test/practice record or record created by error")
levels(data$include_or_exclude_record_complete.factor)=c("Incomplete","Unverified","Complete")


#Setting Labels

label(data$record_id)="Record ID"
label(data$redcap_data_access_group)="Data Access Group"
label(data$time_entered)="Time"
label(data$user_start)="User started the form"
label(data$intro_text)="IMPORTANT NOTE BEFORE ENTERING DATAPlease only enter data if you have local approval/ethics in place, if you have requested ethics and this is in process, please store data locally and only enter it to REDCap once ethics has been approved. Please tick to confirm that your institution agrees to be bound by the terms and conditions of the Data Contributor Agreement, available here "
label(data$period)=" Under which data collection period did this patient have surgery?"
label(data$age_years)=" Age"
label(data$gender)=" Sex at birth"
label(data$asa)="ASA grade (ASA grade descriptions found here)"
label(data$bmi)=" Body Mass Index (BMI)"
label(data$frailty)="Clinical Frailty Scale (Clinical Frailty Scale descriptions found here)"
label(data$pt_comorbid)=" Comorbidities Tick all that apply"
label(data$pt_comorbid_dm)="Diabetes"
label(data$pt_comorbid_tumour)="Solid Tumour"
label(data$pt_comorbid_liver)="Liver disease"
label(data$pt_comorbid_ckd)="Chronic Kidney Disease"
label(data$hist_ac)="History of acute cholecystitis or cholangitis (Tokyo TG18 definition of acute cholecystitis found here) (Tokyo TG18 definition of cholangitis found here)"
label(data$admission_prior)=" Number of admissions with biliary symptoms in previous 12 months prior to surgery"
label(data$pre_img_us)=" Ultrasound scan (USS)"
label(data$pre_img_ct)=" Computed Tomography (CT)"
label(data$pre_img_mrcp)=" Magnetic Resonance Cholangiopancreatography (MRCP)"
label(data$pre_img_ercp)=" Endoscopic Retrograde Cholangiopancreatography (ERCP)"
label(data$pre_img_eus)=" Endoscopic Ultrasound (EUS)"
label(data$pre_img_hida)=" Hepatobiliary IminoDiacetic Acid (HIDA)"
label(data$pre_img_finding)=" Preoperative imaging findings"
label(data$pre_img_finding_cbd)="Dilated CBD diameter"
label(data$pre_symp_adm_day)=" Days between first biliary symptom onset and diagnosis"
label(data$pre_symp_adm_months)="months symptom to diagnosis"
label(data$pre_diag_dec_day)=" Days between diagnosis and decision to operate"
label(data$pre_diag_dec_months)="months diagnosis to decision to operate"
label(data$pre_dec_op_day)=" Days between decision to operate and surgery performed"
label(data$pre_dec_op_months)="months decision to operate to surgery"
label(data$pre_urgency)="Urgency of surgery (Surgery urgency definitions found here)"
label(data$pre_urgency_ele_list)=" Was the patient already on the elective waiting list for surgery?"
label(data$pre_indication)="Indication of surgery (Surgery indication definitions found here)"
label(data$pre_indication_tg)="What was the Tokyo grade for this patient with acute calculous cholecystitis? (Tokyo grade definitions found here)"
label(data$pre_indication_tg_doc)=" Was the Tokyo grade documented in patient notes?"
label(data$pre_indication_atlanta)="What was the Atlanta criteria for this patient with gallstone pancreatitis? (Atlanta criteria definitions found here)"
label(data$pre_indication_atlanta_doc)=" Was the Atlanta criteria documented in patient notes?"
label(data$missing_total_pre)="Total number of missing key data fields in the pre-operative form"
label(data$preop_data_fields_complete)="Complete?"
label(data$op_anaes)="Mode of anaesthesiaThis refers to the anaesthetic used during the operation and NOT as induction agents (Tick all that apply)"
label(data$op_anaes_local)="Local anaesthesia"
label(data$op_anaes_regional)="Regional anaesthesia"
label(data$op_anaes_inhaled)="General inhaled anaesthesia"
label(data$op_abx_yn)=" Intraoperative antibiotics  (Defined as administration of antibiotics at least 30 minutes prior to skin incision to end of operation)"
label(data$op_abx_indication)=" Indication for intraoperative antibiotics "
label(data$op_operator)=" Primary operator "
label(data$op_operator_n)=" Number of cholecystectomies performed by the primary operator prior to this procedure "
label(data$op_operator_cons)="Consultant specialty"
label(data$op_operator_cons_other)="Consultant specialty other"
label(data$op_operator_trainee_op)=" Was this a training operation? "
label(data$op_operator_trainee_cons)=" Was a consultant present? "
label(data$op_approach)=" Operative approach "
label(data$op_approach_mis_type)=" Minimally invasive (laparoscopic or robotic) technique "
label(data$op_approach_open_reason)=" Reason for open operative approach "
label(data$op_approach_conv_reason)=" Reason operation is converted to open "
label(data$op_approach_mis_gas)=" Gassless laparoscopic or robotic technique "
label(data$op_approach_mis_reuse)=" Were reusable laparoscopic or robotic equipment used? "
label(data$op_nassar)="Intra-operative difficulty Nassar grade (Nassar grade descriptions found here)"
label(data$op_cvs_yn)="Was the Critical View of Safety (CVS) obtained? (CVS definition found here)"
label(data$op_cvs_elements)=" What elements of the Critical View of Safety (CVS) was achieved? "
label(data$op_cvs_to)=" Was there a time-out to verify CVS  (Defined as a momentary pause that what one is seeing is likely the correct anatomy)"
label(data$op_performed)=" Operation performed "
label(data$op_performed_tcs)="Total cholecystectomy technique"
label(data$op_performed_stc)="Subtotal cholecystectomy technique"
label(data$op_performed_no)="Operation not performed"
label(data$op_drain_yn)=" Abdominal drain insertion "
label(data$op_biliary_var)=" Anatomical Biliary variant "
label(data$op_img)=" Intraoperative CBD Assessment "
label(data$op_img_desc)=" Decision for intraoperative CBD Assessment "
label(data$op_img_desc_select)=" Reason for selective decision of intraoperative CBD Assessment "
label(data$op_img_stone_yn)=" Intraoperative CBD assessment findings "
label(data$op_img_stone_mx)=" Intraoperative CBD stone management "
label(data$op_cbd_explore)=" Common Bile Duct exploration "
label(data$op_cbd_explore_close)=" Choledochotomy closure "
label(data$op_contam)=" Operative contamination "
label(data$op_comp)=" Intraoperative complications - excluding bile duct injury (BDI)  (Please go to section 4 (BDI data fields) for BDI-related data entry)"
label(data$op_reuse_gown)=" Were reusable gowns used in this procedure? "
label(data$op_reuse_gown_usage)="Reusable gowns usage"
label(data$op_reuse_drape)=" Were reusable drapes used in this procedure? "
label(data$missing_total_intraop)="Total number of missing key data fields in the intraoperative form"
label(data$intraop_data_fields_complete)="Complete?"
label(data$postop30_cd)="Highest 30-day Clavien Dindo Complication Grade (Clavien-Dindo Classification found here)"
label(data$postop30_cd_drain)=" Radiological drainage "
label(data$postop30_cd_reop)=" Re-operation "
label(data$op_cd_death)=" Time from index cholecystectomy to death "
label(data$postop30_cc_yn)=" Unplanned critical care admission  (Where critical care admission was not part of pre-operative plan)"
label(data$post30_cc_los)=" Critical care length of stay  (Where discharge from critical care < 23 hours from operation, enter 0. If the patient has not been discharged from critical care prior to the end of 30-day follow-up, enter 31)"
label(data$postop30_reimg)=" Unplanned re-imaging  (Where imaging in post-operative period (e.g., CT, MRCP) was not part of pre-operative plan)"
label(data$postop30_reimg_type)="Re-imaging type"
label(data$postop30_comp_ssi)=" Surgical site infection "
label(data$postop30_comp_ppc)=" Postoperative pulmonary complications "
label(data$postop30_comp_leak)=" Bile leak "
label(data$postop30_comp_bleed)=" Bleeding "
label(data$postop30_comp_collec)=" Intra-abdominal collection "
label(data$postop30_comp_ap)=" Acute pancreatitis "
label(data$post30_los)=" Length of stay  (Where discharge < 23 hours, enter 0. If the patient has not been discharged prior to the end of 30-day follow-up, enter 31)"
label(data$postop30_readm)=" Unplanned readmission within 30 days of day of surgery "
label(data$postop30_readm_los)=" Readmission length of stay "
label(data$missing_total_postop30)="Total number of missing key data fields in the 30-day outcomes form"
label(data$day_outcomes_complete)="Complete?"
label(data$bdi_yn)=" Did this patient suffer from a Bile Duct Injury (BDI)? "
label(data$bdi_pres)=" Presentation of BDI "
label(data$bdi_day)=" Days from index cholecystectomy to BDI diagnosis "
label(data$bdi_strasberg)="Strasberg bile duct injury grade (BDI grading found here)"
label(data$bdi_concvasc)=" Concomitant vascular injury "
label(data$bdi_concvasc_loc)="Concomitant vascular injury location"
label(data$bdi_img)="Imaging modality to investigate and confirm BDITick all that apply"
label(data$bdi_spec)=" Discussion with a specialist HPB centre "
label(data$bdi_spec_day)=" Time from injury to referral "
label(data$bdi_spec_transfer)=" Transferred to specialist HPB centre "
label(data$bdi_mx)="Management of Bile duct injuryTick all that apply"
label(data$bdi_ercp_day)=" Time from index cholecystectomy to ERCP for BDI management  "
label(data$bdi_ercpstent_day)=" Time from index cholecystectomy to ERCP and stent for BDI management  "
label(data$bdi_ptc_day)=" Time from index cholecystectomy to PTC for BDI management "
label(data$bdi_washout_day)=" Time from index cholecystectomy to washout for BDI management  "
label(data$bdi_repair_day)=" Time from index cholecystectomy to surgical repair for BDI management "
label(data$bdi_repair_spec)=" Specialty of surgeon performing BDI repair "
label(data$bdi_repair_method)=" Method of BDI surgical repair "
label(data$bdi_repair_vasc)=" Vascular repair "
label(data$bdi_repair_comp)="One-year complications post BDI surgical repairTick all that apply"
label(data$bdi_repair_stric_day)=" Time from BDI surgical repair to stricture formation "
label(data$bdi_repair_chol_day)=" Time from BDI surgical repair to cholangitis "
label(data$bdi_repair_anas_day)=" Time from BDI surgical repair to anastomotic leakage "
label(data$bdi_repair_coll_day)=" Time from BDI surgical repair to intra-abdominal abscess or biloma "
label(data$bdi_repair_reop_day)=" Time from BDI surgical repair to re-repair "
label(data$bdi_data_fields_complete)="Complete?"
label(data$hist_exam_yn)=" Histological specimen sent for examination "
label(data$hist_ind)=" Indication for sending specimen for histological examination "
label(data$hist_result_day)=" Time from index cholecystectomy to histology result "
label(data$hist_result)=" Histology result "
label(data$hist_staging)="Staging investigations after index cholecystectomyTick all that apply"
label(data$hist_staging_cttap_day)=" Time from histology result to CT thorax abdomen pelvis staging "
label(data$hist_staging_mri_day)=" Time from histology result to MRI liver staging "
label(data$hist_staging_pet_day)=" Time from histology result to PET-CT staging "
label(data$hist_staging_lap_day)=" Time from histology result to laparoscopy staging "
label(data$hist_tnm_t)="T category"
label(data$hist_tnm_n)="N category"
label(data$hist_tnm_m)="M category"
label(data$hist_mdt)=" Discussed at MDT "
label(data$hist_adjv)="Adjuvant treatmentTick all that apply"
label(data$hist_rev_surg)=" Revisional surgery completed "
label(data$hist_rev_surg_type)="Revisional surgery typeTick all that apply"
label(data$hist_rev_surg_type_liv)="Liver resection extent"
label(data$hist_rev_surg_day)=" Time from histology result to revisional surgery "
label(data$hist_rev_surg_rms)="Resection margin status"
label(data$hist_rev_surg_li)="Lymphovascular invasion"
label(data$hist_rev_surg_pi)="Perineural invasion"
label(data$hist_recur)=" Recurrence on imaging at one year "
label(data$hist_recur_day)=" Time from surgery to recurrence "
label(data$histology_data_fields_complete)="Complete?"
label(data$inclusion_exclusion)=" Should this record be included in the analysis?"
label(data$include_or_exclude_record_complete)="Complete?"
#Setting Units