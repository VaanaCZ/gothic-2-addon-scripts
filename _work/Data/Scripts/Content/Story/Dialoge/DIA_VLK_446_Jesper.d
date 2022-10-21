//////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jesper_EXIT   (C_INFO)
{
	npc         = VLK_446_Jesper;
	nr          = 999;
	condition   = DIA_Jesper_EXIT_Condition;
	information = DIA_Jesper_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Jesper_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Jesper_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Jesper_PICKPOCKET (C_INFO)
{
	npc			= VLK_446_Jesper;
	nr			= 900;
	condition	= DIA_Jesper_PICKPOCKET_Condition;
	information	= DIA_Jesper_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Jesper_PICKPOCKET_Condition()
{
	C_Beklauen (80, 180);
};
 
FUNC VOID DIA_Jesper_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Jesper_PICKPOCKET);
	Info_AddChoice		(DIA_Jesper_PICKPOCKET, DIALOG_BACK 		,DIA_Jesper_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Jesper_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Jesper_PICKPOCKET_DoIt);
};

func void DIA_Jesper_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Jesper_PICKPOCKET);
};
	
func void DIA_Jesper_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Jesper_PICKPOCKET);
};
//////////////////////////////////////////////////////////////////////
//	Info Hallo 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jesper_Hallo   (C_INFO)
{
	npc         = VLK_446_Jesper;
	nr          = 1;
	condition   = DIA_Jesper_Hallo_Condition;
	information = DIA_Jesper_Hallo_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Jesper_Hallo_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Jesper_Hallo_Info()
{
	AI_Output (self, other,"DIA_Jesper_Hallo_09_00");//Ehi, cosa stai facendo quaggiù? Non c'è niente qui per te.
	AI_Output (self, other,"DIA_Jesper_Hallo_09_01");//Quindi, sputa fuori, che cosa stai facendo qui?
		
	Info_ClearChoices (DIA_Jesper_Hallo);
	Info_AddChoice 	  (DIA_Jesper_Hallo,"Sono qui per ucciderti!",DIA_Jesper_Hallo_Kill);	
	Info_AddChoice 	  (DIA_Jesper_Hallo,"Volevo solo dare un'occhiata in giro.",DIA_Jesper_Hallo_NurSo);
		
	if  (Attila_Key == TRUE)
	{
		Info_AddChoice 	  (DIA_Jesper_Hallo,"Attila mi ha dato una chiave...",DIA_Jesper_Hallo_Willkommen);
	}	
	else 
	{
		Info_AddChoice 	  (DIA_Jesper_Hallo,"Ho ucciso Attila...",DIA_Jesper_Hallo_Umgelegt);
	};
	
	DG_gefunden = TRUE;
	
};
FUNC VOID DIA_Jesper_Hallo_Kill()
{
	AI_Output (other, self,"DIA_Jesper_Hallo_Kill_15_00");//Sono qui per ucciderti!
	AI_Output (self, other,"DIA_Jesper_Hallo_Kill_09_01");//Che idea meravigliosa. L'hai pensata da solo, vero? Bah, che importa. Tagliamo corto.
	
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START");
	B_Attack (self, other, AR_NONE,1);
};
FUNC VOID DIA_Jesper_Hallo_NurSo()
{
	AI_Output (other, self,"DIA_Jesper_Hallo_NurSo_15_00");//Volevo solo dare un'occhiata in giro.
	AI_Output (self, other,"DIA_Jesper_Hallo_NurSo_09_01");//Non c'è nulla da guardare. Stai camminando su un terreno pericoloso, capisici cosa intendo?
	AI_Output (self, other,"DIA_Jesper_Hallo_NurSo_09_02");//Quindi, lascia l'arma dove si trova e dimmi perché sei qui.
};
FUNC VOID DIA_Jesper_Hallo_Willkommen()
{
	AI_Output (other, self,"DIA_Jesper_Hallo_Willkommen_15_00");//Attila mi ha dato una chiave. Ecco perché sono qui. Che cosa vuoi da me?
	AI_Output (self, other,"DIA_Jesper_Hallo_Willkommen_09_01");//Ti piacerebbe saperlo, eh? Stai calmo, non c'è fretta.
	AI_Output (self, other,"DIA_Jesper_Hallo_Willkommen_09_02");//Vai da Cassia, ti sta aspettando.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START");
};
FUNC VOID DIA_Jesper_Hallo_Umgelegt()
{
	AI_Output (other, self,"DIA_Jesper_Hallo_Umgelegt_15_00");//Ho fatto fuori Attila, aveva la chiave delle fogne addosso.
	AI_Output (self, other,"DIA_Jesper_Hallo_Umgelegt_09_01");//(sbalordito) TU hai ucciso Attila? (sdegnosamente) Che importa, in ogni caso era uno schifoso cane.
	AI_Output (self, other,"DIA_Jesper_Hallo_Umgelegt_09_02");//Ma ti dirò una cosa. Se mi attacchi, ti ucciderò.
	
	Info_ClearChoices (DIA_Jesper_Hallo);
	Info_AddChoice 	  (DIA_Jesper_Hallo,"Cosa stai facendo, qui...",DIA_Jesper_Hallo_Was);	
	Info_AddChoice 	  (DIA_Jesper_Hallo,"Conducimi dal tuo capo.",DIA_Jesper_Hallo_Anfuehrer);
};
FUNC VOID DIA_Jesper_Hallo_Was()
{
	AI_Output (other, self,"DIA_Jesper_Hallo_Was_15_00");//Che cosa stai facendo in questo buco umido?
	AI_Output (self, other,"DIA_Jesper_Hallo_Was_09_01");//(brontola) Io vivo qui. Un'altra domanda stupida e ti aprirò un sorriso extra sul petto.
};
FUNC VOID DIA_Jesper_Hallo_Anfuehrer()
{
	AI_Output (other, self,"DIA_Jesper_Hallo_Anfuehrer_15_00");//Conducimi dal tuo capo.
	AI_Output (self, other,"DIA_Jesper_Hallo_Anfuehrer_09_01");//(grassa risata) Ah, il mio capo? Sono certo che Cassia ti vorrà parlare.
	AI_Output (self, other,"DIA_Jesper_Hallo_Anfuehrer_09_02");//Vai avanti e non provare a fregarmi.
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START");
};
//////////////////////////////////////////////////////////////////////
//	Info Lernen freischalten
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jesper_Bezahlen   (C_INFO)
{
	npc         = VLK_446_Jesper;
	nr          = 1;
	condition   = DIA_Jesper_Bezahlen_Condition;
	information = DIA_Jesper_Bezahlen_Info;
	permanent   = TRUE;
	description	= "Puoi insegnarmi qualcosa?";
};
FUNC INT DIA_Jesper_Bezahlen_Condition()
{	
	if (Join_Thiefs == TRUE)
	&& (Jesper_TeachSneak == FALSE)
	&& (Npc_KnowsInfo (other,DIA_Cassia_Lernen))
	&& (Npc_GetTalentSkill (other, NPC_TALENT_SNEAK) == FALSE) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jesper_Bezahlen_Info()
{	
	AI_Output (other, self, "DIA_Jesper_Bezahlen_15_00");//Puoi insegnarmi qualcosa?
	
	if (MIS_ThiefGuild_sucked == FALSE)
	{
		AI_Output (self, other, "DIA_Jesper_Bezahlen_09_01");//Certo, ti mostrerò come ci si muove furtivamente, senza costi supplementari.
		Jesper_TeachSneak = TRUE;
		Info_ClearChoices (DIA_Jesper_Bezahlen);
	}
	else
	{
		AI_Output (self, other, "DIA_Jesper_Bezahlen_09_02");//Vuoi imparare a muoverti senza emettere un suono? Ti costerà 100 pezzi d'oro...
		B_Say_Gold (self, other, Jesper_Cost);
		
		Info_ClearChoices (DIA_Jesper_Bezahlen);
		Info_AddChoice (DIA_Jesper_Bezahlen,"Forse più tardi... (INDIETRO)",DIA_Jesper_Bezahlen_Spaeter);
		Info_AddChoice (DIA_Jesper_Bezahlen,"Va bene, voglio apprendere come muovermi furtivamente (paga 100 monete d’oro).",DIA_Jesper_Bezahlen_Okay);
	};
};
FUNC VOID DIA_Jesper_Bezahlen_Spaeter()
{
	Info_ClearChoices (DIA_Jesper_Bezahlen);
};
FUNC VOID DIA_Jesper_Bezahlen_Okay()
{
	AI_Output (other, self, "DIA_Jesper_Bezahlen_Okay_15_00");//D'accordo, voglio imparare a muovermi furtivamente.
	
	if B_GiveInvItems (other, self, ItMi_Gold, 100)
	{
		AI_Output (other, self, "DIA_Jesper_Bezahlen_Okay_15_01");//Ecco l'oro.
		AI_Output (self, other, "DIA_Jesper_Bezahlen_Okay_09_02");//Dimmi quando sei pronto.
		Jesper_TeachSneak = TRUE;
		Info_ClearChoices (DIA_Jesper_Bezahlen);
	}
	else 
	{
		AI_Output (self, other, "DIA_Jesper_Bezahlen_Okay_09_03");//Non puoi imparare niente senza oro.
		Info_ClearChoices (DIA_Jesper_Bezahlen);
	};
};
//////////////////////////////////////////////////////////////////////
//	Info Schleichen 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jesper_Schleichen   (C_INFO)
{
	npc         = VLK_446_Jesper;
	nr          = 10;
	condition   = DIA_Jesper_Schleichen_Condition;
	information = DIA_Jesper_Schleichen_Info;
	permanent   = TRUE;
	description = "Insegnami l’arte del furto.";
};
//--------------------------------------
var int DIA_Jesper_Schleichen_permanent;
//-------------------------------------- 
FUNC INT DIA_Jesper_Schleichen_Condition()
{	
	if (Jesper_TeachSneak == TRUE) 
	&& (DIA_Jesper_Schleichen_permanent == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jesper_Schleichen_Info()
{
	AI_Output (other, self, "DIA_Jesper_Schleichen_15_00");//Insegnami l'arte della furtività.
	
	if B_TeachThiefTalent (self, other, NPC_TALENT_SNEAK)
	{
		AI_Output (self, other, "DIA_Jesper_Schleichen_09_01");//La furtività è essenziale per ciascun ladro, soprattutto quando ti muovi in casa di qualcun altro.
		AI_Output (self, other, "DIA_Jesper_Schleichen_09_02");//Non camminare così pesantemente. Molte persone hanno il sonno leggero.
		AI_Output (self, other, "DIA_Jesper_Schleichen_09_03");//Solo quando ti muovi furtivamente nessuno può sentirti e puoi lavorare senza impedimenti.
		DIA_Jesper_Schleichen_permanent = TRUE;
	};
};
//////////////////////////////////////////////////////////////////////
//	Info Freunde getötet
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jesper_Killer   (C_INFO)
{
	npc         = VLK_446_Jesper;
	nr          = 2;
	condition   = DIA_Jesper_Killer_Condition;
	information = DIA_Jesper_Killer_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Jesper_Killer_Condition()
{	
	if Npc_IsDead (Cassia)
	|| Npc_IsDead (Ramirez)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jesper_Killer_Info()
{
	if  Npc_IsDead (Cassia)
	&&  Npc_IsDead (Ramirez)
	{
		AI_Output (self, other, "DIA_Jesper_Killer_09_00");//Hai ucciso i miei amici. Che cosa hai fatto, assassino?
		AI_Output (self, other, "DIA_Jesper_Killer_09_01");//Ti manderò nel reame di Beliar!
	}
	else if Npc_IsDead (Cassia)
	{
		AI_Output (self, other, "DIA_Jesper_Killer_09_02");//Hai ucciso Cassia, sporco assassino, dovrai passare sul mio cadavere!
		
		AI_StopProcessInfos (self);
		B_Attack (self, other, AR_NONE,1); 
	}
	else if  Npc_IsDead (Ramirez)
	{
		AI_Output (self, other, "DIA_Jesper_Killer_09_03");//Ho fatto molte cose per Ramirez e ho racimolato più soldi di quanti tu ne vedrai mai.
		AI_Output (self, other, "DIA_Jesper_Killer_09_04");//E tu l'hai appena ucciso, cane bastardo! È il momento della resa dei conti!
		
		AI_StopProcessInfos (self);
		B_Attack (self, other, AR_NONE,1); 
	};
	
};
//////////////////////////////////////////////////////////////////////
//	Info Bogen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jesper_Bogen   (C_INFO)
{
	npc         = VLK_446_Jesper;
	nr          = 10;
	condition   = DIA_Jesper_Bogen_Condition;
	information = DIA_Jesper_Bogen_Info;
	permanent   = FALSE;
	description = "Dimmi, cosa sai sull’arco di Bosper?";
};

FUNC INT DIA_Jesper_Bogen_Condition()
{	
	if (Npc_HasItems (other, ItRw_Bow_L_03_MIS) < 1)
	&& (MIS_Bosper_Bogen == LOG_RUNNING)
	&& (Join_Thiefs == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jesper_Bogen_Info()
{
	AI_Output (other, self, "DIA_Jesper_Bogen_15_00");//Dimmi, cosa sai sull’arco di Bosper?
	AI_Output (self, other, "DIA_Jesper_Bogen_09_01");//Intendi l'arco del costruttore d'archi? Certo, ce l'ho da qualche parte in un forziere...
	AI_Output (self, other, "DIA_Jesper_Bogen_09_02");//Ma è pieno di topi. Puoi andare a prenderlo, finché quelle bestie non ti danno fastidio.
	AI_Output (self, other, "DIA_Jesper_Bogen_09_03");//Oh, naturalmente il forziere è chiuso. Devi scardinarlo (sogghigna). Sperando che ti siano avanzati dei grimaldelli.
	
	Wld_InsertNpc (Giant_Rat, "NW_CITY_KANAL_ROOM_01_01");	
	Wld_InsertNpc (Giant_Rat, "NW_CITY_KANAL_ROOM_01_02");	
	Wld_InsertNpc (Giant_Rat, "NW_CITY_KANAL_ROOM_01_03");
};
//////////////////////////////////////////////////////////////////////
//	Info Tür
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jesper_Tuer   (C_INFO)
{
	npc         = VLK_446_Jesper;
	nr          = 10;
	condition   = DIA_Jesper_Tuer_Condition;
	information = DIA_Jesper_Tuer_Info;
	permanent   = FALSE;
	description = "Cosa c’è dietro quella porta chiusa a chiave?";
};

FUNC INT DIA_Jesper_Tuer_Condition()
{	
	if (MIS_CassiaRing == LOG_SUCCESS)
	&& (Kapitel >= 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jesper_Tuer_Info()
{
	AI_Output (other, self, "DIA_Jesper_Tuer_15_00");//Cosa c’è dietro quella porta chiusa a chiave?
	AI_Output (self, other, "DIA_Jesper_Tuer_09_01");//(sorride) Dietro c'è il forziere, il forziere di Fingers, il maestro scassinatore.
	AI_Output (self, other, "DIA_Jesper_Tuer_09_02");//La serratura che ha montato è talmente complicata che finora nessuno è riuscito ad aprirla.
	AI_Output (self, other, "DIA_Jesper_Tuer_09_03");//Sfortunatamente l'hanno preso e l'hanno lanciato attraverso la Barriera, dove probabilmente è morto.
	AI_Output (self, other, "DIA_Jesper_Tuer_09_04");//Ma se vuoi provare ad aprire il forziere, ecco la chiave della stanza.
	
	B_GiveInvItems (self, other, ItKe_Fingers,1);
};
//////////////////////////////////////////////////////////////////////
//	Info Truhe
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jesper_Truhe   (C_INFO)
{
	npc         = VLK_446_Jesper;
	nr          = 10;
	condition   = DIA_Jesper_Truhe_Condition;
	information = DIA_Jesper_Truhe_Info;
	permanent   = FALSE;
	description = "Sono riuscito ad aprire il forziere.";
};

FUNC INT DIA_Jesper_Truhe_Condition()
{	
	if (Mob_HasItems ("MOB_FINGERS", Itmi_Gold) < 300)
	|| (Mob_HasItems ("MOB_FINGERS", Itmi_Silvercup) < 5)
	|| (Mob_HasItems ("MOB_FINGERS", Itmi_Goldcup) < 1)
	|| (Mob_HasItems ("MOB_FINGERS", ItAM_Strg_01) < 1)
	|| (Mob_HasItems ("MOB_FINGERS", ItPO_perm_Dex) < 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jesper_Truhe_Info()
{
	AI_Output (other, self, "DIA_Jesper_Truhe_15_00");//Sono riuscito ad aprire il forziere.
	AI_Output (self, other, "DIA_Jesper_Truhe_09_01");//È impossibile! Sembra che abbiamo un nuovo maestro scassinatore!
	AI_Output (self, other, "DIA_Jesper_Truhe_09_02");//Congratulazioni per questo adempimento.
	
	B_GivePlayerXP (XP_JesperTruhe);
};  


