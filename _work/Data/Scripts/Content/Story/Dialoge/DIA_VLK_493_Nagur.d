///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_EXIT   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 999;
	condition   = DIA_Nagur_EXIT_Condition;
	information = DIA_Nagur_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Nagur_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Nagur_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Nagur_PICKPOCKET (C_INFO)
{
	npc			= VLK_493_Nagur;
	nr			= 900;
	condition	= DIA_Nagur_PICKPOCKET_Condition;
	information	= DIA_Nagur_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Nagur_PICKPOCKET_Condition()
{
	C_Beklauen (75, 150);
};
 
FUNC VOID DIA_Nagur_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Nagur_PICKPOCKET);
	Info_AddChoice		(DIA_Nagur_PICKPOCKET, DIALOG_BACK 		,DIA_Nagur_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Nagur_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Nagur_PICKPOCKET_DoIt);
};

func void DIA_Nagur_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Nagur_PICKPOCKET);
};
	
func void DIA_Nagur_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Nagur_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info vor dem Auftrag (Spieler hat noch nicht mit Kardif geredet)
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_Hallo   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 2;
	condition   = DIA_Nagur_Hallo_Condition;
	information = DIA_Nagur_Hallo_Info;
	permanent   = TRUE;
	important   = TRUE;
};

FUNC INT DIA_Nagur_Hallo_Condition()
{	
	if (Npc_IsInState (self, ZS_Talk)
	&& (DIA_Kardif_Diebeswerk_permanent == FALSE))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Hallo_Info()
{
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Nagur_Hallo_08_00");//Ehi, non ho tempo di chiacchierare con te. Parla con Kardif se cerchi informazioni.
		AI_StopProcessInfos (self);
	}
	else 
	{
		AI_Output (self, other, "DIA_Nagur_Hallo_08_01");//Amico, lasciami solo, va bene?
		AI_StopProcessInfos (self);
	};
};
///////////////////////////////////////////////////////////////////////
//	Job Angebot
///////////////////////////////////////////////////////////////////////
	var int NagurHack;
	
	func void B_Nagur_Abfertigen()
	{
		var C_ITEM heroArmor; heroArmor = Npc_GetEquippedArmor(other);
		if (Hlp_IsItem (heroArmor, ItAr_MIL_L) == FALSE)
		&& (Hlp_IsItem (heroArmor, ItAr_MIL_M) == FALSE)
		&& (Hlp_IsItem (heroArmor, ItAr_PAL_M) == FALSE)
		&& (Hlp_IsItem (heroArmor, ItAr_PAL_H) == FALSE)
		&& (Hlp_IsItem (heroArmor, ItAr_NOV_L) == FALSE)
		&& (Hlp_IsItem (heroArmor, ItAr_KDF_L) == FALSE)
		&& (Hlp_IsItem (heroArmor, ItAr_KDF_H) == FALSE)
		{
			AI_Output (self ,other,"DIA_Nagur_Add_08_02"); //E non pensare che non ti riconosca solo perché vesti abiti differenti.
		};
		
		AI_Output (self ,other,"DIA_Nagur_Add_08_03"); //(cospirativo) Stai per ficcare il naso in faccende che non ti riguardano!
		AI_Output (self ,other,"DIA_Nagur_Add_08_04"); //Sparisci!
		
		MIS_Nagur_Bote = LOG_SUCCESS; //HACK: Attila kommt bei 3* Success oder 1* suckt --> nur noch die anderen beiden Missionen sind Trigger
		NagurHack = TRUE;
		AI_StopProcessInfos (self);
	};

