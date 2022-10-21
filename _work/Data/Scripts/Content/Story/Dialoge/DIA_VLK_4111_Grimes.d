// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Grimes_EXIT(C_INFO)
{
	npc			= VLK_4111_Grimes;
	nr			= 999;
	condition	= DIA_Grimes_EXIT_Condition;
	information	= DIA_Grimes_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};
//--------------------                       
var int Grimes_First;
//--------------------
FUNC INT DIA_Grimes_EXIT_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Grimes_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				   Hallo 
// ************************************************************
INSTANCE DIA_Grimes_Hallo(C_INFO)
{
	npc			= VLK_4111_Grimes;
	nr			= 2;
	condition	= DIA_Grimes_Hallo_Condition;
	information	= DIA_Grimes_Hallo_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Grimes_Hallo_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_Grimes_Hallo_Info()
{	
	AI_Output (self,other,"DIA_Grimes_Hallo_05_00");//Du? Wer hätte gedacht, dass wir uns noch mal wiedersehen würden?
	AI_Output (self,other,"DIA_Grimes_Hallo_05_01");//So, wie es aussieht, haben wir es wohl beide verstanden, am Leben zu bleiben, und wie du siehst, bin ich dem Schürfen treu geblieben.
	
	if (Grimes_First == FALSE)
	{
		Wld_InsertNpc (Snapper,"OW_PATH_148_A");
		Wld_InsertNpc (Snapper,"OW_PATH_146");
		Wld_InsertNpc (Snapper,"OW_PATH_147");
		Wld_InsertNpc (Snapper,"OW_PATH_148");
		Wld_InsertNpc (Snapper,"OW_PATH_264");
		
		Grimes_First = TRUE;
	};
};
// ************************************************************
// 			  	Erz 
// ************************************************************
INSTANCE DIA_Grimes_Erz(C_INFO)
{
	npc			= VLK_4111_Grimes;
	nr			= 2;
	condition	= DIA_Grimes_Erz_Condition;
	information	= DIA_Grimes_Erz_Info;
	permanent	= FALSE;
	description	= "Wie viel Erz habt ihr bereits gefördert? ";
};                       

FUNC INT DIA_Grimes_Erz_Condition()
{	
	if (Kapitel == 2) 
	&& (MIS_ScoutMine == LOG_RUNNING)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_Grimes_Erz_Info()
{	
	AI_Output (other,self,"DIA_Grimes_Erz_15_00");//Wie viel Erz habt ihr bereits gefördert?
	AI_Output (self,other,"DIA_Grimes_Erz_05_01");//Ein paar Kisten. Aber davon ist nichts mehr hier.
	AI_Output (self,other,"DIA_Grimes_Erz_05_02");//Paladin Marcos hat beschlossen, das Erz zur Burg zu bringen, weil wir dauernd den Angriffen der Orks ausgesetzt waren.
};
// ************************************************************
// 			 Weg
// ************************************************************
INSTANCE DIA_Grimes_Weg(C_INFO)
{
	npc			= VLK_4111_Grimes;
	nr			= 3;
	condition	= DIA_Grimes_Weg_Condition;
	information	= DIA_Grimes_Weg_Info;
	permanent	= FALSE;
	description = "Weißt du, welchen Weg Marcos genommen hat?";
};                       

FUNC INT DIA_Grimes_Weg_Condition()
{	
	if  Npc_KnowsInfo (other, DIA_Grimes_Erz)
	&& (Npc_KnowsInfo (other, DIA_Marcos_Garond) == FALSE)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_Grimes_Weg_Info()
{	
	AI_Output (other,self,"DIA_Grimes_Weg_15_00");//Weißt du, welchen Weg Marcos genommen hat?
	AI_Output (self,other,"DIA_Grimes_Weg_05_01");//Er hat nicht den direkten Weg genommen - stattdessen wollte er den Fluss dort überqueren, wo er gefroren ist.
	AI_Output (self,other,"DIA_Grimes_Weg_05_02");//Er wollte einen Bogen schlagen und sich der Burg von Westen her nähern.
};
// ************************************************************
// 			  Grimes
// ************************************************************
INSTANCE DIA_Grimes_Grimes(C_INFO)
{
	npc			= VLK_4111_Grimes;
	nr			= 2;
	condition	= DIA_Grimes_Grimes_Condition;
	information	= DIA_Grimes_Grimes_Info;
	permanent	= FALSE;
	description	= "Willst du nicht das Tal verlassen?";
};                       

FUNC INT DIA_Grimes_Grimes_Condition()
{	
	if (Kapitel == 2) 
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_Grimes_Grimes_Info()
{	
	AI_Output (other,self,"DIA_Grimes_Grimes_15_00");//Willst du nicht das Tal verlassen?
	AI_Output (self,other,"DIA_Grimes_Grimes_05_01");//Nein, ich werde weiter Erz schürfen.
	AI_Output (self,other,"DIA_Grimes_Grimes_05_02");//Ich lass mich doch nicht von so ein paar Orks daran hindern -  ich hab schon ganz andere Sachen erlebt.
	AI_Output (self,other,"DIA_Grimes_Grimes_05_03");//Damals, als wir noch in der alten Mine geschürft haben und auf einmal das Wasser hereinbrach ...
	AI_Output (self,other,"DIA_Grimes_Grimes_05_04");//Aber das sind alte Geschichten.
};
// ************************************************************
// 			  Grimes
// ************************************************************
INSTANCE DIA_Grimes_PERM(C_INFO)
{
	npc			= VLK_4111_Grimes;
	nr			= 2;
	condition	= DIA_Grimes_PERM_Condition;
	information	= DIA_Grimes_PERM_Info;
	permanent	= TRUE;
	description	= "Was macht die Arbeit?";
};                       

FUNC INT DIA_Grimes_PERM_Condition()
{	
	if (Kapitel >= 2) 
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_Grimes_PERM_Info()
{	
	AI_Output (other,self,"DIA_Grimes_PERM_15_00");//Was macht die Arbeit?
	AI_Output (self,other,"DIA_Grimes_PERM_05_01");//Dieser Fels ist verdammt hartnäckig - fast so, als würde er sich dagegen wehren, dass wir uns das Erz holen.
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Grimes_PICKPOCKET (C_INFO)
{
	npc			= VLK_4111_Grimes;
	nr			= 900;
	condition	= DIA_Grimes_PICKPOCKET_Condition;
	information	= DIA_Grimes_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Grimes_PICKPOCKET_Condition()
{
	C_Beklauen (43, 21);
};
 
FUNC VOID DIA_Grimes_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Grimes_PICKPOCKET);
	Info_AddChoice		(DIA_Grimes_PICKPOCKET, DIALOG_BACK 		,DIA_Grimes_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Grimes_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Grimes_PICKPOCKET_DoIt);
};

func void DIA_Grimes_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Grimes_PICKPOCKET);
};
	
func void DIA_Grimes_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Grimes_PICKPOCKET);
};




/*
	Keine Ahnung - vielleicht steckt er noch irgendwo da draussen. Ich werde ihn wohl suchen müssen.  
	Ich habe ihn gefunden. 
	Er hält sich in einem kleinen Tal auf - unweit der Burg. Dort sind die Kisten wenigstens sicher. 
	Innos sei dank...
	
	Nein, bisher nicht. 
	Dann hoffe ich, das er ein Versteck für sich und das Erz gefunden hat.
*/

