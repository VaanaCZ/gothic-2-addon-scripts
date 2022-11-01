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
	AI_Output (self, other, "DIA_Attila_Hallo_09_00"); //(potichu) Á - konečnę. Už jsem na tebe čekal, cizinče.
	
	Info_ClearChoices 	(DIA_Attila_Hallo);
	Info_AddChoice		(DIA_Attila_Hallo,"Co ode mę chceš?",DIA_Attila_Hallo_Was);
	Info_AddChoice		(DIA_Attila_Hallo,"Kdo jsi?",DIA_Attila_Hallo_Wer);
	
	B_GivePlayerXP (XP_Attila_MetHim);
};
FUNC VOID DIA_Attila_Hallo_Wer()
{
	AI_Output (other, self, "DIA_Attila_Hallo_Wer_15_00"); //Kdo jsi?
	AI_Output (self, other, "DIA_Attila_Hallo_Wer_09_01"); //Âíkají mi Attila... Ale copak je moje jméno důležité? Naše jména jsou nepodstatná.
	AI_Output (self, other, "DIA_Attila_Hallo_Wer_09_02"); //To bys męl vędęt líp než já, cizinče. (tichý smích)
	
	Knows_Attila_Wer = TRUE;
	
	Info_ClearChoices 	(DIA_Attila_Hallo);
	if (Knows_Attila_Was == FALSE)
	{
		Info_AddChoice		(DIA_Attila_Hallo,"Co ode mę chceš?",DIA_Attila_Hallo_Was);
	};
	Info_AddChoice		(DIA_Attila_Hallo,"Co je to za frašku?",DIA_Attila_Hallo_Theater);
}; 
FUNC VOID DIA_Attila_Hallo_Was()
{
	AI_Output (other, self, "DIA_Attila_Hallo_Was_15_00"); //Co ode mę chceš?
	AI_Output (self, other, "DIA_Attila_Hallo_Was_09_01"); //Jsem tu, abych ti vysvętlil pár vęcí. A pak jsem tu proto, abych tę zabil.
	Knows_Attila_Was = TRUE;
	
	Info_ClearChoices 	(DIA_Attila_Hallo);
	if (Knows_Attila_Wer == FALSE)
	{
		Info_AddChoice		(DIA_Attila_Hallo,"Kdo jsi?",DIA_Attila_Hallo_Wer);
	};
		Info_AddChoice		(DIA_Attila_Hallo,"Kdo ti za to zaplatil?",DIA_Attila_Hallo_Auftrag);
		Info_AddChoice		(DIA_Attila_Hallo,"Co je to za frašku?",DIA_Attila_Hallo_Theater);
};
FUNC VOID DIA_Attila_Hallo_Theater()
{
	AI_Output (other, self, "DIA_Attila_Hallo_Theater_15_00"); //Co je to za frašku?
	AI_Output (self, other, "DIA_Attila_Hallo_Theater_09_01"); //Nemęl bys svou cestu končit tak neznalý. Považuj to za poslední ukázku úcty k odsouzenému.
	
	Info_ClearChoices 	(DIA_Attila_Hallo);
	Info_AddChoice		(DIA_Attila_Hallo,"Teë už půjdu. (KONEC)",DIA_Attila_Hallo_Ende);
	Info_AddChoice		(DIA_Attila_Hallo,"Kdo ti za to zaplatil?",DIA_Attila_Hallo_Auftrag);
	Info_AddChoice		(DIA_Attila_Hallo,"Proč mę chceš zabít?",DIA_Attila_Hallo_Warum);
	
};
FUNC VOID DIA_Attila_Hallo_Ende()
{
	AI_Output (other, self, "DIA_Attila_Hallo_Ende_15_00"); //Právę odcházím.
	AI_Output (self, other, "DIA_Attila_Hallo_Ende_09_01"); //Je mi líto... to ti nemůžu dovolit. Smiâ se s tím. Nastal čas zemâít.
	AI_DrawWeapon (self);
	
	Info_ClearChoices 	(DIA_Attila_Hallo);
	Info_AddChoice		(DIA_Attila_Hallo,"Kdo ti za to zaplatil?",DIA_Attila_Hallo_Auftrag);
	Info_AddChoice		(DIA_Attila_Hallo,"Proč mę chceš zabít?",DIA_Attila_Hallo_Warum);
};
FUNC VOID DIA_Attila_Hallo_Auftrag()
{
	AI_Output (other, self, "DIA_Attila_Hallo_Auftrag_15_00"); //Kdo ti za to zaplatil?
	AI_Output (self, other, "DIA_Attila_Hallo_Auftrag_09_01"); //Moji zamęstnavatelé pracují v utajení, stejnę jako já.
	AI_Output (self, other, "DIA_Attila_Hallo_Auftrag_09_02"); //Součástí naší dohody je i podmínka, že nebudu zmiŕovat ani jejich jména, ani jejich adresy.
	
	Info_ClearChoices 	(DIA_Attila_Hallo);
	Info_AddChoice		(DIA_Attila_Hallo,"Proč mę chceš zabít?",DIA_Attila_Hallo_Warum);
};
FUNC VOID DIA_Attila_Hallo_Warum()
{
	AI_Output (other, self, "DIA_Attila_Hallo_Warum_15_00"); //Proč mę chceš zabít?
	
	if (Betrayal_Halvor == TRUE)
	{
		AI_Output (self, other, "DIA_Attila_Hallo_Warum_09_01"); //Udal jsi Halvora. Teë sedí ve vęzení. To nebylo součástí plánu.
	}; 
	if (Rengaru_InKnast == TRUE)
	{
		AI_Output (self, other, "DIA_Attila_Hallo_Warum_09_02"); //Prodal jsi Rengara. Je to jen malej zlodęjíček, ale tos nemęl dęlat.
	};
	if (Nagur_Ausgeliefert == TRUE)
	{
		AI_Output (self, other, "DIA_Attila_Hallo_Warum_09_03"); //Nagur je kvůli tobę za mâížemi. Neodpustitelná chyba, jak se zdá.
	};
	
	AI_Output (self, other, "DIA_Attila_Hallo_Warum_09_04"); //Mí zamęstnavatelé z toho nemají zrovna velkou radost. Aby ti zabránili udęlat nęjakou další chybu, poslali mę.
	
	Info_ClearChoices 	(DIA_Attila_Hallo);
	Info_AddChoice		(DIA_Attila_Hallo,"Můžu ti dát zlato...",DIA_Attila_Hallo_Gold);
	Info_AddChoice		(DIA_Attila_Hallo,"Tak mę alespoŕ nech tasit zbraŕ.",DIA_Attila_Hallo_Attacke);
	
};
FUNC VOID DIA_Attila_Hallo_Gold()
{
	AI_Output (other, self, "DIA_Attila_Hallo_Gold_15_00"); //Můžu ti dát zlato - spoustu zlata.
	AI_Output (self, other, "DIA_Attila_Hallo_Gold_09_01"); //Smůla. Proto tady nejsem. Jedinou cenu, kterou zaplatíš, je tvůj život. A to právę teë.
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
	
};
FUNC VOID DIA_Attila_Hallo_Attacke()
{
	AI_Output (other, self, "DIA_Attila_Hallo_Attacke_15_00"); //Tak mę alespoŕ nech tasit zbraŕ.
	if (Npc_HasEquippedWeapon (other) == TRUE)
	{
		AI_Output (self, other, "DIA_Attila_Hallo_Attacke_09_01"); //Dobrá, tak se pâiprav na svůj poslední boj.
		AI_StopProcessInfos (self);
		B_Attack (self, other, AR_NONE, 1);	
	}
	else
	{
		AI_Output (self, other, "DIA_Attila_Hallo_Attacke_09_02"); //Žádná se ti u opasku nehoupe. Už ti nezbývá mnoho času, cizinče. Smrt už tę očekává.
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
	AI_Output (self, other, "DIA_Attila_Willkommen_09_00"); //Á - konečnę. Už jsem na tebe čekal, cizinče.
	B_GivePlayerXP (XP_Attila_Friend);
	AI_Output (other, self, "DIA_Attila_Willkommen_15_01"); //Kdo jsi a co ode mę chceš?
	AI_Output (self, other, "DIA_Attila_Willkommen_09_02"); //To není důležité. Co je důležité, jsou tvé skutky. Zůstal jsi vęrný, dokonce aniž bys o tom vędęl.
	AI_Output (self, other, "DIA_Attila_Willkommen_09_03"); //Jistí dobrodinci si všimli tvé loajality. A nabídli ti šanci. Tak ji využij.
	AI_Output (other, self, "DIA_Attila_Willkommen_15_04"); //Hele, prostę mi âekni, proč jsi tady.
	AI_Output (self, other, "DIA_Attila_Willkommen_09_05"); //Mám pro tebe dárek. Ostatní už je na tobę, cizinče. (tichý smích)
	
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
	AI_Output (self, other, "DIA_Attila_NachSchluessel_09_00"); //Můj úkol je splnęn, alespoŕ prozatím.
	AI_Output (self, other, "DIA_Attila_NachSchluessel_09_01"); //Ale možná se naše cesty znovu setkají.
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
	description	 =  "Kdo jsi?";
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
	AI_Output (other, self, "DIA_Attila_Hallo_Wer_15_00"); //Kdo jsi?
	AI_Output (self, other, "DIA_Attila_Hallo_Wer_09_01"); //Âíkají mi Attila... Ale copak je moje jméno důležité? Naše jména jsou nepodstatná.
	AI_Output (self, other, "DIA_Attila_Hallo_Wer_09_02"); //To bys męl vędęt líp než já, cizinče. (tichý smích)
	
	AI_StopProcessInfos (self);
};






