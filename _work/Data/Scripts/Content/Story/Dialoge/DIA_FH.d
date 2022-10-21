// ************************************************************

//			Face Helper

// ************************************************************


var int 	FH_SkinTexture;
var string 	FH_HeadMesh;	
var int 	FH_HeadMesh_DEFAULT_Hilfsvariable;
var int 	SEX;

// ************************************************************
// 			Change Face Helper Visual
// ************************************************************

FUNC VOID	Change_FH_Visual()
{
	if  (FH_HeadMesh_DEFAULT_Hilfsvariable == 0)
		{
		FH_HeadMesh = "Hum_Head_Bald";
		FH_HeadMesh_DEFAULT_Hilfsvariable = 1;
		};
	if  (FH_SkinTexture < 0)
		{
			FH_SkinTexture = 0;
			PrintScreen	("MINUS-Brak twarzy!!!!!" , -1, -1, "FONT_OLD_10_WHITE.TGA", 2);		
		};
		
	B_SetNpcVisual 		(self, SEX, FH_HeadMesh, FH_SkinTexture, BodyTex_N, NO_ARMOR);		

	var string printText;

	PrintScreen	("Tekstura skóry:" 		, -1, 10, "FONT_OLD_10_WHITE.TGA", 4 );
	
	printText = IntToString	(FH_SkinTexture);
	PrintScreen	(printText		, -1, 12, "FONT_OLD_10_WHITE.TGA", 2 );
	
	
	PrintScreen	("G³owa:"		, -1, 20, "FONT_OLD_10_WHITE.TGA", 2 );
	PrintScreen	(FH_HeadMesh		, -1, 22, "FONT_OLD_10_WHITE.TGA", 2 );

};

// ************************************************************
// 			     EXIT 
// ************************************************************


INSTANCE DIA_FH_EXIT (C_INFO)
{
	npc			= FH;
	nr			= 999;
	condition		= DIA_FH_EXIT_Condition;
	information		= DIA_FH_EXIT_Info;
	permanent		= 1;
	description 		= DIALOG_ENDE;
};                       

FUNC INT DIA_FH_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_FH_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			Next Face
// ************************************************************

INSTANCE DIA_FH_NextFace (C_INFO)
{
	npc			= FH;
	nr			= 3;
	condition		= DIA_FH_NextFace_Condition;
	information		= DIA_FH_NextFace_Info;
	permanent		= 1;
	description		= "Nastêpna twarz";
};                       

FUNC INT DIA_FH_NextFace_Condition()
{
	return 1;
};

FUNC VOID DIA_FH_NextFace_Info()
{	
	FH_SkinTexture = FH_SkinTexture+1;
	Change_FH_Visual();
};

// ************************************************************
// 			Next Face 10 step
// ************************************************************

INSTANCE DIA_FH_NextFace10 (C_INFO)
{
	npc			= FH;
	nr			= 5;
	condition		= DIA_FH_NextFace10_Condition;
	information		= DIA_FH_NextFace10_Info;
	permanent		= 1;
	description		= "10 wzorów do przodu";
};                       

FUNC INT DIA_FH_NextFace10_Condition()
{
	return 1;
};

FUNC VOID DIA_FH_NextFace10_Info()
{	
	FH_SkinTexture = FH_SkinTexture+10;
	Change_FH_Visual();
};
// ************************************************************
// 			Previous Face
// ************************************************************

INSTANCE DIA_FH_PreviousFace (C_INFO)
{
	npc			= FH;
	nr			= 4;
	condition		= DIA_FH_PreviousFace_Condition;
	information		= DIA_FH_PreviousFace_Info;
	permanent		= 1;
	description		= "Poprzednia twarz";
};                       

FUNC INT DIA_FH_PreviousFace_Condition()
{
	return 1;
};

FUNC VOID DIA_FH_PreviousFace_Info()
{	
	FH_SkinTexture = FH_SkinTexture-1;
	Change_FH_Visual();
};
// ************************************************************
// 			Previous Face
// ************************************************************

INSTANCE DIA_FH_PreviousFace10 (C_INFO)
{
	npc			= FH;
	nr			= 6;
	condition		= DIA_FH_PreviousFace10_Condition;
	information		= DIA_FH_PreviousFace10_Info;
	permanent		= 1;
	description		= "10 wzorów wstecz";
};                       

FUNC INT DIA_FH_PreviousFace10_Condition()
{
	return 1;
};

FUNC VOID DIA_FH_PreviousFace10_Info()
{	
	FH_SkinTexture = FH_SkinTexture-10;
	Change_FH_Visual();
};
// ************************************************************
// 			ResetFace
// ************************************************************

INSTANCE DIA_FH_ResetFace (C_INFO)
{
	npc			= FH;
	nr			= 7;
	condition		= DIA_FH_ResetFace_Condition;
	information		= DIA_FH_ResetFace_Info;
	permanent		= 1;
	description		= "Powrót do twarzy domyœlnej";
};                       

