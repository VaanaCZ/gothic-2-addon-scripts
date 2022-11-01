///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Pedro_DI_EXIT   (C_INFO)
{
	npc         = NOV_600_Pedro_DI;
	nr          = 999;
	condition   = DIA_Pedro_DI_EXIT_Condition;
	information = DIA_Pedro_DI_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Pedro_DI_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Pedro_DI_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Verräter
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_DI_YOU		(C_INFO)
{
	npc			 = 	NOV_600_Pedro_DI;
	nr			 = 	2;
	condition	 = 	DIA_Pedro_DI_YOU_Condition;
	information	 = 	DIA_Pedro_DI_YOU_Info;
	
	description	 = 	"Traditore!";
	
};
func int DIA_Pedro_DI_YOU_Condition ()
{	
	return TRUE;
};

func void DIA_Pedro_DI_YOU_Info ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_00"); //Traditore! Ti ho trovato finalmente.

		if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_01"); //Non credere che avrò pietà di te solo perché sono un paladino.
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_02"); //Molti di noi mercenari hanno venduto la loro anima a Beliar, e spesso mi capita di sentirmi ancora male a doverli uccidere in questo modo, ma per te, sporco maiale, farò un'eccezione!
		};

		if (hero.guild == GIL_KDF)
		{
			AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_03"); //Di tutti i bastardi senza cuore che ho incontrato nella mia vita, tu sei certamente il peggiore. Sei una vergogna per il nostro ordine.
		};

	AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_04"); //Dovrei ucciderti immediatamente.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_09_05"); //Fermo. Ti prego. Mi hanno fatto un incantesimo. Non avrei mai tradito il monastero di mia spontanea volontà.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_09_06"); //Non hai idea di quanto ho sofferto negli ultimi giorni. Mi hanno messo questa voce in testa. Non potevo difendermi da solo.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_09_07"); //Il colonnello orchesco mi ha interrogato per giorni picchiandomi continuamente. Risparmiami. Non sono colpevole. Devi credermi.
	
	Info_ClearChoices	(DIA_Pedro_DI_YOU);
	Info_AddChoice	(DIA_Pedro_DI_YOU, "Dimmi che cosa vuoi, allora.", DIA_Pedro_DI_YOU_verschon );
	Info_AddChoice	(DIA_Pedro_DI_YOU, "Non devo fare altro, se non ucciderti all’istante.", DIA_Pedro_DI_YOU_tot );
	Info_AddChoice	(DIA_Pedro_DI_YOU, "Dammi un buon motivo per crederti.", DIA_Pedro_DI_YOU_grund );
	if (MIS_Gorax_KillPedro == LOG_RUNNING)
	{
		Info_AddChoice	(DIA_Pedro_DI_YOU, "Serpentes mi ha ordinato di ucciderti.", DIA_Pedro_DI_YOU_Serpentes );
	};
};

func void DIA_Pedro_DI_YOU_grund ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_grund_15_00"); //Dammi un solo motivo per cui dovrei crederti.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_grund_09_01"); //(implora) Lasciami vivere. Posso fornirti delle informazioni che ti permetteranno di fuggire di qui di nuovo. Devi ascoltarmi.

};
var int PedroDI_Flee;
func void DIA_Pedro_DI_YOU_tot ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_tot_15_00"); //Non devo fare altro, se non ucciderti all'istante.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_tot_09_01"); //Per tutti gli dei...

	AI_StopProcessInfos (self);

	Npc_ExchangeRoutine	(self,"Ship");
	B_Attack (self, other, AR_NONE, 1);
	PedroDI_Flee = LOG_RUNNING;
};

func void DIA_Pedro_DI_YOU_Serpentes ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_Serpentes_15_00"); //Serpentes mi ha ordinato di ucciderti, e farò ciò che mi è stato detto, per una questione di principio.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_Serpentes_09_01"); //(implora) Ti prego, no. Non puoi farlo. Posso ancora esserti di grande aiuto. Devi credermi.

	B_GivePlayerXP (XP_Pedro_SerpentesMission);
	MIS_Gorax_KillPedro = LOG_SUCCESS;	//Joly: bei erfolgreicher Mission in folgenden Dialogen muss heißen; if ((Npc_IsDead(PedroDI)) && (MIS_Gorax_KillPedro == LOG_SUCCESS))

};

