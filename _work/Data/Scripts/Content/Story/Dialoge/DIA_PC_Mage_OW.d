


// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_MiltenOW_EXIT(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 999;
	condition	= DIA_MiltenOW_EXIT_Condition;
	information	= DIA_MiltenOW_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_MiltenOW_EXIT_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_MiltenOW_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  		Hallo
// ************************************************************

INSTANCE DIA_MiltenOW_Hello (C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= TRUE;
	condition	= DIA_MiltenOW_Hello_Condition;
	information	= DIA_MiltenOW_Hello_Info;
	permanent	= FALSE;
	IMPORTANT 	= TRUE;
};                       

FUNC INT DIA_MiltenOW_Hello_Condition()
{
		return TRUE;
};
FUNC VOID DIA_MiltenOW_Hello_Info()
{	
	AI_Output	(self ,other,"DIA_MiltenOW_Hello_03_00");//Guarda chi è tornato! Il nostro eroe della Barriera!
	
	Info_ClearChoices (DIA_MiltenOW_Hello);
	Info_AddChoice (DIA_MiltenOW_Hello,"È un piacere vederti, Milten.",DIA_MiltenOW_Hello_YES);
	Info_AddChoice (DIA_MiltenOW_Hello,"Ci conosciamo?",DIA_MiltenOW_Hello_NO);
};
	// ------------------------------------
	func void B_Milten_GornDiegoLester()
	{
		AI_Output 	(self ,other,"DIA_MiltenOW_Hello_NO_03_02"); //Ti ricordi Gorn, Diego e Lester?
	};
	// ------------------------------------

FUNC VOID DIA_MiltenOW_Hello_YES()
{
	AI_Output	(other,self ,"DIA_MiltenOW_Hello_YES_15_00");//Felice di vederti, Milten. Sei ancora qui, oppure nuovamente qui?
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_YES_03_01");//Nuovamente. Dopo che la Barriera è crollata mi sono unito al monastero dei Maghi del Fuoco.
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_YES_03_02");//Ma quando è stato chiaro che i paladini volessero venire qui, la mia esperienza e la mia conoscenza del luogo si sono rivelate abbastanza utili.
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_YES_03_03");//Così hanno deciso di affidarmi la sacra missione di fornire supporto magico a questa spedizione.
	B_Milten_GornDiegoLester();
	
	Info_ClearChoices (DIA_MiltenOW_Hello);
	Info_AddChoice (DIA_MiltenOW_Hello,"Certo che mi ricordo dei ragazzi.",DIA_MiltenOW_Hello_Friends);
	Info_AddChoice (DIA_MiltenOW_Hello,"Quei nomi non mi dicono assolutamente nulla.",DIA_MiltenOW_Hello_Forget);
};
FUNC VOID DIA_MiltenOW_Hello_NO()
{
	AI_Output	(other,self ,"DIA_MiltenOW_Hello_NO_15_00");//Dovrei conoscerli?
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_NO_03_01");//Ne hai viste di tutti i colori, eh?
	B_Milten_GornDiegoLester();
	
	Info_ClearChoices (DIA_MiltenOW_Hello);
	Info_AddChoice (DIA_MiltenOW_Hello,"Allora, cosa c’è da riferire?",DIA_MiltenOW_Hello_Friends);
	Info_AddChoice (DIA_MiltenOW_Hello,"Quei nomi non mi dicono assolutamente nulla.",DIA_MiltenOW_Hello_Forget);
};
FUNC VOID DIA_MiltenOW_Hello_Friends()
{
	AI_Output	(other,self ,"DIA_MiltenOW_Hello_Friends_15_00");//Certo che mi ricordo dei ragazzi.
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_Friends_03_01");//Beh, Gorn e Diego non sono andati lontano. Sono stati acciuffati dai paladini qui nella valle.
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_Friends_03_02");//Lester è scomparso, però non ho idea dove sia finito.
	
	if (Npc_KnowsInfo (other, DIA_Lester_Hello)) 
	{
		AI_Output	(other,self ,"DIA_MiltenOW_Hello_Friends_15_03");//Ho incontrato Lester, è con Xardas al momento.
		AI_Output 	(self ,other,"DIA_MiltenOW_Hello_Friends_03_04");//Una buona notizia, finalmente.
	};
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_Friends_03_05");//Beh, non ho nient'altro di piacevole da riferire.
	
	Knows_Diego = TRUE;
	Info_ClearChoices (DIA_MiltenOW_Hello);
};
FUNC VOID DIA_MiltenOW_Hello_Forget()
{
	AI_Output (other,self ,"DIA_MiltenOW_Hello_Forget_15_00");//Quei nomi non mi dicono assolutamente nulla.
	AI_Output (self ,other,"DIA_MiltenOW_Hello_Forget_03_01");//Hai dimenticato molte cose, non è vero? Beh, mettiamo da parte il passato e pensiamo al presente.
	AI_Output (self ,other,"DIA_MiltenOW_Hello_Forget_03_02");//Anche se non c'è niente di piacevole da riferire.
	
	Info_ClearChoices (DIA_MiltenOW_Hello);
};
// ************************************************************
// 		Bericht	  				  
// ************************************************************
INSTANCE DIA_MiltenOW_Bericht(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 3;
	condition	= DIA_MiltenOW_Bericht_Condition;
	information	= DIA_MiltenOW_Bericht_Info;
	permanent	= FALSE;
	description = "Allora, cosa c’è da riferire?";
};                       