FUNC INT DIA_FH_ResetFace_Condition()
{
	return 1;
};

FUNC VOID DIA_FH_ResetFace_Info()
{	
	FH_SkinTexture = 0;
	Change_FH_Visual();
};

// ************************************************************
// 			WomanFace
// ************************************************************

INSTANCE DIA_FH_WomanFace (C_INFO)
{
	npc			= FH;
	nr			= 8;
	condition		= DIA_FH_WomanFace_Condition;
	information		= DIA_FH_WomanFace_Info;
	permanent		= 1;
	description		= "Twarze kobiece";
};                       

FUNC INT DIA_FH_WomanFace_Condition()
{
	return 1;
};

FUNC VOID DIA_FH_WomanFace_Info()
{	
	FH_SkinTexture = 137;
	Change_FH_Visual();
};

// ************************************************************
// 		aktuelle Anzeige wiederholen
// ************************************************************
INSTANCE DIA_FH_Repeat (C_INFO)
{
	npc			= FH;
	nr			= 1;
	condition		= DIA_FH_Repeat_Condition;
	information		= DIA_FH_Repeat_Info;
	permanent		= 1;
	description		= "Powtórzenie dzia³ania";
};                       

FUNC INT DIA_FH_Repeat_Condition()
{
	return 1;
};

FUNC VOID DIA_FH_Repeat_Info()
{	
	Change_FH_Visual();
};

// ************************************************************
// 		aSEX
// ************************************************************
INSTANCE DIA_FH_Sex (C_INFO)
{
	npc			= FH;
	nr			= 9;
	condition		= DIA_FH_Sex_Condition;
	information		= DIA_FH_Sex_Info;
	permanent		= 1;
	description		= "P³eæ";
};                       

FUNC INT DIA_FH_Sex_Condition()
{
	return 1;
};

FUNC VOID DIA_FH_Sex_Info()
{	
	if (sex == MALE)
	{
		sex = FEMALE;
	}
	else //Female
	{
		sex = MALE;		
	};

	Change_FH_Visual();
};


// ************************************************************
// 			KOPF
// ************************************************************

INSTANCE DIA_FH_Choose_HeadMesh (C_INFO)
{
	npc			= FH;
	nr			= 2;
	condition		= DIA_FH_Choose_HeadMesh_Condition;
	information		= DIA_FH_Choose_HeadMesh_Info;
	permanent		= 1;
	description		= "Wybór g³owy";
};                       

FUNC INT DIA_FH_Choose_HeadMesh_Condition()
{
	return 1;
};

FUNC VOID DIA_FH_Choose_HeadMesh_Info()
{	
	Info_ClearChoices	(DIA_FH_Choose_HeadMesh);

	Info_AddChoice		(DIA_FH_Choose_HeadMesh, "Powrót" 				, DIA_FH_Choose_HeadMesh_7);
	Info_AddChoice		(DIA_FH_Choose_HeadMesh, "Hum_Head_Psionic" 	, DIA_FH_Choose_HeadMesh_6);
	Info_AddChoice		(DIA_FH_Choose_HeadMesh, "Hum_Head_Thief" 		, DIA_FH_Choose_HeadMesh_5);
	Info_AddChoice		(DIA_FH_Choose_HeadMesh, "Hum_Head_Bald" 		, DIA_FH_Choose_HeadMesh_4);
	Info_AddChoice		(DIA_FH_Choose_HeadMesh, "Hum_Head_Pony" 		, DIA_FH_Choose_HeadMesh_3);
	Info_AddChoice		(DIA_FH_Choose_HeadMesh, "Hum_Head_Fighter" 	, DIA_FH_Choose_HeadMesh_2);
	Info_AddChoice		(DIA_FH_Choose_HeadMesh, "Hum_Head_FatBald" 	, DIA_FH_Choose_HeadMesh_1);

	Info_AddChoice		(DIA_FH_Choose_HeadMesh, "Hum_Head_BabeHair", DIA_FH_Choose_HeadMesh_17);
	Info_AddChoice		(DIA_FH_Choose_HeadMesh, "Hum_Head_Babe8" 	, DIA_FH_Choose_HeadMesh_16);
	Info_AddChoice		(DIA_FH_Choose_HeadMesh, "Hum_Head_Babe7" 	, DIA_FH_Choose_HeadMesh_15);
	Info_AddChoice		(DIA_FH_Choose_HeadMesh, "Hum_Head_Babe6" 	, DIA_FH_Choose_HeadMesh_14);
	Info_AddChoice		(DIA_FH_Choose_HeadMesh, "Hum_Head_Babe5" 	, DIA_FH_Choose_HeadMesh_13);
	Info_AddChoice		(DIA_FH_Choose_HeadMesh, "Hum_Head_Babe4" 	, DIA_FH_Choose_HeadMesh_12);
	Info_AddChoice		(DIA_FH_Choose_HeadMesh, "Hum_Head_Babe3" 	, DIA_FH_Choose_HeadMesh_11);
	Info_AddChoice		(DIA_FH_Choose_HeadMesh, "Hum_Head_Babe2" 	, DIA_FH_Choose_HeadMesh_10);
	Info_AddChoice		(DIA_FH_Choose_HeadMesh, "Hum_Head_Babe1" 	, DIA_FH_Choose_HeadMesh_9);
	Info_AddChoice		(DIA_FH_Choose_HeadMesh, "Hum_Head_Babe" 	, DIA_FH_Choose_HeadMesh_8);
};


