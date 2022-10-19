///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Borka_EXIT   (C_INFO)
{
	npc         = VLK_434_Borka;
	nr          = 999;
	condition   = DIA_Borka_EXIT_Condition;
	information = DIA_Borka_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Borka_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Borka_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Borka_PICKPOCKET (C_INFO)
{
	npc			= VLK_434_Borka;
	nr			= 900;
	condition	= DIA_Borka_PICKPOCKET_Condition;
	information	= DIA_Borka_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Borka_PICKPOCKET_Condition()
{
	C_Beklauen (80, 120);
};
 
FUNC VOID DIA_Borka_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Borka_PICKPOCKET);
	Info_AddChoice		(DIA_Borka_PICKPOCKET, DIALOG_BACK 		,DIA_Borka_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Borka_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Borka_PICKPOCKET_DoIt);
};

func void DIA_Borka_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Borka_PICKPOCKET);
};
	
func void DIA_Borka_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Borka_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info PISSOF
///////////////////////////////////////////////////////////////////////
instance DIA_Borka_PISSOFF		(C_INFO)
{
	npc			 = 	VLK_434_Borka;
	condition	 = 	DIA_Borka_PISSOFF_Condition;
	information	 = 	DIA_Borka_PISSOFF_Info;
	important	 = 	TRUE;
	permanent	 =  FALSE;
};
func int DIA_Borka_PISSOFF_Condition ()
{
	if (Knows_Borka_Dealer != TRUE)
	&& (Npc_GetDistToNpc(self, other) <= ZivilAnquatschDist)
	{
		return TRUE;
	};
};
func void DIA_Borka_PISSOFF_Info ()
{
	AI_Output (self, other,"DIA_Borka_PISSOFF_11_00");  //Hey du! Wo gehst du hin? Ganz egal was du vorhast - dafür ist noch später Zeit.
	AI_Output (self, other,"DIA_Borka_PISSOFF_11_01");  //Du stehst hier vor der Perle Khorinis' - der ROTEN LATERNE. Das ist das verdammt noch mal schönste Bordell von ganz Myrtana!
	AI_Output (self, other,"DIA_Borka_PISSOFF_11_02");  //Seefahrer aus den entferntesten Ecken der Welt legen hier an, nur um ein paar Nächte in der roten Laterne zu verbringen.
	AI_Output (self, other,"DIA_Borka_PISSOFF_11_03");  //Und du hast jetzt die Chance - ja, sogar die Ehre - eine Nacht mit Nadja, der leidenschaftlichsten Blüte der Götter, zu teilen!
	AI_Output (self, other,"DIA_Borka_PISSOFF_11_04");  //Komm rein und du wirst erleben, wovon andere nicht mal träumen können!
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info TROUBLE
///////////////////////////////////////////////////////////////////////
instance DIA_Borka_TROUBLE		(C_INFO)
{
	npc			 = 	VLK_434_Borka;
	nr 			 =  3;
	condition	 = 	DIA_Borka_TROUBLE_Condition;
	information	 = 	DIA_Borka_TROUBLE_Info;
	permanent	 =  TRUE;
	important	 =  TRUE;
};

func int DIA_Borka_TROUBLE_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (MIS_Andre_REDLIGHT != LOG_RUNNING) 
	&& (Npc_IsDead (Nadja) == FALSE) 
	&& (Npc_GetDistToWP (self, "NW_CITY_HABOUR_PUFF_ENTRANCE") <= 500)
	{	
		return TRUE;
	};
};
func void DIA_Borka_TROUBLE_Info ()
{
	AI_Output (self, other, "DIA_Borka_TROUBLE_11_00"); //Was stehst du hier draußen rum? Geh rein und triff dich mit der leidenschaftlichen Nadja.
	AI_Output (self, other, "DIA_Borka_TROUBLE_11_01"); //Dieses heiße Geschöpf der Nacht wird deinem Leben einen neuen Sinn geben!
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Smoke
///////////////////////////////////////////////////////////////////////
instance DIA_Borka_Smoke		(C_INFO)
{
	npc			 = 	VLK_434_Borka;
	nr 			 =  3;
	condition	 = 	DIA_Borka_Smoke_Condition;
	information	 = 	DIA_Borka_Smoke_Info;
	permanent	 =  TRUE;
	description	 =  "Weißt du, wo ich Kraut kaufen kann?";
};

func int DIA_Borka_Smoke_Condition ()
{	
	if  (MIS_Andre_REDLIGHT == LOG_RUNNING) 
	&&  (Knows_Borka_Dealer == FALSE)
	{	
		return TRUE;
	};
};
func void DIA_Borka_Smoke_Info ()
{
	AI_Output (other, self, "DIA_Borka_Smoke_15_00"); //Weißt du, wo ich Kraut kaufen kann?
	AI_Output (self, other, "DIA_Borka_Smoke_11_01"); //Nein, verpiss dich!
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info BUYHERB
///////////////////////////////////////////////////////////////////////
instance DIA_Borka_BUYHERB		(C_INFO)
{
	npc			 = 	VLK_434_Borka;
	nr			 = 	2;
	condition	 = 	DIA_Borka_BUYHERB_Condition;
	information	 = 	DIA_Borka_BUYHERB_Info;
	permanent 	 =  TRUE;
	description	 = 	"Ich hab gehört, du verkaufst Kraut.";
};
func int DIA_Borka_BUYHERB_Condition ()
{
	if (Knows_Borka_Dealer == TRUE)
	&& (MIS_Andre_REDLIGHT == LOG_RUNNING) 
	&& (Borka_Deal == FALSE)
	&& (Undercover_Failed == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Borka_BUYHERB_Info ()
{
	var C_ITEM heroArmor; heroArmor = Npc_GetEquippedArmor(other);
	
	AI_Output (other, self, "DIA_Borka_BUYHERB_15_00"); //Ich hab gehört, du verkaufst Kraut.
	
	if (Hlp_IsItem (heroArmor, ItAR_MIl_L) == TRUE) 
	{
		AI_Output (self, other, "DIA_Borka_BUYHERB_11_01"); //Tut mir Leid, Herr Stadtgardist. Da liegt wohl ein Irrtum vor. Ich weiß nichts von Kraut.
	}
	else
	{
		AI_Output (self, other, "DIA_Borka_BUYHERB_11_02"); //Wer sagt das?
	
		Info_ClearChoices 	(DIA_Borka_BUYHERB);
		Info_AddChoice		(DIA_Borka_BUYHERB,"Das ist nicht wichtig.",DIA_Borka_BUYHERB_Egal);
		Info_AddChoice		(DIA_Borka_BUYHERB,"Nadja sagt das.",DIA_Borka_BUYHERB_Nadja);
	};
};
FUNC VOID DIA_Borka_BUYHERB_Egal ()
{
	AI_Output	(other, self, "DIA_Borka_BUYHERB_Egal_15_00"); //Das ist nicht wichtig.
	AI_Output	(self, other, "DIA_Borka_BUYHERB_Egal_11_01"); //Ich will nur wissen, wer dich geschickt hat, um sicher zu sein, dass du in Ordnung bist.
	
	Info_ClearChoices 	(DIA_Borka_BUYHERB);
	Info_AddChoice		(DIA_Borka_BUYHERB,"Nadja sagt das.",DIA_Borka_BUYHERB_Nadja);
	Info_AddChoice		(DIA_Borka_BUYHERB,"Willst du ein Geschäft machen, oder nicht?",DIA_Borka_BUYHERB_Deal);
};
FUNC VOID DIA_Borka_BUYHERB_NADJA ()
{
	AI_Output (other, self, "DIA_Borka_BUYHERB_NADJA_15_00"); //Nadja sagt das.
	AI_Output (self, other, "DIA_Borka_BUYHERB_NADJA_11_01"); //Ach sieh an, das kleine Vöglein hat gezwitschert. Weißt du, du solltest nicht alles glauben, was diese kleine Schlampe erzählt.
	
	Nadja_Victim = TRUE; 
	Undercover_Failed = TRUE;
	Info_ClearChoices 	(DIA_Borka_BUYHERB);
};
FUNC VOID DIA_Borka_BUYHERB_Deal ()
{
	AI_Output (other, self, "DIA_Borka_BUYHERB_Deal_15_00"); //Willst du ein Geschäft machen oder nicht?
	AI_PlayAni (self, "T_SEARCH");
	AI_Output (self, other, "DIA_Borka_BUYHERB_Deal_11_01"); //... na schön ... machen wir ein Geschäft. Ich will 50 Goldstücke von dir, dann kriegst du dein Kraut. Keine Verhandlung.
	Info_ClearChoices 	(DIA_Borka_BUYHERB);
	Borka_Deal = TRUE;
};	
///////////////////////////////////////////////////////////////////////
//	Info SECOND_CHANCE
///////////////////////////////////////////////////////////////////////
instance DIA_Borka_SECOND_CHANCE		(C_INFO)
{
	npc			 = 	VLK_434_Borka;
	nr			 = 	2;
	condition	 = 	DIA_Borka_SECOND_CHANCE_Condition;
	information	 = 	DIA_Borka_SECOND_CHANCE_Info;
	permanent	 =  TRUE;  	
	description	 = 	"Lass uns ein Geschäft machen (50 Gold zahlen)";
};
func int DIA_Borka_SECOND_CHANCE_Condition ()
{	
	var C_ITEM heroArmor; heroArmor = Npc_GetEquippedArmor(other);
	
	if 	(Borka_Deal == TRUE)
	&&  (Npc_HasItems (other, ItmI_Gold) >= 50)
	&&  (Hlp_IsItem (heroArmor, ItAR_MIl_L) == FALSE) 
	{
		return TRUE;
	};
};
func void DIA_Borka_SECOND_CHANCE_Info ()
{
	AI_Output (other, self, "DIA_Borka_SECOND_CHANCE_15_00"); //Lass uns ein Geschäft machen. Hier ist das Gold.
	B_GiveInvItems (hero, self, ItMi_Gold, 50);
	AI_Output (self, other, "DIA_Borka_SECOND_CHANCE_11_01"); //Gut ...
	AI_PlayAni (self, "T_SEARCH");
	AI_Output (self, other, "DIA_Borka_SECOND_CHANCE_11_02"); //... hier ist ein frischer, harziger Stängel Kraut.
	B_GiveInvItems (self, hero, ItMi_Joint, 1);
	Borka_Deal = 2;
	AI_StopProcessInfos (self);
};