FUNC INT DIA_MiltenOW_Bericht_Condition()
{	
	if Npc_KnowsInfo (other,DIA_MiltenOW_Hello)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Bericht_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Bericht_15_00");//Allora, cosa c’è da riferire?
	AI_Output (self ,other,"DIA_MiltenOW_Bericht_03_01");//I paladini sono venuti qui con l'intenzione di estrarre il metallo magico.
	AI_Output (self ,other,"DIA_MiltenOW_Bericht_03_02");//Ma dopo gli attacchi dei draghi e degli orchi, non riesco a credere che i paladini marceranno fuori di qui con il metallo.
	AI_Output (self ,other,"DIA_MiltenOW_Bericht_03_03");//No, per Innos, avverto la presenza di qualcosa di oscuro... qualcosa di malvagio sta sorgendo qui. Qualcosa che scaturisce da questa valle.
	AI_Output (self ,other,"DIA_MiltenOW_Bericht_03_04");//Abbiamo pagato un prezzo salato per la l'annientamento del Dormiente. La distruzione della Barriera ha devastato anche questo posto.
	AI_Output (self ,other,"DIA_MiltenOW_Bericht_03_05");//Potremo ritenerci fortunati se sopravvivremo a tutto questo.
};
// ************************************************************
// 		Erz		  
// ************************************************************
INSTANCE DIA_MiltenOW_Erz(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 4;
	condition	= DIA_MiltenOW_Erz_Condition;
	information	= DIA_MiltenOW_Erz_Info;
	permanent	= FALSE;
	description = "Quanto minerale avete messo da parte, finora?";
};                       

FUNC INT DIA_MiltenOW_Erz_Condition()
{	
	if Npc_KnowsInfo (other,DIA_MiltenOW_Bericht)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Erz_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Erz_15_00");//Quanto metallo avete messo da parte, finora?
	AI_Output (self ,other,"DIA_MiltenOW_Erz_03_01");//Quanto metallo...? Neanche una cassa! Non riceviamo più notizie dei minatori da parecchio tempo.
	AI_Output (self ,other,"DIA_MiltenOW_Erz_03_02");//Non sarei sorpreso se fossero tutti morti da tempo. E noi siamo attaccati dai draghi e assediati dagli orchi!
	AI_Output (self ,other,"DIA_MiltenOW_Erz_03_03");//Questa spedizione è un completo disastro.
	
};
/*	
	Diesen Blick kenne ich, den hattest Du auch kurz bevor Du in den Schläfertempel gegangen bist.
*/
// ************************************************************
// 		Wo sind Gorn und Diego?	  				  
// ************************************************************
INSTANCE DIA_MiltenOW_Wo(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 5;
	condition	= DIA_MiltenOW_Wo_Condition;
	information	= DIA_MiltenOW_Wo_Info;
	permanent	= FALSE;
	description = "Dove sono Gorn e Diego?";
};                       

