///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Sarah_EXIT   (C_INFO)
{
	npc         = VLK_470_Sarah;
	nr          = 999;
	condition   = DIA_Sarah_EXIT_Condition;
	information = DIA_Sarah_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Sarah_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Sarah_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

 // ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Sarah_PICKPOCKET (C_INFO)
{
	npc			= VLK_470_Sarah;
	nr			= 900;
	condition	= DIA_Sarah_PICKPOCKET_Condition;
	information	= DIA_Sarah_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60_Female;
};                       

FUNC INT DIA_Sarah_PICKPOCKET_Condition()
{
	C_Beklauen (57, 60);
};
 
FUNC VOID DIA_Sarah_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Sarah_PICKPOCKET);
	Info_AddChoice		(DIA_Sarah_PICKPOCKET, DIALOG_BACK 		,DIA_Sarah_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Sarah_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Sarah_PICKPOCKET_DoIt);
};

func void DIA_Sarah_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Sarah_PICKPOCKET);
};
	
func void DIA_Sarah_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Sarah_PICKPOCKET);
};

///////////////////////////////////////////////////////////////////////
//	Info Greet
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_Greet		(C_INFO)
{
	npc			 = 	VLK_470_Sarah;
	nr 			 =  1;
	condition	 = 	DIA_Sarah_Greet_Condition;
	information	 = 	DIA_Sarah_Greet_Info;
	permanent 	 =  TRUE;
	important	 =  TRUE;
};

func int DIA_Sarah_Greet_Condition ()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Canthar_Ausgeliefert == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Sarah_Greet_Info ()
{
	AI_Output (self, other, "DIA_Sarah_Add_16_07"); //Ah! Da bist du ja wieder!
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_HALLO		(C_INFO)
{
	npc			 = 	VLK_470_Sarah;
	condition	 = 	DIA_Sarah_HALLO_Condition;
	information	 = 	DIA_Sarah_HALLO_Info;
	permanent 	 =  FALSE;
	description	 = 	"Wie läuft das Geschäft? ";
};

func int DIA_Sarah_HALLO_Condition ()
{
	return TRUE;
};
func void DIA_Sarah_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Sarah_HALLO_15_00"); //Wie läuft das Geschäft?
	AI_Output (self, other, "DIA_Sarah_HALLO_16_01"); //Als die Paladine kamen, dachte ich, das wäre eine gute Gelegenheit, Geschäfte zu machen.
	AI_Output (self, other, "DIA_Sarah_HALLO_16_02"); //Aber sie lassen sich ihre Waffen von Harad herstellen, und weder Hakon noch ich verdienen auch nur ein Goldstück an ihnen.
	AI_Output (self, other, "DIA_Sarah_HALLO_16_03"); //Dazu kommt noch, dass die Nahrungsversorgung durch die Bauern ausbleibt - und alles teurer geworden ist.
	AI_Output (self, other, "DIA_Sarah_Add_16_00"); //Da ist es nur ein kleiner Trost, daß die Paladine meine Hotelrechnung bezahlen.

	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Sarah handelt mit Waffen am Marktplatz.");	
};
///////////////////////////////////////////////////////////////////////
//	Info Bauern
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_Bauern		(C_INFO)
{
	npc			 = 	VLK_470_Sarah;
	nr 			 =  2;
	condition	 = 	DIA_Sarah_Bauern_Condition;
	information	 = 	DIA_Sarah_Bauern_Info;
	permanent	 =  FALSE;
	description	 = 	"Was ist das Problem mit den Bauern? ";
};

func int DIA_Sarah_Bauern_Condition ()
{
	if Npc_KnowsInfo (other, DIA_Sarah_HALLO)
	{
			return TRUE;
	};
};
func void DIA_Sarah_Bauern_Info ()
{
	AI_Output (other, self, "DIA_Sarah_Bauern_15_00"); //Was ist das Problem mit den Bauern?
	AI_Output (self, other, "DIA_Sarah_Bauern_16_01"); //Sie weigern sich, ihre Erträge zu liefern.
	AI_Output (self, other, "DIA_Sarah_Bauern_16_02"); //Jetzt, da keine Schiffe mehr anlegen, ist die Stadt natürlich auf die Versorgung durch die Bauern angewiesen.
	AI_Output (self, other, "DIA_Sarah_Bauern_16_03"); //Und Onar, der größte Bauer, hat sich Söldner angeworben, die seinen Hof vor den Stadtwachen beschützen. Die würden sich die Waren sonst einfach holen.
	AI_Output (self, other, "DIA_Sarah_Add_16_01"); //Aber die Söldner bewachen nicht nur den Hof von Onar.
	AI_Output (self, other, "DIA_Sarah_Add_16_02"); //Sie kommen bis zu den kleinen Höfen in der Nähe der Stadt heran, um die Bauern dort einzuschüchtern.
	AI_Output (self, other, "DIA_Sarah_Add_16_03"); //Als ich an Akils Hof vorbeigekommen bin, hab ich sie gesehen. Ich möchte jetzt nicht in seiner Haut stecken.
};