func void DIA_Pedro_DI_YOU_verschon ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_verschon_15_00"); //Dimmi che cosa vuoi, allora.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_verschon_09_01"); //(sollevato) Sì, subito. Ti dirò tutto ciò che vuoi sapere, ma a una condizione. Devi portarmi via da questa maledetta isola, mi hai capito?
	
	Info_ClearChoices	(DIA_Pedro_DI_YOU);
	Info_AddChoice	(DIA_Pedro_DI_YOU, "Non devo fare altro, se non ucciderti all’istante.", DIA_Pedro_DI_YOU_tot );
	Info_AddChoice	(DIA_Pedro_DI_YOU, "Va bene. Seguimi, ti condurrò sulla mia barca.", DIA_Pedro_DI_YOU_FollowShip );

};

var int MIS_Pedro_DI_FollowShip;
func void DIA_Pedro_DI_YOU_FollowShip ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_FollowShip_15_00"); //D'accordo, seguimi e ti porterò sulla nave.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_FollowShip_09_01"); //Grazie, non te ne pentirai.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"FollowShip");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	MIS_Pedro_DI_FollowShip = LOG_RUNNING;

};

///////////////////////////////////////////////////////////////////////
//	Info ArrivedAtShip
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_DI_ArrivedAtShip		(C_INFO)
{
	npc		 = 	NOV_600_Pedro_DI;
	nr		 = 	4;
	condition	 = 	DIA_Pedro_DI_ArrivedAtShip_Condition;
	information	 = 	DIA_Pedro_DI_ArrivedAtShip_Info;

	description	= "Siamo arrivati!";	
};

func int DIA_Pedro_DI_ArrivedAtShip_Condition ()
{
	if (Npc_GetDistToWP(self,"SHIP")<6000) 
	&& (MIS_Pedro_DI_FollowShip == LOG_RUNNING)
		{
				return TRUE;
		};
};

func void DIA_Pedro_DI_ArrivedAtShip_Info ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_15_00"); //Siamo arrivati!
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_09_01"); //Hai davvero una bella nave. Sei davvero un grande generale.
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_15_02"); //Smettila di adularmi e dimmi subito quello che voglio sapere.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_09_03"); //Eh, certo. Da dove devo cominciare?
	
	Info_ClearChoices	(DIA_Pedro_DI_ArrivedAtShip);
	Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "Ho sentito abbastanza.", DIA_Pedro_DI_ArrivedAtShip_Back );
	Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "Come posso inoltrarmi nell’entroterra dell’isola?", DIA_Pedro_DI_ArrivedAtShip_Innere );
	Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "Quali altri tipi di mostri stanno attaccando l’isola?", DIA_Pedro_DI_ArrivedAtShip_Monster );
	Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "Cosa si sa del colonnello orchesco?", DIA_Pedro_DI_ArrivedAtShip_OrkOberst );


};
func void DIA_Pedro_DI_ArrivedAtShip_OrkOberst ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_OrkOberst_15_00"); //Per esempio, dal colonnello orchesco.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_01"); //Mi ha portato via l'ultima speranza di rivedere la mia patria.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_02"); //È da quando sono arrivato qui che ha iniziato a interrogarmi sulla disposizione strategica dei paladini a Khorinis.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_03"); //Ovviamente, non sono stato in grado di dirgli molto in proposito. Come potrei, dannazione? Io sono un novizio del fuoco, non un paladino.
	
	if ((Npc_IsDead(OrkElite_AntiPaladinOrkOberst_DI)))
	{
		Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "Il colonnello orchesco è morto.", DIA_Pedro_DI_ArrivedAtShip_OberstTot );
	};
};