func void DIA_FH_Choose_HeadMesh_8()
{ 
	Info_ClearChoices	(DIA_FH_Choose_HeadMesh);
	FH_HeadMesh 	="Hum_Head_Babe";	
	Change_FH_Visual();
};
func void DIA_FH_Choose_HeadMesh_9()
{ 
	Info_ClearChoices	(DIA_FH_Choose_HeadMesh);
	FH_HeadMesh 	="Hum_Head_Babe1";
	Change_FH_Visual();
};
func void DIA_FH_Choose_HeadMesh_10()
{ 
	Info_ClearChoices	(DIA_FH_Choose_HeadMesh);
	FH_HeadMesh 	="Hum_Head_Babe2";	
	Change_FH_Visual();
};
func void DIA_FH_Choose_HeadMesh_11()
{ 
	Info_ClearChoices	(DIA_FH_Choose_HeadMesh);
	FH_HeadMesh 	="Hum_Head_Babe3";	
	Change_FH_Visual();
};
func void DIA_FH_Choose_HeadMesh_12()
{ 
	Info_ClearChoices	(DIA_FH_Choose_HeadMesh);
	FH_HeadMesh 	="Hum_Head_Babe4";	
	Change_FH_Visual();
};
func void DIA_FH_Choose_HeadMesh_13()
{ 
	Info_ClearChoices	(DIA_FH_Choose_HeadMesh);
	FH_HeadMesh 	="Hum_Head_Babe5";	
	Change_FH_Visual();
};
func void DIA_FH_Choose_HeadMesh_14()
{ 
	Info_ClearChoices	(DIA_FH_Choose_HeadMesh);
	FH_HeadMesh 	="Hum_Head_Babe6";	
	Change_FH_Visual();
};
func void DIA_FH_Choose_HeadMesh_15()
{ 
	Info_ClearChoices	(DIA_FH_Choose_HeadMesh);
	FH_HeadMesh 	="Hum_Head_Babe7";	
	Change_FH_Visual();
};
func void DIA_FH_Choose_HeadMesh_16()
{ 
	Info_ClearChoices	(DIA_FH_Choose_HeadMesh);
	FH_HeadMesh 	="Hum_Head_Babe8";	
	Change_FH_Visual();
};
func void DIA_FH_Choose_HeadMesh_17()
{ 
	Info_ClearChoices	(DIA_FH_Choose_HeadMesh);
	FH_HeadMesh 	="Hum_Head_BabeHair";	
	Change_FH_Visual();
};
// ------------------------------------------------

func void DIA_FH_Choose_HeadMesh_1()
{ 
	Info_ClearChoices	(DIA_FH_Choose_HeadMesh);
	FH_HeadMesh 	="Hum_Head_FatBald";	
	Change_FH_Visual();
};
func void DIA_FH_Choose_HeadMesh_2()
{ 
	Info_ClearChoices	(DIA_FH_Choose_HeadMesh);
	FH_HeadMesh 	="Hum_Head_Fighter";
	Change_FH_Visual();
};
func void DIA_FH_Choose_HeadMesh_3()
{ 
	Info_ClearChoices	(DIA_FH_Choose_HeadMesh);
	FH_HeadMesh 	="Hum_Head_Pony";
	Change_FH_Visual();
};
func void DIA_FH_Choose_HeadMesh_4()
{ 
	Info_ClearChoices	(DIA_FH_Choose_HeadMesh);
	FH_HeadMesh 	="Hum_Head_Bald";
	Change_FH_Visual();
};
func void DIA_FH_Choose_HeadMesh_5()
{ 
	Info_ClearChoices	(DIA_FH_Choose_HeadMesh);
	FH_HeadMesh 	="Hum_Head_Thief";
	Change_FH_Visual();
};
func void DIA_FH_Choose_HeadMesh_6()
{ 
	Info_ClearChoices	(DIA_FH_Choose_HeadMesh);
	FH_HeadMesh 	="Hum_Head_Psionic";
	Change_FH_Visual();
};
func void DIA_FH_Choose_HeadMesh_7()
{ 
	Info_ClearChoices	(DIA_FH_Choose_HeadMesh);
};