///////////////////////////////////////////////////////////////////////
//	Info AkilsHof
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_AkilsHof		(C_INFO)
{
	npc			 = 	VLK_470_Sarah;
	nr 			 =  3;
	condition	 = 	DIA_Sarah_AkilsHof_Condition;
	information	 = 	DIA_Sarah_AkilsHof_Info;
	permanent	 =  FALSE;
	description	 = 	"Wo finde ich Akils Hof?";
};

func int DIA_Sarah_AkilsHof_Condition ()
{
	if Npc_KnowsInfo (other, DIA_Sarah_Bauern)
	{
		return TRUE;
	};
};
func void DIA_Sarah_AkilsHof_Info ()
{
	AI_Output (other, self, "DIA_Sarah_AkilsHof_15_00"); //Wo finde ich Akils Hof?
	AI_Output (self, other, "DIA_Sarah_Add_16_04"); //Wenn du aus dem östlichen Stadttor hier raugehst, und dem Weg rechts hoch folgst, kommst du zu einer Treppe.
	AI_Output (self, other, "DIA_Sarah_Add_16_05"); //Die führt hoch zu Akils Hof.
	AI_Output (self, other, "DIA_Sarah_Add_16_06"); //Aber da würde ich jetzt nicht hingehen - die Söldner sind bestimmt noch da.
};


///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_Trade		(C_INFO)
{
	npc			 = 	VLK_470_Sarah;
	nr			 =  99;
	condition	 = 	DIA_Sarah_Trade_Condition;
	information	 = 	DIA_Sarah_Trade_Info;
	Trade		 = 	TRUE;
	permanent	 =	TRUE;
	description	 = 	"Zeig mir deine Ware.";
};

func int DIA_Sarah_Trade_Condition ()
{
	if 	((Npc_KnowsInfo(other, DIA_Sarah_HALLO))
	&& (MIS_Canthars_KomproBrief != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Sarah_Trade_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Sarah_Trade_15_00"); //Zeig mir deine Ware.
	
	Sarah_WaffenGesehen = TRUE;
	
};
///////////////////////////////////////////////////////////////////////
//	Info ImKnast
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_IMKNAST		(C_INFO)
{
	npc			 = 	VLK_470_Sarah;
	nr			 =  99;
	condition	 = 	DIA_Sarah_IMKNAST_Condition;
	information	 = 	DIA_Sarah_IMKNAST_Info;
	permanent	 = 	TRUE;
	important 	 =  TRUE;
};

func int DIA_Sarah_IMKNAST_Condition ()
{
	if (MIS_Canthars_KomproBrief == LOG_SUCCESS)	
	&&  Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Sarah_IMKNAST_Info ()
{
	AI_Output (self, other, "DIA_Sarah_IMKNAST_16_00"); //Du! Du wagst, hier aufzukreuzen? Ich kann es nicht beweisen, aber ich wette, du hast deine Finger in diesem schmutzigen Spiel.
	AI_Output (self, other, "DIA_Sarah_IMKNAST_16_01"); //Du trägst mit Schuld daran, dass ich hier sitze. Du und dieser verdammte Canthar - möge Innos euch strafen!
	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Success
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_Success		(C_INFO)
{
	npc			 = 	VLK_470_Sarah;
	nr			 =  4;
	condition	 = 	DIA_Sarah_Success_Condition;
	information	 = 	DIA_Sarah_Success_Info;
	permanent 	 =  FALSE;
	description	 = 	"Canthar wollte dich reinlegen ...";
};

func int DIA_Sarah_Success_Condition ()
{	
	if (Canthar_Ausgeliefert == TRUE)
	//|| (MIS_Canthars_KomproBrief == LOG_OBSOLETE)
	{
		return TRUE;
	};
};
func void DIA_Sarah_Success_Info ()
{
	AI_Output (other, self, "DIA_Sarah_Success_15_00"); //Canthar wollte dich reinlegen. Und sich deinen Stand unter den Nagel reissen. Aber ich habe ihn der Stadtwache übergeben.
	AI_Output (self, other, "DIA_Sarah_Success_16_01"); //Da hast du dich mit einem gefährlichen Mann angelegt. Ich kenne den Mistkerl schon lange, er war schon immer auf meinen Platz scharf.
	AI_Output (self, other, "DIA_Sarah_Success_16_02"); //Nimm diese Waffe, als Zeichen meiner Dankbarkeit.
	
	B_GivePlayerXP (XP_CantharImKnast);
	B_GiveInvItems (self, other, ItMw_Piratensaebel,1);
	
};
	
	  
	  
	   