INSTANCE DIA_Nagur_Job   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 3;
	condition   = DIA_Nagur_Job_Condition;
	information = DIA_Nagur_Job_Info;
	permanent   = FALSE;
	description = "Kardif ha detto che tu potresti avere un lavoro per me.";
};
FUNC INT DIA_Nagur_Job_Condition()
{	
	if (DIA_Kardif_Diebeswerk_permanent == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Job_Info()
{
	AI_Output (other, self, "DIA_Nagur_Job_15_00");//Kardif ha detto che tu potresti avere un lavoro per me.
	if (other.guild == GIL_NOV)
	|| (other.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Nagur_Add_08_00"); //Qui al porto non ci sono lavori per gente del monastero! (ride)
		B_Nagur_Abfertigen();
	}
	else if (other.guild == GIL_MIL)
	|| 		(other.guild == GIL_PAL)
	{
		AI_Output (self ,other,"DIA_Nagur_Add_08_01"); //Qui al porto non ci sono lavori per soldati del Re! (ride)
		B_Nagur_Abfertigen();
	}
	else
	{
		AI_Output (self, other, "DIA_Nagur_Job_08_01");//(valutando) Bene, bene, perciò stai cercando un lavoro speciale. D'accordo, ma dovrai rispettare le mie regole, capito?
		AI_Output (other, self, "DIA_Nagur_Job_15_02");//Che significa?
		AI_Output (self, other, "DIA_Nagur_Job_08_03");//Significa che fai quello che ti dico e otterrai un terzo dei profitti.
		AI_Output (self, other, "DIA_Nagur_Job_08_04");//Se non ti va bene, niente lavoro.
	
		Info_ClearChoices (DIA_Nagur_Job);
		Info_AddChoice  (DIA_Nagur_Job,"Siamo soci in affari, quindi cinquanta e cinquanta.",DIA_Nagur_Job_Halbe);
		Info_AddChoice  (DIA_Nagur_Job,"Va bene, sei tu il capo.",DIA_Nagur_Job_Klar);
	};
};
FUNC VOID DIA_Nagur_Job_Klar()
{
	AI_Output (other, self, "DIA_Nagur_Job_Klar_15_00");//Va bene, sei tu il capo.
	AI_Output (self, other, "DIA_Nagur_Job_Klar_08_01");//Bene, allora fammi sapere quando sarai pronto a raggranellare un po' di soldi.
	Nagur_Deal = 80;
	Info_ClearChoices (DIA_Nagur_Job);
};
FUNC VOID DIA_Nagur_Job_Halbe()
{
	AI_Output (other, self, "DIA_Nagur_Job_Halbe_15_00");//Siamo soci in affari, quindi cinquanta e cinquanta.
	AI_Output (self, other, "DIA_Nagur_Job_Halbe_08_01");//Ok, penso che accetterò. Naturalmente ripartiremo i nostri profitti in maniera equa.
	Nagur_Deal = 120;
	Info_ClearChoices (DIA_Nagur_Job);
};
///////////////////////////////////////////////////////////////////////
//	Info Auftrag
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_Auftrag   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 4;
	condition   = DIA_Nagur_Auftrag_Condition;
	information = DIA_Nagur_Auftrag_Info;
	permanent   = FALSE;
	description = "Va bene, qual è il tuo piano.";
};

FUNC INT DIA_Nagur_Auftrag_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Nagur_Job))
	&& (MIS_Nagur_Bote != LOG_SUCCESS) //also hier NICHT B_Nagur_Abfertigen durchlaufen
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Auftrag_Info()
{
	AI_Output (other, self, "DIA_Nagur_Auftrag_15_00");//Va bene, qual è il tuo piano?
	AI_Output (self, other, "DIA_Nagur_Auftrag_08_01");//Conosci Baltram il mercante, vero? In caso contrario, è il caso di andare a parlargli.
	AI_Output (self, other, "DIA_Nagur_Auftrag_08_02");//Questo Baltram ha un corriere che lo rifornisce di beni dalla fattoria di Akil.
	AI_Output (self, other, "DIA_Nagur_Auftrag_08_03");//Cioè, AVEVA un corriere, finché non gli ho tagliato la gola. E ora Baltram ne ha bisogno di uno nuovo. E questo sarai tu.
	AI_Output (self, other, "DIA_Nagur_Auftrag_08_04");//Il tuo compito è quello di farti assumere da Baltram e recuperare la consegna di Akil.
	AI_Output (self, other, "DIA_Nagur_Auftrag_08_05");//Portamela e la venderò a un cliente interessato che mollerà una cifra considerevole in cambio.
	AI_Output (self, other, "DIA_Nagur_Auftrag_08_06");//E non provare a vendere la roba per conto tuo. Tutto chiaro?
	
	Info_ClearChoices (DIA_Nagur_Auftrag);
	Info_AddChoice    (DIA_Nagur_Auftrag,"Bene, io sono pronto (FINE).",DIA_Nagur_Auftrag_Okay);
	Info_AddChoice    (DIA_Nagur_Auftrag,"Dove si trova Baltram?",DIA_Nagur_Auftrag_Baltram);
	Info_AddChoice    (DIA_Nagur_Auftrag,"Quando potrei parlare con Baltram?",DIA_Nagur_Auftrag_Wann);
	Info_AddChoice    (DIA_Nagur_Auftrag,"Dov’è la fattoria di Akil?",DIA_Nagur_Auftrag_Akil);
	Info_AddChoice    (DIA_Nagur_Auftrag,"A quanto ammonta il profitto?",DIA_Nagur_Auftrag_Gewinn);

};
FUNC VOID DIA_Nagur_Auftrag_Akil()
{
	AI_Output (other, self, "DIA_Nagur_Auftrag_Akil_15_00");//Dov’è la fattoria di Akil?
	AI_Output (self, other, "DIA_Nagur_Auftrag_Akil_08_01");//Abbandona la città dal cancello a est, direttamente al mercato.
	AI_Output (self, other, "DIA_Nagur_Auftrag_Akil_08_02");//Se segui la strada a destra, arriverai presto a degli scalini nella roccia.
	AI_Output (self, other, "DIA_Nagur_Auftrag_Akil_08_03");//Salili e in cima troverai la fattoria di Akil.
};
FUNC VOID DIA_Nagur_Auftrag_Gewinn()
{
	AI_Output (other, self, "DIA_Nagur_Auftrag_Gewinn_15_00");//Quanti sono i profitti?
	AI_Output (self, other, "DIA_Nagur_Auftrag_Gewinn_08_01");//Non posso dirlo con esattezza, ma stimo attorno ai 400 pezzi d'oro.
};
FUNC VOID DIA_Nagur_Auftrag_Baltram()
{
	AI_Output (other, self, "DIA_Nagur_Auftrag_Baltram_15_00");//Dove si trova Baltram?
	AI_Output (self, other, "DIA_Nagur_Auftrag_Baltram_08_01");//Ha la sua bancarella al mercato.
};
FUNC VOID DIA_Nagur_Auftrag_Wann()
{
	AI_Output (other, self, "DIA_Nagur_Auftrag_Wann_15_00");//Quando potrei parlare con Baltram?
	AI_Output (self, other, "DIA_Nagur_Auftrag_Wann_08_01");//Puoi andarci subito. A questo punto dovrebbe sapere che il suo corriere non arriverà più (risata sordida).
};
FUNC VOID DIA_Nagur_Auftrag_Okay()
{
	AI_Output (other, self, "DIA_Nagur_Auftrag_Okay_15_00");//Bene allora, sono pronto.
	AI_Output (self, other, "DIA_Nagur_Auftrag_Okay_08_01");//Perfetto, allora vai, ma se proverai a prenderti gioco di me, presto sarai morto come l'altro corriere! Non dimenticartelo!
	MIS_Nagur_Bote = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Nagur,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Nagur,LOG_RUNNING);
	B_LogEntry (TOPIC_Nagur,"Devo convincere Baltram a farmi assumere come suo nuovo fattorino Poi potrò raccogliere la consegna da Akil e portarla a Nagur.");
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Success
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_Success   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 5;
	condition   = DIA_Nagur_Success_Condition;
	information = DIA_Nagur_Success_Info;
	permanent   = FALSE;
	description = "Ho portato la confezione.";
};