func void DIA_Pedro_DI_ArrivedAtShip_Monster ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_Monster_15_00"); //Quali altri tipi di mostri stanno attaccando l’isola?
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Monster_09_01"); //Durante il giorno, spesso si vedono gli uomini lucertola camminare verso la costa. Di solito essi portano con sé delle grosse uova.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Monster_09_02"); //Non ne ho incontrati molti nella mia cella, ma credo si stiano preparando a lasciare l'isola.
};

func void DIA_Pedro_DI_ArrivedAtShip_Innere ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_Innere_15_00"); //Come posso inoltrarmi nell’entroterra dell’isola?
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_01"); //C'è un passaggio segreto nella sala del trono del colonnello orchesco.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_02"); //Mi trascinavano lì ogni volta che voleva interrogarmi. L'ho visto con i miei occhi.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_03"); //Uno degli sciamani ha messo in moto il meccanismo tirando le torce appese alle pareti della sala.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_04"); //Mmmh. Credo che prima abbia tirato la torcia sulla sinistra e poi quella sulla destra, ma non riesco a ricordarmelo con precisione.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_05"); //All'improvviso, in fondo alla sala, si è aperto un passaggio segreto che conduceva sotto la montagna.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_06"); //Non so dove conducesse questo passaggio.

};

func void DIA_Pedro_DI_ArrivedAtShip_OberstTot ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_OberstTot_15_00"); //Il colonnello orchesco è morto.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_OberstTot_09_01"); //Morto? Sia lodato Innos. Non mi scorderò mai la sua orrenda faccia.

};

func void DIA_Pedro_DI_ArrivedAtShip_Back ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_Back_15_00"); //Ho sentito abbastanza. Vai a prendere posto sulla mia nave. Ho ancora un lavoro da sbrigare.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Back_09_01"); //Che il potere di Innos sia con te. Pregherò per te.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Ship");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
};


///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_DI_PERM		(C_INFO)
{
	npc		 = 	NOV_600_Pedro_DI;
	nr		 = 	5;
	condition	 = 	DIA_Pedro_DI_PERM_Condition;
	information	 = 	DIA_Pedro_DI_PERM_Info;
	permanent	 = 	TRUE;

	description	 = 	"Stanco?";
};
var int PedroDI_TalkNomore;
func int DIA_Pedro_DI_PERM_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Pedro_DI_YOU))
	&& (PedroDI_TalkNomore == FALSE)
		{
				return TRUE;
		};
};
func void DIA_Pedro_DI_PERM_Info ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_PERM_15_00"); //Stanco?

	if (Npc_GetDistToWP(self,"SHIP_DECK_05")<1000) 
	{	
		if (PedroDI_Flee == LOG_RUNNING)
		{
			AI_Output			(other, self, "DIA_Pedro_DI_PERM_15_01"); //Vuoi che ti porti un cuscino?
			AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_02"); //Risparmiami ti prego. Me ne starò qui seduto in silenzio.
			AI_Output			(other, self, "DIA_Pedro_DI_PERM_15_03"); //Mmmh.
			B_GivePlayerXP (XP_Ambient);
			PedroDI_Flee = LOG_SUCCESS;
		}
		else if (Npc_IsDead(Dragon_Undead))
		{
			AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_04"); //Sono completamente rovinato.
			AI_Output			(other, self, "DIA_Pedro_DI_PERM_15_05"); //Vai a letto. Salperemo presto di nuovo.
			AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_06"); //Grazie amico. Avevo già pensato di andare a farmi un sonnellino. Buona notte.
			AI_StopProcessInfos (self);
			Npc_ExchangeRoutine	(self,"SleepShip");
			self.aivar[AIV_PARTYMEMBER] = FALSE;
			PedroDI_TalkNomore = TRUE;
		}
		else
		{
			AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_07"); //Va tutto bene. Grazie.
			AI_StopProcessInfos (self);
		};
	}
	else
	{
		AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_08"); //Ti prego, non mi uccidere!
		AI_StopProcessInfos (self);
	};
};

