# REDCap factoring script, labelling only, ff_label() instead of Hmisc.
# https://surgicalinformatics.github.io/cookbook/redcap.html#applying-a-redcap-factoring-script
# in addition, leading and trailing spaces in some label names removed.
library(finalfit)


data$record_id %<>% ff_label("Record ID")
data$redcap_data_access_group %<>% ff_label("Data Access Group")
data$period %<>% ff_label("Under which data collection period did this patient have surgery?")
data$op_approach %<>% ff_label("Operative approach")
data$op_approach_mis_type %<>% ff_label("Minimally invasive (laparoscopic or robotic) technique")
data$op_performed %<>% ff_label("Operation performed")
data$age_years %<>% ff_label("Age")
data$gender %<>% ff_label("Sex at birth")
data$asa %<>% ff_label("ASA grade (ASA grade descriptions found here)")
data$bmi %<>% ff_label("Body Mass Index (BMI)")
data$frailty %<>% ff_label("Clinical Frailty Scale (Clinical Frailty Scale descriptions found here)")
data$pt_comorbid %<>% ff_label("Comorbidities Tick all that apply")
data$pt_comorbid_dm %<>% ff_label("Diabetes")
data$pt_comorbid_tumour %<>% ff_label("Solid Tumour")
data$pt_comorbid_liver %<>% ff_label("Liver disease")
data$pt_comorbid_ckd %<>% ff_label("Chronic Kidney Disease")
data$hist_ac %<>% ff_label("History of acute cholecystitis or cholangitis (Tokyo TG18 definition of acute cholecystitis found here) (Tokyo TG18 definition of cholangitis found here)")
data$admission_prior %<>% ff_label("Number of admissions with biliary symptoms in previous 12 months prior to surgery")
data$pre_img_us %<>% ff_label("Ultrasound scan (USS)")
data$pre_img_ct %<>% ff_label("Computed Tomography (CT)")
data$pre_img_mrcp %<>% ff_label("Magnetic Resonance Cholangiopancreatography (MRCP)")
data$pre_img_ercp %<>% ff_label("Endoscopic Retrograde Cholangiopancreatography (ERCP)")
data$pre_img_eus %<>% ff_label("Endoscopic Ultrasound (EUS)")
data$pre_img_hida %<>% ff_label("Hepatobiliary IminoDiacetic Acid (HIDA)")
data$pre_img_finding %<>% ff_label("Preoperative imaging findings")
data$pre_img_finding_cbd %<>% ff_label("Dilated CBD diameter")
data$pre_symp_adm_day %<>% ff_label("Days between first biliary symptom onset and diagnosis")
data$pre_diag_dec_day %<>% ff_label("Days between diagnosis and decision to operate")
data$pre_dec_op_day %<>% ff_label("Days between decision to operate and surgery performed")
data$pre_urgency %<>% ff_label("Urgency of surgery (Surgery urgency definitions found here)")
data$pre_indication %<>% ff_label("Indication of surgery (Surgery indication definitions found here)")
data$pre_indication_tg %<>% ff_label("What was the Tokyo grade for this patient with acute calculous cholecystitis? (Tokyo grade definitions found here)")
data$pre_indication_atlanta %<>% ff_label("What was the Atlanta criteria for this patient with gallstone pancreatitis? (Atlanta criteria definitions found here)")
data$op_anaes %<>% ff_label("Mode of anaesthesiaThis refers to the anaesthetic used during the operation and NOT as induction agents (Tick all that apply)")
data$op_abx_yn %<>% ff_label("Intraoperative antibiotics  (Defined as administration of antibiotics at least 30 minutes prior to skin incision to end of operation)")
data$op_operator %<>% ff_label("Primary operator")
data$op_operator_cons %<>% ff_label("Consultant specialty")
data$op_approach_mis_reuse %<>% ff_label("Were reusable laparoscopic or robotic equipment used?")
data$op_nassar %<>% ff_label("Intra-operative difficulty Nassar grade (Nassar grade descriptions found here)")
data$op_cvs_yn %<>% ff_label("Was the Critical View of Safety (CVS) obtained? (CVS definition found here)")
data$op_drain_yn %<>% ff_label("Abdominal drain insertion")
data$op_biliary_var %<>% ff_label("Anatomical Biliary variant")
data$op_img %<>% ff_label("Intraoperative CBD Assessment")
data$op_cbd_explore %<>% ff_label("Common Bile Duct exploration")
data$op_cbd_explore_close %<>% ff_label("Choledochotomy closure")
data$op_contam %<>% ff_label("Operative contamination")
data$op_comp %<>% ff_label("Intraoperative complications - excluding bile duct injury (BDI)  (Please go to section 4 (BDI data fields) for BDI-related data entry)")
data$op_reuse_gown %<>% ff_label("Were reusable gowns used in this procedure?")
data$op_reuse_drape %<>% ff_label("Were reusable drapes used in this procedure?")
data$postop30_cd %<>% ff_label("Highest 30-day Clavien Dindo Complication Grade (Clavien-Dindo Classification found here)")
data$postop30_cc_yn %<>% ff_label("Unplanned critical care admission  (Where critical care admission was not part of pre-operative plan)")
data$postop30_reimg %<>% ff_label("Unplanned re-imaging  (Where imaging in post-operative period (e.g., CT, MRCP) was not part of pre-operative plan)")
data$postop30_comp_ssi %<>% ff_label("Surgical site infection")
data$postop30_comp_ppc %<>% ff_label("Postoperative pulmonary complications")
data$postop30_comp_leak %<>% ff_label("Bile leak")
data$postop30_comp_collec %<>% ff_label("Intra-abdominal collection")
data$postop30_comp_ap %<>% ff_label("Acute pancreatitis")
data$post30_los %<>% ff_label("Length of stay")
data$postop30_readm %<>% ff_label("Unplanned readmission within 30 days of day of surgery")
data$bdi_yn %<>% ff_label("Bile Duct Injury (BDI)")
data$hist_exam_yn %<>% ff_label("Histological specimen sent for examination")

