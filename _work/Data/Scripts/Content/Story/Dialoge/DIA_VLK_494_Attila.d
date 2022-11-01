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
	AI_Output (self, other, "DIA_Attila_Hallo_09_00"); //(tranquillamente) Ah, finalmente. Ti stavo aspettando, straniero.
	
	Info_ClearChoices 	(DIA_Attila_Hallo);
	Info_AddChoice		(DIA_Attila_Hallo,"Cosa vuoi da me?",DIA_Attila_Hallo_Was);
	Info_AddChoice		(DIA_Attila_Hallo,"Chi sei?",DIA_Attila_Hallo_Wer);
	
	B_GivePlayerXP (XP_Attila_MetHim);
};
FUNC VOID DIA_Attila_Hallo_Wer()
{
	AI_Output (other, self, "DIA_Attila_Hallo_Wer_15_00"); //Chi sei?
	AI_Output (self, other, "DIA_Attila_Hallo_Wer_09_01"); //Mi chiamo Attila... Ma è così importante il mio nome? I nostri nomi non hanno significato.
	AI_Output (self, other, "DIA_Attila_Hallo_Wer_09_02"); //Dovresti saperlo bene, straniero (ride silenziosamente).
	
	Knows_Attila_Wer = TRUE;
	
	Info_ClearChoices 	(DIA_Attila_Hallo);
	if (Knows_Attila_Was == FALSE)
	{
		Info_AddChoice		(DIA_Attila_Hallo,"Cosa vuoi da me?",DIA_Attila_Hallo_Was);
	};
	Info_AddChoice		(DIA_Attila_Hallo,"Cosa sarebbe questa buffonata?",DIA_Attila_Hallo_Theater);
}; 
FUNC VOID DIA_Attila_Hallo_Was()
{
	AI_Output (other, self, "DIA_Attila_Hallo_Was_15_00"); //Cosa vuoi da me?
	AI_Output (self, other, "DIA_Attila_Hallo_Was_09_01"); //Sono qui per spiegarti un paio di cose. Dopodiché, ti ucciderò.
	Knows_Attila_Was = TRUE;
	
	Info_ClearChoices 	(DIA_Attila_Hallo);
	if (Knows_Attila_Wer == FALSE)
	{
		Info_AddChoice		(DIA_Attila_Hallo,"Chi sei?",DIA_Attila_Hallo_Wer);
	};
		Info_AddChoice		(DIA_Attila_Hallo,"Chi ti paga per questo?",DIA_Attila_Hallo_Auftrag);
		Info_AddChoice		(DIA_Attila_Hallo,"Cosa sarebbe questa buffonata?",DIA_Attila_Hallo_Theater);
};
FUNC VOID DIA_Attila_Hallo_Theater()
{
	AI_Output (other, self, "DIA_Attila_Hallo_Theater_15_00"); //Cosa sarebbe questa buffonata?
	AI_Output (self, other, "DIA_Attila_Hallo_Theater_09_01"); //Non morirai ignorante alla fine del tuo cammino. Consideralo come un ultimo segno di rispetto per il condannato.
	
	Info_ClearChoices 	(DIA_Attila_Hallo);
	Info_AddChoice		(DIA_Attila_Hallo,"Sto andando via (FINE).",DIA_Attila_Hallo_Ende);
	Info_AddChoice		(DIA_Attila_Hallo,"Chi ti paga per questo?",DIA_Attila_Hallo_Auftrag);
	Info_AddChoice		(DIA_Attila_Hallo,"Perché vuoi uccidermi?",DIA_Attila_Hallo_Warum);
	
};
FUNC VOID DIA_Attila_Hallo_Ende()
{
	AI_Output (other, self, "DIA_Attila_Hallo_Ende_15_00"); //Sto per andarmene...
	AI_Output (self, other, "DIA_Attila_Hallo_Ende_09_01"); //Mi dispiace... Ma non posso permetterlo. Rassegnati, è ora di morire.
	AI_DrawWeapon (self);
	
	Info_ClearChoices 	(DIA_Attila_Hallo);
	Info_AddChoice		(DIA_Attila_Hallo,"Chi ti paga per questo?",DIA_Attila_Hallo_Auftrag);
	Info_AddChoice		(DIA_Attila_Hallo,"Perché vuoi uccidermi?",DIA_Attila_Hallo_Warum);
};
FUNC VOID DIA_Attila_Hallo_Auftrag()
{
	AI_Output (other, self, "DIA_Attila_Hallo_Auftrag_15_00"); //Chi ti paga per questo?
	AI_Output (self, other, "DIA_Attila_Hallo_Auftrag_09_01"); //Ai miei datori di lavoro non piace apparire e nemmeno a me.
	AI_Output (self, other, "DIA_Attila_Hallo_Auftrag_09_02"); //Una condizione del contratto è che io non devo nominarli o dire dove risiedono.
	
	Info_ClearChoices 	(DIA_Attila_Hallo);
	Info_AddChoice		(DIA_Attila_Hallo,"Perché vuoi uccidermi?",DIA_Attila_Hallo_Warum);
};
FUNC VOID DIA_Attila_Hallo_Warum()
{
	AI_Output (other, self, "DIA_Attila_Hallo_Warum_15_00"); //Perché vuoi uccidermi?
	
	if (Betrayal_Halvor == TRUE)
	{
		AI_Output (self, other, "DIA_Attila_Hallo_Warum_09_01"); //Hai fatto la spia su Halvor. Ora è in galera. Questo non faceva parte del piano.
	}; 
	if (Rengaru_InKnast == TRUE)
	{
		AI_Output (self, other, "DIA_Attila_Hallo_Warum_09_02"); //Hai venduto Rengaru alla città. È solo un povero ladruncolo, ma non avresti dovuto farlo.
	};
	if (Nagur_Ausgeliefert == TRUE)
	{
		AI_Output (self, other, "DIA_Attila_Hallo_Warum_09_03"); //Nagur è dietro le sbarre a causa della tua interferenza. Un errore imperdonabile, come dicono tutti.
	};
	
	AI_Output (self, other, "DIA_Attila_Hallo_Warum_09_04"); //I miei lavoratori non sono proprio felici della faccenda. Per prevenirti dal commettere un altro errore, hanno mandato me.
	
	Info_ClearChoices 	(DIA_Attila_Hallo);
	Info_AddChoice		(DIA_Attila_Hallo,"Posso darti dell’oro...",DIA_Attila_Hallo_Gold);
	Info_AddChoice		(DIA_Attila_Hallo,"Lascia che sfoderi almeno la mia arma.",DIA_Attila_Hallo_Attacke);
	
};
FUNC VOID DIA_Attila_Hallo_Gold()
{
	AI_Output (other, self, "DIA_Attila_Hallo_Gold_15_00"); //Posso darti oro, un sacco di oro.
	AI_Output (self, other, "DIA_Attila_Hallo_Gold_09_01"); //Inutile. Non è per questo che sono venuto. L'unico prezzo che pagherai è la tua vita. Adesso.
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
	
};
FUNC VOID DIA_Attila_Hallo_Attacke()
{
	AI_Output (other, self, "DIA_Attila_Hallo_Attacke_15_00"); //Lascia che sfoderi almeno la mia arma.
	if (Npc_HasEquippedWeapon (other) == TRUE)
	{
		AI_Output (self, other, "DIA_Attila_Hallo_Attacke_09_01"); //Bene, allora preparati per la tua ultima battaglia.
		AI_StopProcessInfos (self);
		B_Attack (self, other, AR_NONE, 1);	
	}
	else
	{
		AI_Output (self, other, "DIA_Attila_Hallo_Attacke_09_02"); //Ma se sei disarmato... Non ti è rimasto molto tempo, straniero. La morte ti attende.
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
	AI_Output (self, other, "DIA_Attila_Willkommen_09_00"); //Ah, finalmente. Ti stavo aspettando, straniero.
	B_GivePlayerXP (XP_Attila_Friend);
	AI_Output (other, self, "DIA_Attila_Willkommen_15_01"); //Chi sei e che cosa vuoi da me?
	AI_Output (self, other, "DIA_Attila_Willkommen_09_02"); //Questo non è importante. Ciò che conta invece è quello che hai fatto. Sei rimasto fedele, anche senza saperlo.
	AI_Output (self, other, "DIA_Attila_Willkommen_09_03"); //Alcuni benefattori si sono accorti della tua lealtà e ti stanno offrendo una possibilità. Usala.
	AI_Output (other, self, "DIA_Attila_Willkommen_15_04"); //Ehi, dimmi solo perché sei qui.
	AI_Output (self, other, "DIA_Attila_Willkommen_09_05"); //Ho un regalo per te. Tutto il resto dipende da te, straniero (ride silenziosamente).
	
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
	AI_Output (self, other, "DIA_Attila_NachSchluessel_09_00"); //Il mio compito è terminato, per ora.
	AI_Output (self, other, "DIA_Attila_NachSchluessel_09_01"); //Ma chi può dirlo, forse i nostri cammini si incroceranno di nuovo.
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
	description	 =  "Chi sei?";
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
	AI_Output (other, self, "DIA_Attila_Hallo_Wer_15_00"); //Chi sei?
	AI_Output (self, other, "DIA_Attila_Hallo_Wer_09_01"); //Mi chiamo Attila... Ma è così importante il mio nome? I nostri nomi non hanno significato.
	AI_Output (self, other, "DIA_Attila_Hallo_Wer_09_02"); //Dovresti saperlo bene, straniero (ride silenziosamente).
	
	AI_StopProcessInfos (self);
};






