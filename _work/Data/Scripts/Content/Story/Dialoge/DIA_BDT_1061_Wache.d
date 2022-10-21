// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_1061_Wache_EXIT   (C_INFO)
{
	npc         = BDT_1061_Wache;
	nr          = 999;
	condition   = DIA_1061_Wache_EXIT_Condition;
	information = DIA_1061_Wache_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_1061_Wache_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_1061_Wache_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  	Hallo
// ************************************************************
INSTANCE DIA_1061_Wache_Hallo   (C_INFO)
{
	npc         = BDT_1061_Wache;
	nr          = 1;
	condition   = DIA_1061_Wache_Hallo_Condition;
	information = DIA_1061_Wache_Hallo_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_1061_Wache_Hallo_Condition()
{
	return TRUE;
};
FUNC VOID DIA_1061_Wache_Hallo_Info()
{
	AI_Output (self, other, "DIA_1061_Wache_Hallo_01_00");//Halt - du kannst hier nicht vorbei.
	AI_Output (other, self, "DIA_1061_Wache_Hallo_15_01");//Ich will mit deinem Anführer sprechen.
	AI_Output (self, other, "DIA_1061_Wache_Hallo_01_02");//(ironisch) Ach so, du willst mit meinem Boss sprechen. Ja, dann lasse ich dich NATÜRLICH durch.
	AI_Output (self, other, "DIA_1061_Wache_Hallo_01_03");//(todernst) Aber nur wenn du seinen Namen kennst - denn wenn nicht, muss ich dich töten! Also?
	
	Info_ClearChoices (DIA_1061_Wache_Hallo);
	Info_AddChoice (DIA_1061_Wache_Hallo,"Lee",DIA_1061_Wache_Hallo_Lee);
	if (Bdt13_Dexter_verraten == TRUE) 
	|| (Ranger_SCKnowsDexter == TRUE)//ADDON
	{
		Info_AddChoice (DIA_1061_Wache_Hallo,"Dexter",DIA_1061_Wache_Hallo_Dexter);
	};
	Info_AddChoice (DIA_1061_Wache_Hallo,"Diego",DIA_1061_Wache_Hallo_Diego);
	Info_AddChoice (DIA_1061_Wache_Hallo,"Keine Ahnung",DIA_1061_Wache_Hallo_Ahnung);
};
FUNC VOID DIA_1061_Wache_Hallo_Lee()
{
	AI_Output (other, self, "DIA_1061_Wache_Hallo_Lee_15_00");//Lee.
	AI_Output (self, other, "DIA_1061_Wache_Hallo_Lee_01_01");//Tja, wie soll ich sagen? Du hast gerade dein Leben verwirkt, Mann!
	
	Info_ClearChoices (DIA_1061_Wache_Hallo);
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_SuddenEnemyInferno,0);
};
FUNC VOID DIA_1061_Wache_Hallo_Dexter()
{
	AI_Output (other, self, "DIA_1061_Wache_Hallo_Dexter_15_00");//Dexter.
	AI_Output (self, other, "DIA_1061_Wache_Hallo_Dexter_01_01");//Tja ... Schätze, du kennst meinen Boss. Okay, ich lasse dich durch. Aber ich warne dich.
	AI_Output (self, other, "DIA_1061_Wache_Hallo_Dexter_01_02");//Kommst du irgendjemandem zu nahe, kommst du hier nicht mehr lebend raus!
	AI_Output (self, other, "DIA_1061_Wache_Hallo_Dexter_01_03");//Also atme tief durch und lass die Waffen stecken. Dexter findest du im Haus.
	
	Knows_Dexter = TRUE;
	BanditGuard.aivar[AIV_PASSGATE] = TRUE;
	Info_ClearChoices (DIA_1061_Wache_Hallo);
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_1061_Wache_Hallo_Diego()
{
	AI_Output (other, self, "DIA_1061_Wache_Hallo_Diego_15_00");//Diego.
	AI_Output (self, other, "DIA_1061_Wache_Hallo_Diego_01_01");//Richtig!
	AI_Output (self, other, "DIA_1061_Wache_Hallo_Diego_01_02");//Nein, war nur ein Scherz. Du hast keine Ahnung, wer mein Boss ist.
	AI_Output (self, other, "DIA_1061_Wache_Hallo_Diego_01_03");//Dann gibt's auch keinen Grund mehr, warum ich dich nicht töten sollte.
	
	Info_ClearChoices (DIA_1061_Wache_Hallo);
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_SuddenEnemyInferno,0);
};
FUNC VOID DIA_1061_Wache_Hallo_Ahnung()
{
	AI_Output (other, self, "DIA_1061_Wache_Hallo_Ahnung_15_00");//Keine Ahnung.
	AI_Output (self, other, "DIA_1061_Wache_Hallo_Ahnung_01_01");//Dann wirst du wohl dumm sterben.
	
	Info_ClearChoices (DIA_1061_Wache_Hallo);
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_SuddenEnemyInferno,0);
};
// ************************************************************
// 			  Perm
//**************************************
INSTANCE DIA_1061_Wache_Perm   (C_INFO)
{
	npc         = BDT_1061_Wache;
	nr          = 2;
	condition   = DIA_1061_Wache_Perm_Condition;
	information = DIA_1061_Wache_Perm_Info;
	permanent   = TRUE;
	important 	= TRUE;
};
FUNC INT DIA_1061_Wache_Perm_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Knows_Dexter == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_1061_Wache_Perm_Info()
{
	AI_Output (self, other, "DIA_1061_Wache_Perm_01_00");//Denk dran, immer schön ruhig bleiben, dann kommst hier auch lebend wieder raus.
	AI_StopProcessInfos (self);
};
	 
	
