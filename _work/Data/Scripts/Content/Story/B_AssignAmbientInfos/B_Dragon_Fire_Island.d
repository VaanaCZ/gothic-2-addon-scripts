// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_Dragon_Fire_Island_Exit(C_INFO)
{
	
	npc 		= Dragon_Fire_Island;
	nr			= 999;
	condition	= DIA_Dragon_Fire_Island_Exit_Condition;
	information	= DIA_Dragon_Fire_Island_Exit_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Dragon_Fire_Island_Exit_Condition()
{
	if (DragonTalk_Exit_Free == TRUE)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Dragon_Fire_Island_Exit_Info()
{	
	AI_StopProcessInfos	(self);
	DragonTalk_Exit_Free  = FALSE;
	self.flags =  0;
};

// *************************************************************************
// 									Hello
// *************************************************************************
INSTANCE DIA_Dragon_Fire_Island_Hello(C_INFO)
{
	
	npc 		= Dragon_Fire_Island;
	nr			= 5;
	condition	= DIA_Dragon_Fire_Island_Hello_Condition;
	information	= DIA_Dragon_Fire_Island_Hello_Info;

	important 	= TRUE;
};                       

FUNC INT DIA_Dragon_Fire_Island_Hello_Condition()
{
	if (Npc_HasItems (other,ItMi_InnosEye_MIS) >= 1)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Dragon_Fire_Island_Hello_Info()
{	
	AI_Output			(self, other, "DIA_Dragon_Fire_Island_Hello_20_00"); //Bleib stehen, Mensch. Alle meine Sinne sagen mir, dass der Mörder meines eigenen Fleisch und Blutes vor mir steht.
	AI_Output			(other, self, "DIA_Dragon_Fire_Island_Hello_15_01"); //So? Wen nennst du hier Mörder, du Ausgeburt der Hölle?
	
	if (hero.guild == GIL_DJG)
	&& (DragonEggCounter >= 7)
	{
	AI_Output			(self, other, "DIA_Dragon_Fire_Island_Hello_20_02"); //Dass du fast unsere gesamte Nachkommenschaft vernichtet hast, war dir wohl nicht genug.
	};
	
	AI_Output			(self, other, "DIA_Dragon_Fire_Island_Hello_20_03"); //Du hast meinen Bruder Feomathar auf dem Gewissen und dafür wirst du bezahlen.

	if (hero.guild == GIL_DJG)
	&& (DragonEggCounter >= 7)
	{
	AI_Output			(other, self, "DIA_Dragon_Fire_Island_Hello_15_04"); //Den Rest eurer widerlichen Brut werde ich mir auch noch vornehmen.
	AI_Output			(self, other, "DIA_Dragon_Fire_Island_Hello_20_05"); //Arrh. Es wird mir ein Vergnügen sein, dich bei lebendigem Leibe zu verbrennen.
	};

	AI_Output			(other, self, "DIA_Dragon_Fire_Island_Hello_15_06"); //Mach nicht so einen Wind. Lass uns zur Sache kommen.
	AI_Output			(self, other, "DIA_Dragon_Fire_Island_Hello_20_07"); //Du hast es weit gebracht, kleiner Mensch, aber diese Hallen wirst du nicht mehr lebend verlassen.

	Npc_RemoveInvItems (other,ItMi_InnosEye_MIS,1);
	CreateInvItems 	   (other,ItMi_InnosEye_Discharged_MIS,1);	 
	AI_StopProcessInfos	(self);
	
	B_LogEntry (TOPIC_HallenVonIrdorath,"Noch ein Feuerdrache. So langsam habe ich die Biester satt. Das einzige, was ich will, ist, über den Abgrund zu kommen, der sich hinter dem Feuerdrachen auftut."); 

	DragonTalk_Exit_Free  = FALSE;
	self.flags =  0;
};

