//--------------------------------------------------------------------
//	Info EXIT 
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_EXIT   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 999;
	condition   = DIA_Addon_Esteban_EXIT_Condition;
	information = DIA_Addon_Esteban_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Esteban_EXIT_Condition()
{	
	if (Bodyguard_Killer == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Esteban_PICKPOCKET (C_INFO)
{
	npc			= BDT_1083_Addon_Esteban;
	nr			= 900;
	condition	= DIA_Addon_Esteban_PICKPOCKET_Condition;
	information	= DIA_Addon_Esteban_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Addon_Esteban_PICKPOCKET_Condition()
{
	C_Beklauen (105, 500);
};
 
FUNC VOID DIA_Addon_Esteban_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Esteban_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Esteban_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Esteban_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Esteban_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Esteban_PICKPOCKET_DoIt);
};

func void DIA_Addon_Esteban_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Esteban_PICKPOCKET);
};
	
func void DIA_Addon_Esteban_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Esteban_PICKPOCKET);
};
//--------------------------------------------------------------------
//	Info Hi
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Hi   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 2;
	condition   = DIA_Addon_Esteban_Hi_Condition;
	information = DIA_Addon_Esteban_Hi_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Esteban_Hi_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Hi_Info()
{
	AI_Output (self, other, "DIA_Addon_Esteban_Hi_07_00");//Allora, tu sei quello che ti sei fatto strada con la forza nel campo.
	AI_Output (other, self, "DIA_Addon_Esteban_Hi_15_01");//Le notizie si spargono in fretta...
	AI_Output (self, other, "DIA_Addon_Esteban_Hi_07_02");//Franco era un osso duro. Nessuno si prendeva gioco di lui. Nessuno… eccetto te.
	AI_Output (self, other, "DIA_Addon_Esteban_Hi_07_03");//Mettiamo le cose in chiaro, se provi a fare lo stesso con me, ti ammazzo.
};
//--------------------------------------------------------------------
//	Info Mine
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Mine   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 3;
	condition   = DIA_Addon_Esteban_Mine_Condition;
	information = DIA_Addon_Esteban_Mine_Info;
	permanent   = FALSE;
	description = "Voglio entrare nella miniera!";
};
FUNC INT DIA_Addon_Esteban_Mine_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Esteban_Hi)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Mine_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Mine_15_00");//Voglio entrare nella miniera!
	AI_Output (self, other, "DIA_Addon_Esteban_Mine_07_01");//(sogghigna) Come no. Allora sei venuto dalla persona giusta.
	AI_Output (self, other, "DIA_Addon_Esteban_Mine_07_02");//Perché tutti quelli che scavano nella miniera riescono a tenersi una bella fetta d'oro.
	AI_Output (self, other, "DIA_Addon_Esteban_Mine_07_03");//E io ti do le pietre rosse che ti servono, così Thorus ti farà entrare.
};
//--------------------------------------------------------------------
//	Info Rot
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Rot   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 3;
	condition   = DIA_Addon_Esteban_Rot_Condition;
	information = DIA_Addon_Esteban_Rot_Info;
	permanent   = FALSE;
	description = "Dammi una di quelle pietre rosse.";
};
FUNC INT DIA_Addon_Esteban_Rot_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Esteban_Mine)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Rot_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Rot_15_00");//Dammi una di quelle pietre rosse.
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_01");//Va bene, ma non sono gratis.
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_02");//Di solito chiedo una percentuale dell'oro che i ragazzi riescono a estrarre.
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_03");//(riflettendo) Che cosa sai dell'estrazione dell'oro, eh?
	if (Hero_HackChance > 25) 
	{
		AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_04");//Avrai pur imparato qualche trucco, no?
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_05");//Non sembra che tu ne sappia abbastanza
	};
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_06");//(sprezzante) Se ti do una pietra rossa non è certamente perché sei un grande scavatore.
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_07");//No, ho un altro lavoro per te
	
};
//--------------------------------------------------------------------
//	Info MIS
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_MIS   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 4;
	condition   = DIA_Addon_Esteban_MIS_Condition;
	information = DIA_Addon_Esteban_MIS_Info;
	permanent   = FALSE;
	description = "Che tipo di lavoro?";
};
FUNC INT DIA_Addon_Esteban_MIS_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Esteban_Rot)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_MIS_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_MIS_15_00");//Che tipo di lavoro?
	AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_01");//Uno dei briganti aveva deciso di uccidermi e invece, le mie guardie hanno ucciso LUI.
	AI_Output (other, self, "DIA_Addon_Esteban_MIS_15_02");//Ci teneva proprio a quel lavoro, eh?
	AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_03");//Era un idiota! Un delinquente senza cervello. Non avrebbe mai avuto da solo l'idea di assalirmi.
	AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_04");//No, stava solo portando a termine un contratto, lo ha mandato qualcun altro
	AI_Output (other, self, "DIA_Addon_Esteban_MIS_15_05");//E così dovrei scoprire chi è il mandante.
	AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_06");//Chiunque mi ha mandato quell'assassino la pagherà. Trovalo, e ti farò entrare nella miniera.
	
	if !Npc_IsDead (Senyan)
	&&  Npc_KnowsInfo (other,DIA_Addon_BDT_1084_Senyan_Hi)
	{
		AI_Output (other, self, "DIA_Addon_Esteban_MIS_15_07");//Senyan mi ha mandato da te per questa faccenda.
		AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_08");//Senyan? Anche lui lavora con me. Gli ho detto che dovrebbe tenere gli occhi aperti.
	};
	
	MIS_Judas = LOG_RUNNING;
	Log_CreateTopic (Topic_Addon_Esteban,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Esteban,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Esteban, "Qualcuno ha attentato alla vita di Esteban. Dovrei scoprire chi c'è dietro.");

};
//--------------------------------------------------------------------
//	Info Attentäter (Kerl)
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Kerl   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 5;
	condition   = DIA_Addon_Esteban_Kerl_Condition;
	information = DIA_Addon_Esteban_Kerl_Info;
	permanent   = FALSE;
	description = "E che cosa dovrei fare io?";
};
FUNC INT DIA_Addon_Esteban_Kerl_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Kerl_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Kerl_15_00");//E che cosa dovrei fare io?
	AI_Output (self, other, "DIA_Addon_Esteban_Kerl_07_01");//Lo sanno tutti, qui al campo. Quindi giochi con tutte le carte scoperte.
	AI_Output (self, other, "DIA_Addon_Esteban_Kerl_07_02");//Cerca di scoprire chi è con me e chi non lo è e non farti prendere in giro dai ragazzi!
	AI_Output (self, other, "DIA_Addon_Esteban_Kerl_07_03");//Parla con Snaf. Quel grassone di un cuoco sente un sacco di cose.
	
	B_LogEntry (Topic_Addon_Esteban, "Per scoprire il responsabile, dovrei parlare a tutte le persone presenti nel campo, per scoprire da che parte stanno. Vale la pena di andare da Snaf, perché sente un sacco di cose.");
};
//--------------------------------------------------------------------
//	Info Armor 
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Armor   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 9;
	condition   = DIA_Addon_Esteban_Armor_Condition;
	information = DIA_Addon_Esteban_Armor_Info;
	permanent   = FALSE;
	description = "Ho bisogno di un'armatura migliore.";
};
FUNC INT DIA_Addon_Esteban_Armor_Condition()
{	
	if (Huno_ArmorCheap == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Armor_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Armor_15_00"); //Ho bisogno di un'armatura migliore.
	AI_Output (self, other, "DIA_Addon_Esteban_Armor_07_01"); //Perché? Ne hai già. Per ora ti basta.
	if (MIS_Judas == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Addon_Esteban_Armor_07_02"); //Se porti a termine il tuo incarico, ne riparleremo
	};
};
//--------------------------------------------------------------------
//	Info Auftrag
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Auftrag   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 99;
	condition   = DIA_Addon_Esteban_Auftrag_Condition;
	information = DIA_Addon_Esteban_Auftrag_Info;
	permanent   = TRUE;
	description = "A proposito dell'incarico…";
};
FUNC INT DIA_Addon_Esteban_Auftrag_Condition()
{	
	if ((MIS_Judas == LOG_RUNNING)
	|| (MIS_Judas == LOG_SUCCESS))
	&& (Bodyguard_Killer == FALSE)	
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Auftrag_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Auftrag_15_00");//A proposito dell'incarico
	AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_01");//Senti, ho altre cose da fare.
	
	if (MIS_Judas == LOG_SUCCESS)
	{
		AI_Output (other, self, "DIA_Addon_Esteban_Auftrag_15_02");//Pensavo che avrebbe potuto interessarti sapere chi è il mandante dell'attacco
		AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_03");//Chi è? Dimmi il suo nome così le mie guardie potranno tirargli il collo
		AI_Output (other, self, "DIA_Addon_Esteban_Auftrag_15_04");//Il mandante è Fisk, il commerciante. In questo momento se ne sta al bar a bere e non sospetta nulla
		AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_05");//Ah! Bel lavoro, ragazzo. Le mie guardie si occuperanno di lui.
		
		AI_TurnToNpc (self, Wache_01);
		AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_06");//Avete sentito, ragazzi. Andate a prendere Fisk.
		AI_TurnToNpc (self, other);
		
		Bodyguard_Killer = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_07");//Torna quando avrai scoperto di chi si tratta.
		AI_StopProcessInfos(self);
	};
};	
//--------------------------------------------------------------------
//	Info Guards Away
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Away   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 5;
	condition   = DIA_Addon_Esteban_Away_Condition;
	information = DIA_Addon_Esteban_Away_Info;
	permanent   = FALSE;
	description = "E poi che cosa succede?";
};
FUNC INT DIA_Addon_Esteban_Away_Condition()
{	
	if (Bodyguard_Killer == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Away_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Away_15_00");//E poi che cosa succede?
	AI_Output (self, other, "DIA_Addon_Esteban_Away_07_01");//Poi cosa succede? Te lo dico io che cosa succede.
	AI_Output (self, other, "DIA_Addon_Esteban_Away_07_02");//A Fisk toccherà una morte dolorosa. E tutti quanti al campo lo verranno a sapere.
	AI_Output (self, other, "DIA_Addon_Esteban_Away_07_03");//Servirà di monito per tutti quanti!
	
	B_StartotherRoutine (Wache_01,"AMBUSH");
	B_StartotherRoutine (Wache_02,"AMBUSH");
};
//--------------------------------------------------------------------
//	Info Stone
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Stone   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 5;
	condition   = DIA_Addon_Esteban_Stone_Condition;
	information = DIA_Addon_Esteban_Stone_Info;
	permanent   = FALSE;
	description = "Ora posso avere una pietra rossa?";
};
FUNC INT DIA_Addon_Esteban_Stone_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Esteban_Away)
	&& (Bodyguard_Killer == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Stone_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Stone_15_00");//Ora posso avere una pietra rossa?
	AI_Output (self, other, "DIA_Addon_Esteban_Stone_07_01");//Hai fatto un buon lavoro. Uno come te non ha niente da fare nella miniera.
	AI_Output (self, other, "DIA_Addon_Esteban_Stone_07_02");//Mi puoi essere molto più utile qua fuori. Resterai nel campo e continuerai a lavorare per me.
};		
//--------------------------------------------------------------------
//	Info nicht arbeiten
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_not   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 5;
	condition   = DIA_Addon_Esteban_not_Condition;
	information = DIA_Addon_Esteban_not_Info;
	permanent   = FALSE;
	description = "Ci penserò su.";
};
FUNC INT DIA_Addon_Esteban_not_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Esteban_Stone)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_not_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_not_15_00");//Ci penserò su.
	AI_Output (self, other, "DIA_Addon_Esteban_not_07_01");//Te lo ricordi con chi stai parlando? Qui il capo sono io e tu farai esattamente quello che dico io.
	AI_Output (self, other, "DIA_Addon_Esteban_not_07_02");//E io dico che lavorerai per me e per nessun altro. È chiaro?
};
//--------------------------------------------------------------------
//	Info Leibwache weg (fight)
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_fight   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 6;
	condition   = DIA_Addon_Esteban_fight_Condition;
	information = DIA_Addon_Esteban_fight_Info;
	permanent   = FALSE;
	description = "Vuoi prendermi in giro?";
};
FUNC INT DIA_Addon_Esteban_fight_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Esteban_Stone)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_fight_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_fight_15_00");//Stai cercando di prendermi per fesso? Che io lavori per te è fuori discussione.
	AI_Output (self, other, "DIA_Addon_Esteban_fight_07_01");//Non tutti ricevono un'offerta del genere. Ma se la rifiuti, sei libero di lasciare il campo
	AI_Output (other, self, "DIA_Addon_Esteban_fight_15_02");//Cosa ne dici di mantenere la tua parola e darmi una pietra rossa?
	AI_Output (self, other, "DIA_Addon_Esteban_fight_07_03");//Ehi, un'altra parola e le mie guardie dovranno fare del male anche a te.
	AI_Output (other, self, "DIA_Addon_Esteban_fight_15_04");//(sogghigna) Quali guardie…?
	AI_Output (self, other, "DIA_Addon_Esteban_fight_07_05");//Cosa..? Ah, capisco… stai cercando di scavalcarmi, aspetta un po'
	
	Bodyguard_Killer = FALSE;
	
	B_KillNpc (Wache_01);
	B_KillNpc (Wache_02);
		
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE,1);
};
//---------------------------------------------------------------------
//	Info Duell
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Duell   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 99;
	condition   = DIA_Addon_Esteban_Duell_Condition;
	information = DIA_Addon_Esteban_Duell_Info;
	permanent   = FALSE;
	description = "Dammi la pietra SUBITO o la prenderò da me!";
};
FUNC INT DIA_Addon_Esteban_Duell_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Esteban_Rot))
	&& (Bodyguard_Killer != TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Duell_Info()
{	
	AI_Output (other,self,"DIA_Addon_Esteban_Duell_15_00"); //Dammi la pietra SUBITO o la prenderò da me!
	AI_Output (self,other,"DIA_Addon_Esteban_Duell_07_01"); //Oh, allora vuoi morire. Molto bene, ti farò un favore e ti libererò della tua stupidità!
	
	AI_StopProcessInfos(self);
	B_Attack (self, other, AR_NONE, 1);
};