FUNC INT DIA_Nagur_Success_Condition()
{	
	if (MIS_Nagur_Bote == LOG_RUNNING)
	&& (Npc_HasItems (other,ItMi_BaltramPaket) >=1)
	&& (Nagur_Ausgeliefert == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Success_Info()
{
	AI_Output (other, self, "DIA_Nagur_Success_15_00");//Ho portato la confezione.
	AI_Output (self, other, "DIA_Nagur_Success_08_01");//Ben fatto. Vedrò a chi venderlo. Torna domani.
	
	B_LogEntry (TOPIC_Nagur,   "Nagur ha ricevuto la consegna, mi pagherà domani.");
	
	AI_StopProcessInfos (self);
	
	if B_GiveInvItems (other, self,ItMi_BaltramPaket ,1)
	{
		Npc_RemoveInvItems (self, ItMi_BaltramPaket,1);
	};
	NagurDay = B_GetDayPlus();  
};
///////////////////////////////////////////////////////////////////////
//	Info Deal
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_Deal   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 6;
	condition   = DIA_Nagur_Deal_Condition;
	information = DIA_Nagur_Deal_Info;
	permanent   = TRUE;
	description = "Allora, hai venduto la mercanzia?";
};
//---------------------------------
var int DIA_Nagur_Deal_permanent; 
//---------------------------------
FUNC INT DIA_Nagur_Deal_Condition()
{	
	if (DIA_Nagur_Deal_permanent == FALSE)
	&& (MIS_Nagur_Bote == LOG_RUNNING)
	&& (Nagur_Ausgeliefert == FALSE)
	&& Npc_KnowsInfo (other,DIA_Nagur_Success)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Deal_Info()
{
	AI_Output (other, self, "DIA_Nagur_Deal_15_00");//Allora, hai venduto la mercanzia?
	
	if (B_GetDayPlus() > NagurDay) 
	{
		AI_Output (self, other, "DIA_Nagur_Deal_08_01");//Certo, ma per meno di quanto previsto. Ho preso solamente 300 pezzi d'oro.
		AI_Output (self, other, "DIA_Nagur_Deal_08_02");//Parte di questi vanno ai miei datori di lavoro...
		AI_Output (self, other, "DIA_Nagur_Deal_08_03");//E Kardif è solito prendersi una percentuale più l'oro della commissione.
		AI_Output (self, other, "DIA_Nagur_Deal_08_04");//Il che lascia il totale a 240 pezzi d'oro. Ci divideremo il resto come da accordi. Ecco la tua parte.
		AI_Output (self, other, "DIA_Nagur_Deal_08_05");//Hai fatto un buon lavoro. L'ho passato ai miei datori di lavoro.
		AI_Output (self, other, "DIA_Nagur_Deal_08_06");//Ciò che verrà è fuori dal mio controllo.
		
		B_GiveInvItems (self,other,ItMi_Gold,Nagur_Deal);
		MIS_Nagur_Bote = LOG_SUCCESS;
		MIS_Baltram_ScoutAkil = LOG_FAILED;
		B_GivePlayerXP (XP_Nagur_Bote);
		DIA_Nagur_Deal_permanent = TRUE;
		Diebesgilde_Okay = (Diebesgilde_Okay + 1);
		AI_StopProcessInfos (self);
	}
	else 
	{
		AI_Output (self, other, "DIA_Nagur_Deal_08_07");//No, non ancora. Queste cose hanno bisogno del loro tempo. Voglio spuntare un buon prezzo.
	};
};
///////////////////////////////////////////////////////////////////////
//	Info erneutes ansprechen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_Auftraggeber   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 7;
	condition   = DIA_Nagur_Auftraggeber_Condition;
	information = DIA_Nagur_Auftraggeber_Info;
	permanent   = FALSE;
	description = "Chi sono i tuoi datori di lavoro?";
};

FUNC INT DIA_Nagur_Auftraggeber_Condition()
{	
	if (MIS_Nagur_Bote == LOG_SUCCESS)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Auftraggeber_Info()
{
	AI_Output (other, self, "DIA_Nagur_Auftraggeber_15_00");//Chi sono i tuoi datori di lavoro?
	AI_Output (self, other, "DIA_Nagur_Auftraggeber_08_01");//Credi veramente che te lo dirò?
};
///////////////////////////////////////////////////////////////////////
//	Info erneutes ansprechen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_Fazit   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 7;
	condition   = DIA_Nagur_Fazit_Condition;
	information = DIA_Nagur_Fazit_Info;
	permanent   = TRUE;
	important   = TRUE;
};

FUNC INT DIA_Nagur_Fazit_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Nagur_Auftraggeber)
	&& Npc_IsInState (self,ZS_Talk))
	&& (Knows_SecretSign == FALSE) 
	&& (NagurHack == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Fazit_Info()
{	
	AI_Output (self, other, "DIA_Nagur_Fazit_08_00");//Il lavoro è andato bene, ma non parlo dei miei datori di lavoro. Perciò stai calmo.
	AI_StopProcessInfos  (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Nagur im Knast
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_Knast   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 7;
	condition   = DIA_Nagur_Knast_Condition;
	information = DIA_Nagur_Knast_Info;
	permanent   = TRUE;
	important   = TRUE;
};

FUNC INT DIA_Nagur_Knast_Condition()
{	
	if Npc_IsInState (self,ZS_Talk)
	&& (Npc_GetDistToWP (self,"NW_CITY_HABOUR_KASERN_NAGUR") <= 1000)
	&& (Nagur_ausgeliefert == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Knast_Info()
{	
	AI_Output (self, other, "DIA_Nagur_Knast_08_00");//Mi hai tradito! È stato un grave errore e ora fuori dai piedi!
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Diebeszeichen
/////////////////////////////////////////
INSTANCE DIA_Nagur_Sign   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 7;
	condition   = DIA_Nagur_Sign_Condition;
	information = DIA_Nagur_Sign_Info;
	permanent   = FALSE;
	description	= "(Mostra il segnale dei ladri)";
};

FUNC INT DIA_Nagur_Sign_Condition()
{	
	if (MIS_Nagur_Bote == LOG_SUCCESS)
	&& (Knows_SecretSign == TRUE) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Sign_Info()
{	
	AI_PlayAni (other,"T_YES");
	AI_Output (self, other, "DIA_Nagur_Sign_08_00");//Quindi l'hai fatto. Ora sai chi sono i miei datori di lavoro.
	AI_Output (self, other, "DIA_Nagur_Sign_08_01");//Credi a quello che ti dice Cassia, non ci importa chi sei dopotutto. Sei uno di noi, in fondo!
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_Perm   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 7;
	condition   = DIA_Nagur_Perm_Condition;
	information = DIA_Nagur_Perm_Info;
	permanent   = TRUE;
	important   = TRUE;
};

FUNC INT DIA_Nagur_Perm_Condition()
{	
	if (MIS_Nagur_Bote == LOG_SUCCESS)
	&&  Npc_KnowsInfo (other,DIA_Nagur_Sign) 
	&& Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Perm_Info()
{	
	AI_Output (self, other, "DIA_Nagur_Perm_08_00");//Cerca qualcun altro, c'è abbastanza gente nei dintorni. Non ho altro per te.
	AI_StopProcessInfos (self);
};
