FUNC INT DIA_MiltenOW_Wo_Condition()
{	
	if Npc_KnowsInfo (other,DIA_MiltenOW_Hello)
	&& (Knows_Diego == TRUE)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Wo_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Wo_Forget_15_00");//Dove sono Gorn e Diego?
	AI_Output (self ,other,"DIA_MiltenOW_Wo_Forget_03_01");//Beh, Gorn è chiuso nei sotterranei poiché si è opposto all'arresto.
	AI_Output (self ,other,"DIA_MiltenOW_Wo_Forget_03_02");//Hanno assegnato Diego a un gruppo di minatori, chiedi al paladino Parcival, è lui che ha diviso i gruppi.
	
	KnowsAboutGorn = TRUE; 
	SearchForDiego = LOG_RUNNING; 
};
// ************************************************************
// 		Gorn befreien			  
// ************************************************************
INSTANCE DIA_MiltenOW_Gorn(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 5;
	condition	= DIA_MiltenOW_Gorn_Condition;
	information	= DIA_MiltenOW_Gorn_Info;
	permanent	= FALSE;
	description = "Andiamo a liberare Gorn!";
};                       

FUNC INT DIA_MiltenOW_Gorn_Condition()
{	
	if (KnowsAboutGorn == TRUE)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Gorn_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Gorn_15_00");//Andiamo a liberare Gorn!
	AI_Output (self ,other,"DIA_MiltenOW_Gorn_03_01");//Beh, il problema è che Gorn è un detenuto prigioniero.
	AI_Output (self ,other,"DIA_MiltenOW_Gorn_03_02");//Ma se siamo fortunati Garond accetterà uno scambio, e potremo comprare la sua libertà.
	AI_Output (other,self ,"DIA_MiltenOW_Gorn_15_03");//Sì, forse...
	AI_Output (self ,other,"DIA_MiltenOW_Gorn_03_04");//Contami nei tuoi piani.
	
	Log_CreateTopic (TOPIC_RescueGorn,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_RescueGorn,LOG_RUNNING);
	B_LogEntry (TOPIC_RescueGorn,"Il comandante Garond ha imprigionato Gorn. Forse potremo trovare un accordo per farlo uscire dal carcere.");
};
// ************************************************************
// 		Garond will tausend Goldstücke			  
// ************************************************************
INSTANCE DIA_MiltenOW_Preis(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 5;
	condition	= DIA_MiltenOW_Preis_Condition;
	information	= DIA_MiltenOW_Preis_Info;
	permanent	= FALSE;
	description = "Garond vuole 1000 monete d’oro in cambio di Gorn.";
};                       

FUNC INT DIA_MiltenOW_Preis_Condition()
{	
	if (MIS_RescueGorn == LOG_RUNNING)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Preis_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Preis_15_00");//Garond vuole 1000 monete d’oro in cambio di Gorn.
	AI_Output (self ,other,"DIA_MiltenOW_Preis_03_01");//Una bella somma. Posso contribuire con 250 pezzi d'oro.
	
	B_GiveInvItems (self, other, Itmi_gold, 250);
	B_LogEntry (TOPIC_RescueGorn,"Milten mi ha dato 250 pezzi d'oro per pagare la liberazione di Gorn.");

};
// ************************************************************
// 		Nicht genug Gold  
// ************************************************************
INSTANCE DIA_MiltenOW_Mehr(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 5;
	condition	= DIA_MiltenOW_Mehr_Condition;
	information	= DIA_MiltenOW_Mehr_Info;
	permanent	= FALSE;
	description = "Ho bisogno di altro oro per comprare la libertà di Gorn.";
};                       

