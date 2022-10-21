///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Attila_EXIT   (C_INFO)
{
	npc         = VLK_494_Attila;
	nr          = 999;
	condition   = DIA_Attila_EXIT_Condition;
	information = DIA_Attila_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Attila_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Attila_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Attila_PICKPOCKET (C_INFO)
{
	npc			= VLK_494_Attila;
	nr			= 900;
	condition	= DIA_Attila_PICKPOCKET_Condition;
	information	= DIA_Attila_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Attila_PICKPOCKET_Condition()
{
	C_Beklauen (55, 100);
};
 
FUNC VOID DIA_Attila_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Attila_PICKPOCKET);
	Info_AddChoice		(DIA_Attila_PICKPOCKET, DIALOG_BACK 		,DIA_Attila_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Attila_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Attila_PICKPOCKET_DoIt);
};

func void DIA_Attila_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Attila_PICKPOCKET);
};
	
func void DIA_Attila_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Attila_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo -> wenn Spieler Mist gebaut hat
///////////////////////////////////////////////////////////////////////
instance DIA_Attila_Hallo		(C_INFO)
{
	npc			 = 	VLK_494_Attila;
	nr 			 =  1;
	condition	 = 	DIA_Attila_Hallo_Condition;
	information	 = 	DIA_Attila_Hallo_Info;
	permanent    =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Attila_Hallo_Condition ()
{	
	if (MIS_ThiefGuild_sucked == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Attila_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Attila_Hallo_09_00"); //(leise) Ah - endlich. Ich habe auf dich gewartet, Fremder.
	
	Info_ClearChoices 	(DIA_Attila_Hallo);
	Info_AddChoice		(DIA_Attila_Hallo,"Was willst du von mir? ",DIA_Attila_Hallo_Was);
	Info_AddChoice		(DIA_Attila_Hallo,"Wer bist du?",DIA_Attila_Hallo_Wer);
	
	B_GivePlayerXP (XP_Attila_MetHim);
};
FUNC VOID DIA_Attila_Hallo_Wer()
{
	AI_Output (other, self, "DIA_Attila_Hallo_Wer_15_00"); //Wer bist du?
	AI_Output (self, other, "DIA_Attila_Hallo_Wer_09_01"); //Attila werde ich genannt ... aber ist es wichtig, wie ich heiße? Unsere Namen sind bedeutungslos.
	AI_Output (self, other, "DIA_Attila_Hallo_Wer_09_02"); //Das solltest du am Besten wissen, Fremder. (lacht leise)
	
	Knows_Attila_Wer = TRUE;
	
	Info_ClearChoices 	(DIA_Attila_Hallo);
	if (Knows_Attila_Was == FALSE)
	{
		Info_AddChoice		(DIA_Attila_Hallo,"Was willst du von mir? ",DIA_Attila_Hallo_Was);
	};
	Info_AddChoice		(DIA_Attila_Hallo,"Was soll dieses Theater?",DIA_Attila_Hallo_Theater);
}; 
FUNC VOID DIA_Attila_Hallo_Was()
{
	AI_Output (other, self, "DIA_Attila_Hallo_Was_15_00"); //Was willst du von mir?
	AI_Output (self, other, "DIA_Attila_Hallo_Was_09_01"); //Ich bin hier, um dir ein paar Sachen zu erklären. Und danach werde ich dich töten.
	Knows_Attila_Was = TRUE;
	
	Info_ClearChoices 	(DIA_Attila_Hallo);
	if (Knows_Attila_Wer == FALSE)
	{
		Info_AddChoice		(DIA_Attila_Hallo,"Wer bist du?",DIA_Attila_Hallo_Wer);
	};
		Info_AddChoice		(DIA_Attila_Hallo,"Wer bezahlt dich dafür? ",DIA_Attila_Hallo_Auftrag);
		Info_AddChoice		(DIA_Attila_Hallo,"Was soll dieses Theater?",DIA_Attila_Hallo_Theater);
};
FUNC VOID DIA_Attila_Hallo_Theater()
{
	AI_Output (other, self, "DIA_Attila_Hallo_Theater_15_00"); //Was soll dieses Theater?
	AI_Output (self, other, "DIA_Attila_Hallo_Theater_09_01"); //Am Ende deiner Reise sollst du nicht unwissend sterben. Sieh es als die letzte Ehre eines Verurteilten.
	
	Info_ClearChoices 	(DIA_Attila_Hallo);
	Info_AddChoice		(DIA_Attila_Hallo,"Ich werde jetzt gehen (ENDE)",DIA_Attila_Hallo_Ende);
	Info_AddChoice		(DIA_Attila_Hallo,"Wer bezahlt dich dafür? ",DIA_Attila_Hallo_Auftrag);
	Info_AddChoice		(DIA_Attila_Hallo,"Warum willst du mich töten? ",DIA_Attila_Hallo_Warum);
	
};
FUNC VOID DIA_Attila_Hallo_Ende()
{
	AI_Output (other, self, "DIA_Attila_Hallo_Ende_15_00"); //Ich werde jetzt gehen ...
	AI_Output (self, other, "DIA_Attila_Hallo_Ende_09_01"); //Ich fürchte ... das kann ich nicht zulassen. Finde dich damit ab. Es ist Zeit zu sterben.
	AI_DrawWeapon (self);
	
	Info_ClearChoices 	(DIA_Attila_Hallo);
	Info_AddChoice		(DIA_Attila_Hallo,"Wer bezahlt dich dafür? ",DIA_Attila_Hallo_Auftrag);
	Info_AddChoice		(DIA_Attila_Hallo,"Warum willst du mich töten? ",DIA_Attila_Hallo_Warum);
};
FUNC VOID DIA_Attila_Hallo_Auftrag()
{
	AI_Output (other, self, "DIA_Attila_Hallo_Auftrag_15_00"); //Wer bezahlt dich dafür?
	AI_Output (self, other, "DIA_Attila_Hallo_Auftrag_09_01"); //Meine Auftraggeber arbeiten im Verborgenen, genau wie ich.
	AI_Output (self, other, "DIA_Attila_Hallo_Auftrag_09_02"); //Eine Bedingung meines Vertrages ist, dass ich weder ihre Namen noch ihren Aufenthaltsort nenne.
	
	Info_ClearChoices 	(DIA_Attila_Hallo);
	Info_AddChoice		(DIA_Attila_Hallo,"Warum willst du mich töten? ",DIA_Attila_Hallo_Warum);
};
FUNC VOID DIA_Attila_Hallo_Warum()
{
	AI_Output (other, self, "DIA_Attila_Hallo_Warum_15_00"); //Warum willst du mich töten?
	
	if (Betrayal_Halvor == TRUE)
	{
		AI_Output (self, other, "DIA_Attila_Hallo_Warum_09_01"); //Du hast Halvor ans Messer geliefert. Er sitzt jetzt im Knast. Das war nicht so geplant.
	}; 
	if (Rengaru_InKnast == TRUE)
	{
		AI_Output (self, other, "DIA_Attila_Hallo_Warum_09_02"); //Du hast Rengaru an die Stadt verkauft. Er ist zwar nur ein kleiner Dieb, aber du hättest das nicht tun sollen.
	};
	if (Nagur_Ausgeliefert == TRUE)
	{
		AI_Output (self, other, "DIA_Attila_Hallo_Warum_09_03"); //Nagur sitzt aufgrund deines Eingreifens hinter Gittern. Ein unverzeihlicher Fehler, wie manche meinen.
	};
	
	AI_Output (self, other, "DIA_Attila_Hallo_Warum_09_04"); //Meine Auftraggeber sind nicht gerade erfreut darüber. Um zu verhindern, dass du noch einen weiteren Fehler machst, schicken sie mich.
	
	Info_ClearChoices 	(DIA_Attila_Hallo);
	Info_AddChoice		(DIA_Attila_Hallo,"Ich kann dir Gold zahlen... ",DIA_Attila_Hallo_Gold);
	Info_AddChoice		(DIA_Attila_Hallo,"Lass mich wenigstens meine Waffe ziehen. ",DIA_Attila_Hallo_Attacke);
	
};
FUNC VOID DIA_Attila_Hallo_Gold()
{
	AI_Output (other, self, "DIA_Attila_Hallo_Gold_15_00"); //Ich kann dir Gold zahlen - viel Gold.
	AI_Output (self, other, "DIA_Attila_Hallo_Gold_09_01"); //Zwecklos. Deshalb bin ich nicht gekommen. Den einzigen Preis, den du zahlen wirst, ist dein Leben. Und zwar jetzt.
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
	
};
FUNC VOID DIA_Attila_Hallo_Attacke()
{
	AI_Output (other, self, "DIA_Attila_Hallo_Attacke_15_00"); //Lass mich wenigstens meine Waffe ziehen.
	if (Npc_HasEquippedWeapon (other) == TRUE)
	{
		AI_Output (self, other, "DIA_Attila_Hallo_Attacke_09_01"); //Gut, dann mache dich bereit für deinen letzten Kampf.
		AI_StopProcessInfos (self);
		B_Attack (self, other, AR_NONE, 1);	
	}
	else
	{
		AI_Output (self, other, "DIA_Attila_Hallo_Attacke_09_02"); //Du trägst ja nicht einmal eine am Gürtel. Lass dir nicht zu viel Zeit, Fremder. Dein Tod wartet auf dich.
		AI_StopProcessInfos (self);
		B_Attack (self, other, AR_NONE, 2);	
	};
	
};
///////////////////////////////////////////////////////////////////////
//	Info Willkommen Schlüssel für die Diebesgilde 
///////////////////////////////////////////////////////////////////////
instance DIA_Attila_Willkommen  	(C_INFO)
{
	npc			 = 	VLK_494_Attila;
	nr			 =  1;
	condition	 = 	DIA_Attila_Willkommen_Condition;
	information	 = 	DIA_Attila_Willkommen_Info;
	permanent	 =	FALSE;					
	important    = 	TRUE;
};

func int DIA_Attila_Willkommen_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk)
	&& (MIS_ThiefGuild_sucked == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Attila_Willkommen_Info ()
{
	AI_Output (self, other, "DIA_Attila_Willkommen_09_00"); //Ah - endlich. Ich habe auf dich gewartet, Fremder.
	B_GivePlayerXP (XP_Attila_Friend);
	AI_Output (other, self, "DIA_Attila_Willkommen_15_01"); //Wer bist du und was willst du von mir?
	AI_Output (self, other, "DIA_Attila_Willkommen_09_02"); //Das ist nicht wichtig. Wichtig ist das, was du getan hast. Du hast dich loyal verhalten - auch wenn dir das jetzt nicht bewusst ist.
	AI_Output (self, other, "DIA_Attila_Willkommen_09_03"); //Durch deine Loyalität sind einige Gönner auf dich aufmerksam geworden. Und sie bieten dir eine Chance. Also nutze sie.
	AI_Output (other, self, "DIA_Attila_Willkommen_15_04"); //Hey, sag mir doch einfach, warum du hier bist.
	AI_Output (self, other, "DIA_Attila_Willkommen_09_05"); //Ich habe ein Geschenk für dich. Alles weitere liegt an dir, Fremder. (lacht leise)
	
	B_GiveInvItems (self,other,ItKe_ThiefGuildKey_MIS,1);
	Attila_Key = TRUE;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "AFTER");
};
///////////////////////////////////////////////////////////////////////
//	Info Nach Schluessel Übergabe
///////////////////////////////////////////////////////////////////////
instance DIA_Attila_NachSchluessel		(C_INFO)
{
	npc			 = 	VLK_494_Attila;
	nr			 =  1;
	condition	 = 	DIA_Attila_NachSchluessel_Condition;
	information	 = 	DIA_Attila_NachSchluessel_Info;
	permanent	 =	TRUE;					
	important    = 	TRUE;
};

func int DIA_Attila_NachSchluessel_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Attila_Wer))
	&& (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Attila_NachSchluessel_Info ()
{
	AI_Output (self, other, "DIA_Attila_NachSchluessel_09_00"); //Meine Aufgabe ist beendet - für dieses Mal.
	AI_Output (self, other, "DIA_Attila_NachSchluessel_09_01"); //Aber wer weiß, vielleicht kreuzen sich unsere Wege ja noch mal ...
	AI_StopProcessInfos (self);	 
};
///////////////////////////////////////////////////////////////////////
//	Info Nach Schluessel Übergabe Wer bist du?
///////////////////////////////////////////////////////////////////////
instance DIA_Attila_Wer		(C_INFO)
{
	npc			 = 	VLK_494_Attila;
	nr			 =  1;
	condition	 = 	DIA_Attila_Wer_Condition;
	information	 = 	DIA_Attila_Wer_Info;
	permanent	 =	FALSE;					
	description	 =  "Wer bist du?";
};

func int DIA_Attila_Wer_Condition ()
{
	if Npc_KnowsInfo(other, DIA_Attila_Willkommen)
	{
		return TRUE;
	};
};

func void DIA_Attila_Wer_Info ()
{
	AI_Output (other, self, "DIA_Attila_Hallo_Wer_15_00"); //Wer bist du?
	AI_Output (self, other, "DIA_Attila_Hallo_Wer_09_01"); //Attila werde ich genannt ... aber ist es wichtig, wie ich heiße? Unsere Namen sind bedeutungslos.
	AI_Output (self, other, "DIA_Attila_Hallo_Wer_09_02"); //Das solltest du am Besten wissen, Fremder. (lacht leise)
	
	AI_StopProcessInfos (self);
};






