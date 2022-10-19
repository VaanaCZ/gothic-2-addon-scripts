///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Fellan_EXIT   (C_INFO)
{
	npc         = VLK_480_Fellan;
	nr          = 999;
	condition   = DIA_Fellan_EXIT_Condition;
	information = DIA_Fellan_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Fellan_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Fellan_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Fellan_PICKPOCKET (C_INFO)
{
	npc			= VLK_480_Fellan;
	nr			= 900;
	condition	= DIA_Fellan_PICKPOCKET_Condition;
	information	= DIA_Fellan_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Fellan_PICKPOCKET_Condition()
{
	C_Beklauen (40, 40);
};
 
FUNC VOID DIA_Fellan_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Fellan_PICKPOCKET);
	Info_AddChoice		(DIA_Fellan_PICKPOCKET, DIALOG_BACK 		,DIA_Fellan_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Fellan_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Fellan_PICKPOCKET_DoIt);
};

func void DIA_Fellan_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Fellan_PICKPOCKET);
};
	
func void DIA_Fellan_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Fellan_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Tough Guy News 
///////////////////////////////////////////////////////////////////////
instance DIA_Fellan_News		(C_INFO)
{
	npc			 = 	VLK_480_Fellan;
	nr			 =  1;
	condition	 = 	DIA_Fellan_News_Condition;
	information	 = 	DIA_Fellan_News_Info;
	permanent	 =  TRUE;
	important 	 = 	TRUE;
};
func int DIA_Fellan_News_Condition ()
{	
	if  Npc_IsInState (self, ZS_Talk)
	&& (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE)
	&& (self.aivar[AIV_LastFightComment] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Fellan_News_Info ()
{
	
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		 AI_Output (self, other, "DIA_Fellan_News_06_00"); //Okay, du hast mich geschlagen. Das war ja 'ne richtige Heldentat.
	
		 if (MIS_AttackFellan == LOG_RUNNING)
		 && (FellanGeschlagen == FALSE)
		 {
		 	AI_Output (other, self, "DIA_Fellan_News_15_01"); //Hörst du jetzt mit dem Hämmern auf, oder muss ich dich noch mal verprügeln?
		 	AI_Output (self, other, "DIA_Fellan_News_06_02"); //Nein, nicht mehr schlagen. Ich höre auf. Aber du bist Schuld, wenn hier alles zusammenbricht!
		 	
		 	FellanGeschlagen = TRUE;
		 	Npc_ExchangeRoutine (self,"OHNEHAMMER");
		 	AI_StopProcessInfos (self);
		 	
		 };
	}; 
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	{
		AI_Output (self, other, "DIA_Fellan_News_06_03");  //Was ist los? Willst du noch mal ein paar aufs Maul?
	};
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_CANCEL)
	{
		 AI_Output (self, other, "DIA_Fellan_News_06_04"); //Du bist doch total verrückt - kämpfen, nicht kämpfen, reden - was willst du eigentlich?
	};
	self.aivar[AIV_LastFightComment] = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Fellan_HALLO		(C_INFO)
{
	npc			 = 	VLK_480_Fellan;
	nr			 =  2;
	condition	 = 	DIA_Fellan_HALLO_Condition;
	information	 = 	DIA_Fellan_HALLO_Info;
	permanent	 =  FALSE;
	description	 = 	"Warum hämmerst du?";
};
func int DIA_Fellan_HALLO_Condition ()
{	
	if (FellanGeschlagen == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Fellan_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Fellan_HALLO_15_00"); //Warum hämmerst du?
	AI_Output (self, other, "DIA_Fellan_HALLO_06_01"); //Ich versuche schon seit Tagen verzweifelt, mein Haus wieder dicht zu kriegen.
	AI_Output (self, other, "DIA_Fellan_HALLO_06_02"); //Während der letzten Regenfälle ist das ganze Gebälk völlig morsch geworden. Bald wird hier alles zusammenbrechen!
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Stop
///////////////////////////////////////////////////////////////////////
instance DIA_Fellan_Stop		(C_INFO)
{
	npc			 = 	VLK_480_Fellan;
	nr 			 =  3;
	condition	 = 	DIA_Fellan_Stop_Condition;
	information	 = 	DIA_Fellan_Stop_Info;
	permanent	 =  FALSE;
	description	 = 	"Kannst du auch mal aufhören zu hämmern? ";
};

func int DIA_Fellan_Stop_Condition ()
{
	if (MIS_AttackFellan == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Fellan_Stop_Info ()
{
	AI_Output (other, self, "DIA_Fellan_Stop_15_00"); //Kannst du auch mal aufhören zu hämmern?
	AI_Output (self, other, "DIA_Fellan_Stop_06_01"); //Nein, ich muss das hier fertig machen.
	
	Info_ClearChoices (DIA_Fellan_Stop);
	Info_AddChoice (DIA_Fellan_Stop,"Hör auf zu hämmern oder ich breche dir alle Knochen",DIA_Fellan_Stop_Bones);
	Info_AddChoice (DIA_Fellan_Stop,"Wenn du mit der Hämmerei aufhörst, gebe ich dir 10 Goldstücke",DIA_Fellan_Stop_Gold);
	Info_AddChoice (DIA_Fellan_Stop,"Hör einfach auf zu hämmern, okay?",DIA_Fellan_Stop_Just);
};
FUNC VOID DIA_Fellan_Stop_Bones()
{
	AI_Output (other, self, "DIA_Fellan_Stop_Bones_15_00"); //Hör auf zu hämmern oder ich breche dir alle Knochen.
	AI_Output (self, other, "DIA_Fellan_Stop_Bones_06_01"); //Lass es lieber bleiben, sonst hämmere ich mal ein bisschen auf dir rum.
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Fellan_Stop_Gold()
{
	AI_Output (other, self, "DIA_Fellan_Stop_Gold_15_00"); //Wenn du mit der Hämmerei aufhörst, gebe ich dir 10 Goldstücke.
	AI_Output (self, other, "DIA_Fellan_Stop_Gold_06_01"); //Ui - sehr großzügig von dir. Aber dein Gold kannst du dir ...
	AI_Output (self, other, "DIA_Fellan_Stop_Gold_06_02"); //... Na, du weißt schon, wohin du es dir stecken kannst.
};
FUNC VOID DIA_Fellan_Stop_Just()
{
	AI_Output (other, self, "DIA_Fellan_Stop_Just_15_00"); //Hör einfach auf zu hämmern, okay?
	AI_Output (self, other, "DIA_Fellan_Stop_Just_06_01"); //Geh mir doch einfach nicht auf den Sack, okay?
};
///////////////////////////////////////////////////////////////////////
//	Info Alles klar?
///////////////////////////////////////////////////////////////////////
instance DIA_Fellan_klar		(C_INFO)
{
	npc			 = 	VLK_480_Fellan;
	nr			 =  5;
	condition	 = 	DIA_Fellan_klar_Condition;
	information	 = 	DIA_Fellan_klar_Info;
	permanent	 =  TRUE;
	description	 = 	"Sag mal, ist alles klar bei dir?";
};
func int DIA_Fellan_klar_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Fellan_HALLO)
	{
		return TRUE;
	};
};
func void DIA_Fellan_klar_Info ()
{
	AI_Output (other, self, "DIA_Fellan_klar_15_00"); //Sag mal, ist alles klar bei dir?
	
	if (FellanGeschlagen == FALSE) 
	{
		AI_Output (self, other, "DIA_Fellan_klar_06_01"); //Jaja, ich muss nur zusehen, dass ich alles wieder repariere.
	}
	else
	{
		AI_Output (self, other, "DIA_Fellan_klar_06_02"); //Das Dach wird immer schlimmer, beim nächsten Regen steht das Wasser bei mir bis zu den Knöcheln. Das ist alles deine Schuld!
	};
	AI_StopProcessInfos (self);
};
//Kapitel 2 Miliz Kandidat 