FUNC INT DIA_MiltenOW_Mehr_Condition()
{	
	if (MIS_RescueGorn == LOG_RUNNING)
	&& (Kapitel == 2)
	&& (Npc_HasItems (other, ItMi_Gold) < 1000) 
	&& Npc_KnowsInfo (other, DIA_MiltenOW_Preis) 
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Mehr_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Mehr_15_00");//Ho bisogno di altro oro per comprare la libertà di Gorn.
	AI_Output (self ,other,"DIA_MiltenOW_Mehr_03_01");//Ottenere più oro... mmh. Diego saprebbe molto a riguardo, ma non è qui.
	AI_Output (self ,other,"DIA_MiltenOW_Mehr_03_02");//Forse Gorn stesso ha dell'oro nascosto da qualche parte, dovremmo scoprirlo.
	AI_Output (self ,other,"DIA_MiltenOW_Mehr_03_03");//Gli scriverò un messaggio. Tieni, cerca di portarlo di nascosto nei sotterranei.
	
	B_GiveInvItems(self,other,ItWr_LetterForGorn_MIS,1);	 
	B_LogEntry (TOPIC_RescueGorn,"Milten mi ha dato un messaggio per Gorn. Se riuscissi a farglielo arrivare in prigione, potrebbe dirci se ha dell'oro messo da parte.");
};
// ************************************************************
// 		Ausrüstung				  
// ************************************************************
INSTANCE DIA_MiltenOW_Equipment(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 5;
	condition	= DIA_MiltenOW_Equipment_Condition;
	information	= DIA_MiltenOW_Equipment_Info;
	permanent	= FALSE;
	description = "Puoi equipaggiarmi?";
};                       

FUNC INT DIA_MiltenOW_Equipment_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Garond_Equipment)
	&& (other.guild == GIL_KDF)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Equipment_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Equipmentt_15_00");//Puoi darmi dell'equipaggiamento? Garond mi ha chiesto di recarmi alle miniere.
	AI_Output (self ,other,"DIA_MiltenOW_Equipment_03_01");//E dove dovrei recuperarlo, secondo te? L'unica cosa che ti posso dare è una pietra runica di un certo valore.
	//AI_Output (self ,other,"DIA_MiltenOW_Equipmentt_03_02");//Hier stehen zwar noch ein paar Truhen rum, aber ich kann die Schlösser nicht öffnen.  
	
	B_GiveInvItems (self,other, ItMI_RuneBlank,1);
	//Schlüssel auf FP inserten
};	

//***********************
//	Gorns Versteck
//***********************

INSTANCE DIA_MiltenOW_Versteck (C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 1;
	condition	= DIA_MiltenOW_Versteck_Condition;
	information	= DIA_MiltenOW_Versteck_Info;
	permanent	= FALSE;
	IMPORTANT 	= FALSE;
	description = "Ho una risposta da parte di Gorn..."; 
}; 

