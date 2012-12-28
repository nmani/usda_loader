DROP TABLE IF EXISTS DATA_SRC,DATSRCLN,DERIV_CD,FD_GROUP,FOOD_DES,FOOTNOTE,
LANGDESC,LANGUAL,NUT_DATA,NUTR_DEF,SRC_CD,WEIGHT,ABBREV;

-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------

-- That file uses encoding UTF-8

CREATE TABLE `DATA_SRC`
 (
	`DataSrc_ID`			varchar (12), 
	`Authors`			varchar (510), 
	`Title`			varchar (510), 
	`Year`			varchar (8), 
	`Journal`			varchar (270), 
	`Vol_City`			varchar (32), 
	`Issue_State`			varchar (10), 
	`Start_Page`			varchar (10), 
	`End_Page`			varchar (10)
);

CREATE TABLE `DATSRCLN`
 (
	`NDB_No`			varchar (10), 
	`Nutr_No`			varchar (6), 
	`DataSrc_ID`			varchar (12)
);

CREATE TABLE `DERIV_CD`
 (
	`Deriv_CD`			varchar (8), 
	`Deriv_Desc`			varchar (240)
);

CREATE TABLE `FD_GROUP`
 (
	`FdGrp_CD`			varchar (10), 
	`FdGrp_Desc`			varchar (120)
);

CREATE TABLE `FOOD_DES`
 (
	`NDB_No`			varchar (10), 
	`FdGrp_Cd`			varchar (8), 
	`Long_Desc`			varchar (400), 
	`Shrt_Desc`			varchar (120), 
	`ComName`			varchar (200), 
	`ManufacName`			varchar (130), 
	`Survey`			varchar (2), 
	`Ref_Desc`			varchar (270), 
	`Refuse`			int, 
	`SciName`			varchar (130), 
	`N_Factor`			float, 
	`Pro_Factor`			float, 
	`Fat_Factor`			float, 
	`CHO_Factor`			float
);

CREATE TABLE `FOOTNOTE`
 (
	`NDB_NO`			varchar (510), 
	`Footnt_No`			varchar (510), 
	`Footnot_Typ`			varchar (510), 
	`Nutr_No`			varchar (510), 
	`Footnot_Txt`			varchar (510)
);

CREATE TABLE `LANGDESC`
 (
	`Factor`			varchar (12), 
	`Description`			varchar (500)
);

CREATE TABLE `NUT_DATA`
 (
	`NDB_No`			varchar (10), 
	`Nutr_No`			varchar (6), 
	`Nutr_Val`			float, 
	`Num_Data_Pts`			int, 
	`Std_Error`			float, 
	`Src_Cd`			varchar (4), 
	`Deriv_Cd`			varchar (8), 
	`Ref_NDB_No`			varchar (10), 
	`Add_Nutr_Mark`			varchar (2), 
	`Num_Studies`			int, 
	`Min`			float, 
	`Max`			float, 
	`DF`			float, 
	`Low_EB`			float, 
	`Up_EB`			float, 
	`Stat_Cmt`			varchar (20), 
	`AddMod_Date`			varchar (20)
);

CREATE TABLE `NUTR_DEF`
 (
	`Nutr_No`			varchar (6), 
	`Units`			varchar (14), 
	`Tagname`			varchar (40), 
	`NutrDesc`			varchar (120), 
	`Num_Dec`			varchar (2), 
	`SR_Order`			float
);

CREATE TABLE `SRC_CD`
 (
	`Src_Cd`			varchar (4), 
	`SrcCd_Desc`			varchar (120)
);

CREATE TABLE `WEIGHT`
 (
	`NDB_No`			varchar (10), 
	`Seq`			varchar (4), 
	`Amount`			float, 
	`Msre_Desc`			varchar (168), 
	`Gm_Wgt`			float, 
	`Num_Data_Pts`			int
);

CREATE TABLE `ABBREV`
 (
	`NDB_No`			varchar (510), 
	`Shrt_Desc`			varchar (510), 
	`Water_(g)`			float, 
	`Energ_Kcal`			float, 
	`Protein_(g)`			float, 
	`Lipid_Tot_(g)`			float, 
	`Ash_(g)`			float, 
	`Carbohydrt_(g)`			float, 
	`Fiber_TD_(g)`			float, 
	`Sugar_Tot_(g)`			float, 
	`Calcium_(mg)`			float, 
	`Iron_(mg)`			float, 
	`Magnesium_(mg)`			float, 
	`Phosphorus_(mg)`			float, 
	`Potassium_(mg)`			float, 
	`Sodium_(mg)`			float, 
	`Zinc_(mg)`			float, 
	`Copper_mg)`			float, 
	`Manganese_(mg)`			float, 
	`Selenium_(µg)`			float, 
	`Vit_C_(mg)`			float, 
	`Thiamin_(mg)`			float, 
	`Riboflavin_(mg)`			float, 
	`Niacin_(mg)`			float, 
	`Panto_Acid_mg)`			float, 
	`Vit_B6_(mg)`			float, 
	`Folate_Tot_(µg)`			float, 
	`Folic_Acid_(µg)`			float, 
	`Food_Folate_(µg)`			float, 
	`Folate_DFE_(µg)`			float, 
	`Choline_Tot_ (mg)`			float, 
	`Vit_B12_(µg)`			float, 
	`Vit_A_IU`			float, 
	`Vit_A_RAE`			float, 
	`Retinol_(µg)`			float, 
	`Alpha_Carot_(µg)`			float, 
	`Beta_Carot_(µg)`			float, 
	`Beta_Crypt_(µg)`			float, 
	`Lycopene_(µg)`			float, 
	`Lut+Zea_ (µg)`			float, 
	`Vit_E_(mg)`			float, 
	`Vit_D_µg`			float, 
	`ViVit_D_IU`			float, 
	`Vit_K_*(µg)`			float, 
	`FA_Sat_(g)`			float, 
	`FA_Mono_(g)`			float, 
	`FA_Poly_(g)`			float, 
	`Cholestrl_(mg)`			float, 
	`GmWt_1`			float, 
	`GmWt_Desc1`			varchar (510), 
	`GmWt_2`			float, 
	`GmWt_Desc2`			varchar (510), 
	`Refuse_Pct`			float
);

CREATE TABLE `LANGUAL`
 (
	`NDB_No`			varchar (10), 
	`Factor`			varchar (12)
);