FUNC INT DIA_MiltenOW_Versteck_Condition()
{
	if (GornsTreasure == TRUE)
	&& (Npc_HasItems (other, ItMi_GornsTreasure_MIS ) <= 0)
	&& (Gorns_Beutel == FALSE)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_MiltenOW_Versteck_Info()
{
	AI_Output	(other,self ,"DIA_MiltenOW_Versteck_15_00"); //Ho ricevuto una risposta da parte di Gorn. Dice che l'oro è al cancello sud.
	AI_Output	(self ,other,"DIA_MiltenOW_Versteck_03_01"); //(amaramente) Ex cancello sud, vorrai dire. I draghi lo hanno ridotto in macerie.
	AI_Output	(other,self ,"DIA_MiltenOW_Versteck_15_02"); //Come posso arrivarci?
	AI_Output	(self ,other,"DIA_MiltenOW_Versteck_03_03"); //È vicino all'ariete degli orchi. Il cancello a sud era proprio a destra di esso.
	AI_Output	(self ,other,"DIA_MiltenOW_Versteck_03_04"); //Non sarà facile, tieni la testa bassa e corri.
	
	B_LogEntry (TOPIC_RescueGorn,"Il vecchio ingresso sud è a destra dell'ariete degli orchi. L'oro di Gorn è da qualche parte lì sotto.");
};
// ************************************************************
// 		Gorn ist frei		  
// ************************************************************
INSTANCE DIA_MiltenOW_Frei(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 5;
	condition	= DIA_MiltenOW_Frei_Condition;
	information	= DIA_MiltenOW_Frei_Info;
	permanent	= FALSE;
	description = "Ho liberato Gorn.";
};                       

FUNC INT DIA_MiltenOW_Frei_Condition()
{	
	if (MIS_RescueGorn == LOG_SUCCESS)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Frei_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Frei_15_00");//Ho liberato Gorn.
	AI_Output (self ,other,"DIA_MiltenOW_Frei_03_01");//Ottimo. Ora dovremmo pensare alla prossima mossa.
};
// ************************************************************
// 		Lehren
// ************************************************************
INSTANCE DIA_MiltenOW_Lehren(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 9;
	condition	= DIA_MiltenOW_Lehren_Condition;
	information	= DIA_MiltenOW_Lehren_Info;
	permanent	= FALSE;
	description = "Puoi insegnarmi qualcosa?";
};                       

FUNC INT DIA_MiltenOW_Lehren_Condition()
{	
	if (other.guild == GIL_KDF)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Lehren_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Lehren_15_00");//Puoi insegnarmi qualcosa?
	AI_Output (self ,other,"DIA_MiltenOW_Lehren_03_01");//Posso istruirti in qualche incantesimo del secondo Circolo della Magia, oppure posso aiutarti ad aumentare il tuo potere magico.
	AI_Output (self ,other,"DIA_MiltenOW_Lehren_03_02");//Se ti senti pronto ad aumentare il tuo potere, allora potrò istruirti.
};	

// ************************************************************
// 		Teach zweiter Kreis
// ************************************************************
INSTANCE DIA_MiltenOW_TeachCircle2(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 91;
	condition	= DIA_MiltenOW_TeachCircle2_Condition;
	information	= DIA_MiltenOW_TeachCircle2_Info;
	permanent	= TRUE;
	description = "Insegnami il secondo Circolo della Magia!";
};                       

FUNC INT DIA_MiltenOW_TeachCircle2_Condition()
{	
	if (other.guild == GIL_KDF)
	&& (Npc_KnowsInfo (other,DIA_MiltenOW_Lehren))
	&& (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) < 2)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_TeachCircle2_Info()
{	
	AI_Output (other, self, "DIA_Milten_Add_15_00"); //Insegnami il secondo Cerchio della magia.
	AI_Output (self, other, "DIA_Milten_Add_03_01"); //Normalmente questo è un privilegio riservato agli insegnanti del nostro ordine.
	AI_Output (self, other, "DIA_Milten_Add_03_02"); //Ma penso che, in questo caso, possiamo fare un'eccezione...
	
	if (B_TeachMagicCircle (self, other, 2))
	{
		AI_Output (self, other, "DIA_Milten_Add_03_03"); //Non so se mi ricordo bene le parole ufficiali...
		AI_Output (self, other, "DIA_Milten_Add_03_04"); //Accedi ora al secondo Circolo. Ehm... Ti mostrerà la via, ma le tue azioni formeranno il sentiero, o qualcosa del genere...
		AI_Output (self, other, "DIA_Milten_Add_03_05"); //Penso tu capisca cosa significa...
	};
};


// ************************************************************
// 		Teach
// ************************************************************
INSTANCE DIA_MiltenOW_Teach(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 90;
	condition	= DIA_MiltenOW_Teach_Condition;
	information	= DIA_MiltenOW_Teach_Info;
	permanent	= TRUE;
	description = "Voglio apprendere qualche nuovo incantesimo.";
};                       

FUNC INT DIA_MiltenOW_Teach_Condition()
{	
	if (other.guild == GIL_KDF)
	&& Npc_KnowsInfo (other,DIA_MiltenOW_Lehren)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Teach_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Teach_15_00");//Voglio apprendere qualche nuovo incantesimo.
	
	if  (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 2)
	{
		Info_ClearChoices (DIA_MiltenOW_Teach);
		Info_AddChoice (DIA_MiltenOW_Teach,DIALOG_BACK,DIA_MiltenOW_Teach_BACK);
		
		if (PLAYER_TALENT_RUNES [SPL_WINDFIST] == FALSE) 
		{
			Info_AddChoice	(DIA_MiltenOW_Teach, B_BuildLearnString (NAME_SPL_WINDFIST, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_WINDFIST)) ,DIA_MiltenOW_Teach_Windfist);
		};
		if (PLAYER_TALENT_RUNES [SPL_InstantFireball] == FALSE) 
		{
			Info_AddChoice	(DIA_MiltenOW_Teach, B_BuildLearnString (NAME_SPL_InstantFireball, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_InstantFireball)) ,DIA_MiltenOW_Teach_Feuerball);
		};
		if (PLAYER_TALENT_RUNES [SPL_Icebolt] == FALSE) 
		{
			Info_AddChoice	(DIA_MiltenOW_Teach, B_BuildLearnString (NAME_SPL_Icebolt, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Icebolt)) ,DIA_MiltenOW_Teach_Eispfeil);
		};
	}
	else
	{
		AI_Output (self ,other,"DIA_MiltenOW_Teach_03_01");//Non hai ancora raggiunto il secondo Circolo della Magia. Non posso insegnarti nulla.
	};
};	
FUNC VOID DIA_MiltenOW_Teach_BACK()
{
	Info_ClearChoices (DIA_MiltenOW_Teach);
};
FUNC VOID DIA_MiltenOW_Teach_WINDFIST()
{
	B_TeachPlayerTalentRunes (self, other, SPL_WINDFIST);	
};
FUNC VOID DIA_MiltenOW_Teach_Feuerball()
{
	B_TeachPlayerTalentRunes (self, other, SPL_InstantFireball);	
};
FUNC VOID DIA_MiltenOW_Teach_Eispfeil()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Icebolt);	
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_MiltenOW_Mana		(C_INFO)
{
	npc		  	 = 	PC_Mage_OW;
	nr			 = 	100;
	condition	 = 	DIA_MiltenOW_Mana_Condition;
	information	 = 	DIA_MiltenOW_Mana_Info;
	permanent	 = 	TRUE;
	description	 = 	"Voglio aumentare i miei poteri magici.";
};
func int DIA_MiltenOW_Mana_Condition ()
{	
	if (other.guild == GIL_KDF)
	&& Npc_KnowsInfo (other,DIA_MiltenOW_Lehren)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
};
func void DIA_MiltenOW_Mana_Info ()
{
	AI_Output (other, self, "DIA_MiltenOW_Mana_15_00"); //Voglio aumentare i miei poteri magici.
	
	Info_ClearChoices   (DIA_MiltenOW_Mana);
	Info_AddChoice 		(DIA_MiltenOW_Mana, DIALOG_BACK, DIA_MiltenOW_Mana_BACK);
	Info_AddChoice		(DIA_MiltenOW_Mana, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))		,DIA_MiltenOW_Mana_1);
	Info_AddChoice		(DIA_MiltenOW_Mana, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_MiltenOW_Mana_5);
	
};
func void DIA_MiltenOW_Mana_BACK()
{
	if (other.attribute[ATR_MANA_MAX] >= T_MED)
	{
		AI_Output (self, other, "DIA_MiltenOW_Mana_03_00"); //Il tuo potere magico è grande. Troppo grande perché io sia in grado di aiutarti ad aumentarlo.
	};
	Info_ClearChoices (DIA_MiltenOW_Mana);
};
func void DIA_MiltenOW_Mana_1()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 1, T_MED);
	
	Info_ClearChoices   (DIA_MiltenOW_Mana);
	
	Info_AddChoice 		(DIA_MiltenOW_Mana, DIALOG_BACK, DIA_MiltenOW_Mana_BACK);
	Info_AddChoice		(DIA_MiltenOW_Mana, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))		,DIA_MiltenOW_Mana_1);
	Info_AddChoice		(DIA_MiltenOW_Mana, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_MiltenOW_Mana_5);
	
	
};
func void DIA_MiltenOW_Mana_5()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 5, T_MED);
	
	Info_ClearChoices   (DIA_MiltenOW_Mana);
	
	Info_AddChoice 		(DIA_MiltenOW_Mana, DIALOG_BACK, DIA_MiltenOW_Mana_BACK);
	Info_AddChoice		(DIA_MiltenOW_Mana, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))		,DIA_MiltenOW_Mana_1);
	Info_AddChoice		(DIA_MiltenOW_Mana, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_MiltenOW_Mana_5);
	
};
// ************************************************************
// 		Perm
// ************************************************************
INSTANCE DIA_MiltenOW_Perm(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 101;
	condition	= DIA_MiltenOW_Perm_Condition;
	information	= DIA_MiltenOW_Perm_Info;
	permanent	= TRUE;
	description = "Qual è il tuo compito?";
};                       
FUNC INT DIA_MiltenOW_Perm_Condition()
{	
	if (Kapitel == 2)
	&& (Npc_KnowsInfo (other, DIA_MiltenOW_Frei) == FALSE)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Perm_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Perm_15_00");//Qual è il tuo compito, qui?
	AI_Output (self ,other,"DIA_MiltenOW_Perm_03_01");//Originariamente avrei dovuto saggiare il metallo magico. Ma non se n'è visto molto finora.
	AI_Output (self ,other,"DIA_MiltenOW_Perm_03_02");//Ora mi sto concentrando sullo studio dell'alchimia.
};
// ************************************************************
// 		Perm 2
// ************************************************************
INSTANCE DIA_MiltenOW_Plan(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 101;
	condition	= DIA_MiltenOW_Plan_Condition;
	information	= DIA_MiltenOW_Plan_Info;
	permanent	= TRUE;
	description = "Quali sono i tuoi piani?";
};                       
FUNC INT DIA_MiltenOW_Plan_Condition()
{	
	if (Kapitel == 2)
	&& Npc_KnowsInfo (other, DIA_MiltenOW_Frei) 
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Plan_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Plan_15_00");//Quali sono i tuoi piani?
	AI_Output (self ,other,"DIA_MiltenOW_Plan_03_01");//Ho intenzione di tornare. Attenderò ancora un po', ma ora che Gorn è libero posso andarmene con lui.
	AI_Output (self ,other,"DIA_MiltenOW_Plan_03_02");//È assolutamente necessario che Pyrokar venga a conoscenza della situazione.
	AI_Output (other,self ,"DIA_MiltenOW_Plan_15_03");//Fai come credi.
	AI_Output (self ,other,"DIA_MiltenOW_Plan_03_04");//Spero che quel Lord Hagen riconosca la minaccia che scaturisce da questa valle. Per non pensare a cosa succederebbe se gli orchi attraversassero il passo.
	AI_Output (other,self ,"DIA_MiltenOW_Plan_15_05");//Bene, dunque, buon viaggio.
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_MiltenOW_PICKPOCKET (C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 888;
	condition	= DIA_MiltenOW_PICKPOCKET_Condition;
	information	= DIA_MiltenOW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Sarebbe difficile sottrargli la pozione)";
};                       

FUNC INT DIA_MiltenOW_PICKPOCKET_Condition()
{
	if (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == TRUE)
	&& (other.attribute[ATR_DEXTERITY] >= (80 - TheftDiff))
	{
		return 1;
	};
};
FUNC VOID DIA_MiltenOW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_MiltenOW_PICKPOCKET);
	Info_AddChoice		(DIA_MiltenOW_PICKPOCKET, DIALOG_BACK 		,DIA_MiltenOW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_MiltenOW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_MiltenOW_PICKPOCKET_DoIt);
};

func void DIA_MiltenOW_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 80)
	{
		CreateInvItems (self,ItPo_Perm_Mana,1);
		B_GiveInvItems (self, other, ItPo_Perm_Mana, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();	
		Info_ClearChoices (DIA_MiltenOW_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_MiltenOW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_MiltenOW_PICKPOCKET);
};



