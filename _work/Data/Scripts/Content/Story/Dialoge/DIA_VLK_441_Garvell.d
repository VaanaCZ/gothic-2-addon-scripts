///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Garvell_EXIT   (C_INFO)
{
	npc         = VLK_441_Garvell;
	nr          = 999;
	condition   = DIA_Garvell_EXIT_Condition;
	information = DIA_Garvell_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Garvell_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Garvell_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Garvell_PICKPOCKET (C_INFO)
{
	npc			= VLK_441_Garvell;
	nr			= 900;
	condition	= DIA_Garvell_PICKPOCKET_Condition;
	information	= DIA_Garvell_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Sarebbe un gioco da ragazzi rubargli il borsello.)";
};                       

FUNC INT DIA_Garvell_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems (self, ItSe_GoldPocket25) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (10 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Garvell_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Garvell_PICKPOCKET);
	Info_AddChoice		(DIA_Garvell_PICKPOCKET, DIALOG_BACK 		,DIA_Garvell_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Garvell_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Garvell_PICKPOCKET_DoIt);
};

func void DIA_Garvell_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 10)
	{
		
		B_GiveInvItems (self, other, ItSe_GoldPocket25, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Garvell_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Garvell_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Garvell_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_GREET		(C_INFO)
{
	npc			 = 	VLK_441_Garvell;
	nr			 = 	2;
	condition	 = 	DIA_Garvell_GREET_Condition;
	information	 = 	DIA_Garvell_GREET_Info;
	description	 = 	"Cosa stai facendo, qui?";
};
func int DIA_Garvell_GREET_Condition ()
{	
	if (Wld_IsTime (05,00,19,00))
	{	
			return TRUE;
	};
};
func void DIA_Garvell_GREET_Info ()
{
	AI_Output (other, self, "DIA_Garvell_GREET_15_00"); //Cosa stai facendo qui?
	AI_Output (self, other, "DIA_Garvell_GREET_04_01"); //Sto costruendo una nave perché voglio andar via da qui il prima possibile.
	AI_Output (self, other, "DIA_Garvell_GREET_04_02"); //Per come è messa ora, questa nave non sarà mai pronta.
};
///////////////////////////////////////////////////////////////////////
//	Info eilig
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_eilig		(C_INFO)
{
	npc			 = 	VLK_441_Garvell;
	nr			 = 	2;
	condition	 = 	DIA_Garvell_eilig_Condition;
	information	 = 	DIA_Garvell_eilig_Info;
	description	 = 	"Perché hai così tanta fretta?";
};
func int DIA_Garvell_eilig_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Garvell_GREET)
	{	
			return TRUE;
	};
};
func void DIA_Garvell_eilig_Info ()
{
	AI_Output (other, self, "DIA_Garvell_eilig_15_00"); //Perché hai così tanta fretta?
	AI_Output (self, other, "DIA_Garvell_eilig_04_01"); //Presto gli orchi arriveranno e daranno fuoco alla città.
	AI_Output (other, self, "DIA_Garvell_eilig_15_02"); //Cosa te lo fa pensare?
	AI_Output (self, other, "DIA_Garvell_eilig_04_03"); //Ragazzo, hai notato paladini correre ovunque? Perché pensi che siano qui?
	AI_Output (self, other, "DIA_Garvell_eilig_04_04"); //Te lo dico io perché, sono qui perché gli orchi attaccheranno presto. E non sarà una bella cosa.
};

///////////////////////////////////////////////////////////////////////
//	Info Schiff
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_Schiff		(C_INFO)
{
	npc			 = 	VLK_441_Garvell;
	nr			 = 	99;
	condition	 = 	DIA_Garvell_Schiff_Condition;
	information	 = 	DIA_Garvell_Schiff_Info;
	description	 = 	"Perché non puoi finire la tua nave?";
};
func int DIA_Garvell_Schiff_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Garvell_GREET)
	{	
			return TRUE;
	};
};
func void DIA_Garvell_Schiff_Info ()
{
	AI_Output (other, self, "DIA_Garvell_Schiff_15_00"); //Perché non puoi finire la tua nave?
	AI_Output (self, other, "DIA_Garvell_Schiff_04_01"); //(distrattamente) Oh, abbiamo migliaia di problemi. Lo scafo non è stabile e mancano ancora un mucchio di assi.
	AI_Output (self, other, "DIA_Garvell_Schiff_04_02"); //Ma mi sono rimasti pochissimi soldi per comprare nuovo materiale e l'ultima consegna era piena di difetti.
	AI_Output (self, other, "DIA_Garvell_Schiff_04_03"); //I miei ragazzi non lavorano in modo produttivo, uno vuole una barca veloce soprattutto, l'altro è preoccupato dell'estetica.
	AI_Output (self, other, "DIA_Garvell_Schiff_04_04"); //Come se non avessimo cose più importanti cui pensare!
	AI_Output (self, other, "DIA_Addon_Garvell_Schiff_04_00"); //Per giunta, uno dei miei operai non viene più al lavoro. Comincio a temere che questo ritarderà ancora di più la costruzione.
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Garvell_MissingPeople		(C_INFO)
{
	npc		 = 	VLK_441_Garvell;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Garvell_MissingPeople_Condition;
	information	 = 	DIA_Addon_Garvell_MissingPeople_Info;

	description	 = 	"Ti manca un operaio?";
};

func int DIA_Addon_Garvell_MissingPeople_Condition ()
{
	if Npc_KnowsInfo (other,DIA_Garvell_Schiff)
	&& (SC_HearedAboutMissingPeople == TRUE)
	&& (MissingPeopleReturnedHome == FALSE)
	{	
			return TRUE;
	};
};

func void DIA_Addon_Garvell_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Garvell_MissingPeople_15_00"); //Ti manca un operaio?
	AI_Output	(self, other, "DIA_Addon_Garvell_MissingPeople_04_01"); //Sì. Si chiama Monty. È svanito nel nulla.
	AI_Output	(self, other, "DIA_Addon_Garvell_MissingPeople_04_02"); //Quello sfaticato starà facendo la bella vita in qualche fattoria dei dintorni. Non avrei dovuto pagarlo in anticipo.
	
	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"Garvell si lamenta del suo operaio Monty, che un giorno non si è fatto vedere al lavoro. Garvell pensa che Monty se la stia spassando con i contadini."); 

	Info_ClearChoices	(DIA_Addon_Garvell_MissingPeople);
	Info_AddChoice	(DIA_Addon_Garvell_MissingPeople, "Ho sentito che sono scomparse anche altre persone.", DIA_Addon_Garvell_MissingPeople_more );
	if (SCKnowsFarimAsWilliamsFriend == FALSE)
	{
	Info_AddChoice	(DIA_Addon_Garvell_MissingPeople, "Quand'è stata l'ultima volta che hai visto Monty?", DIA_Addon_Garvell_MissingPeople_wo );
	};
};
func void DIA_Addon_Garvell_MissingPeople_more ()
{
	AI_Output			(other, self, "DIA_Addon_Garvell_MissingPeople_more_15_00"); //Ho sentito che sono scomparse anche altre persone.
	AI_Output			(self, other, "DIA_Addon_Garvell_MissingPeople_more_04_01"); //Già. È da lì che sono nati tutti i nostri guai.
	AI_Output			(self, other, "DIA_Addon_Garvell_MissingPeople_more_04_02"); //Farim il pescatore mi ha raccontato qualcosa di simile. Anche il suo amico William è scomparso.
	AI_Output			(self, other, "DIA_Addon_Garvell_MissingPeople_more_04_03"); //Scommetto che è colpa degli orchi.
	SCKnowsFarimAsWilliamsFriend = TRUE;

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Farim, il pescatore, sembra sapere un paio di cose sulla scomparsa del suo amico William."); 
	
	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_MissingPeople, LogText_Addon_WilliamMissing); 

	Info_AddChoice	(DIA_Addon_Garvell_MissingPeople, DIALOG_BACK, DIA_Addon_Garvell_MissingPeople_BACK );

	if (Farim.aivar[AIV_TalkedToPlayer] == FALSE)
	{
	Info_AddChoice	(DIA_Addon_Garvell_MissingPeople, "Dove posso trovare questo Farim?", DIA_Addon_Garvell_MissingPeople_Farim );
	};
};
func void DIA_Addon_Garvell_MissingPeople_BACK ()
{
	Info_ClearChoices	(DIA_Addon_Garvell_MissingPeople);
};
func void DIA_Addon_Garvell_MissingPeople_Farim ()
{
	AI_Output			(other, self, "DIA_Addon_Garvell_MissingPeople_Farim_15_00"); //Dove posso trovare questo Farim?
	AI_Output			(self, other, "DIA_Addon_Garvell_MissingPeople_Farim_04_01"); //È un pescatore. Credo che la sua capanna sia nei pressi dello spaccio dei paladini, ma non ne sono certo.

	B_LogEntry (TOPIC_Addon_WhoStolePeople,"La capanna di Farim si trova vicino allo spaccio dei paladini."); 
};
func void DIA_Addon_Garvell_MissingPeople_wo ()
{
	AI_Output			(other, self, "DIA_Addon_Garvell_MissingPeople_wo_15_00"); //Quand'è stata l'ultima volta che hai visto Monty?
	AI_Output			(self, other, "DIA_Addon_Garvell_MissingPeople_wo_04_01"); //(arrabbiato) Sono almeno due giorni che non si degna di venire al lavoro.
};
///////////////////////////////////////////////////////////////////////
//	Info ReturnMonty
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_ReturnMonty		(C_INFO)
{
	npc			 = 	VLK_441_Garvell;
	nr			 = 	99;
	condition	 = 	DIA_Garvell_ReturnMonty_Condition;
	information	 = 	DIA_Garvell_ReturnMonty_Info;
	description	 = 	"E come vanno le cose ORA?";
};
func int DIA_Garvell_ReturnMonty_Condition ()
{	
	if (Npc_GetDistToWP (Monty_NW, "NW_CITY_HABOUR_WERFT_IN_01") <= 1000)
	&& (MissingPeopleReturnedHome == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Garvell_ReturnMonty_Info ()
{
	AI_Output (other, self, "DIA_Addon_Garvell_ReturnMonty_15_00"); //E come vanno le cose ORA?
	AI_Output (self, other, "DIA_Addon_Garvell_ReturnMonty_04_01"); //Monty è tornato! Sta studiando il progetto.
	AI_Output (self, other, "DIA_Addon_Garvell_ReturnMonty_04_02"); //Forse ora riusciremo a ultimare la nave...
	B_GivePlayerXP (XP_Ambient);
};
///////////////////////////////////////////////////////////////////////
//	Info MISSION
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_MISSION		(C_INFO)
{
	npc			 = 	VLK_441_Garvell;
	nr			 = 	2;
	condition	 = 	DIA_Garvell_MISSION_Condition;
	information	 = 	DIA_Garvell_MISSION_Info;
	permanent    =  FALSE;
	description	 = 	"Posso aiutarti in qualche modo?";
};

func int DIA_Garvell_MISSION_Condition ()
{	
	if Npc_KnowsInfo (other, DIA_Garvell_eilig)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Garvell_MISSION_Info ()
{
	AI_Output (other, self, "DIA_Garvell_MISSION_15_00"); //Posso fare qualcosa per te?
	AI_Output (self, other, "DIA_Garvell_MISSION_04_01"); //Sì che puoi, scopri che cosa hanno in mente i paladini. Voglio sapere perché sono qui.
	AI_Output (self, other, "DIA_Garvell_MISSION_04_02"); //E voglio sapere se gli orchi attaccheranno e quanto sono lontani dalla città.
	AI_Output (self, other, "DIA_Garvell_MISSION_04_03"); //Uno di questi bastardi è stato addirittura visto fuori dalla città.
	AI_Output (self, other, "DIA_Garvell_MISSION_04_04"); //Portami quante più informazioni puoi.
	AI_Output (self ,other, "DIA_Garvell_Add_04_00"); //Devo sapere quanto tempo mi rimane per terminare la barca.

	MIS_Garvell_Infos = LOG_RUNNING;
	Knows_Ork = TRUE;
	
	Log_CreateTopic (TOPIC_Garvell,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Garvell,LOG_RUNNING);
	B_LogEntry (TOPIC_Garvell,"Garvell vuole informazioni sugli orchi e sapere perché i paladini sono stanziati in città.");
};
FUNC VOID B_GarvellWeiter()
{
	AI_Output (self, other, "DIA_Garvell_Weiter_04_00"); //Bene. Se scopri qualcosa d'altro, fammelo sapere.
};
FUNC VOID B_GarvellSuccess()
{
	AI_Output (self, other, "DIA_Garvell_Success_04_00"); //Grazie per l'informazione, se è così allora abbiamo tutto il tempo del mondo per finire la nave.
	MIS_Garvell_Infos = LOG_SUCCESS;
	B_GivePlayerXP (XP_Ambient);
};
///////////////////////////////////////////////////////////////////////
//	Info Orks
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_Orks		(C_INFO)
{
	npc			 = 	VLK_441_Garvell;
	nr			 = 	3;
	condition	 = 	DIA_Garvell_Orks_Condition;
	information	 = 	DIA_Garvell_Orks_Info;
	permanent    =  FALSE;
	description	 = 	"Ho delle informazioni sugli orchi.";
};
func int DIA_Garvell_Orks_Condition ()
{	
	if (MIS_Garvell_Infos == LOG_RUNNING)
	&& (Knows_Paladins >= 1)
	{
		return TRUE;
	};
};
func void DIA_Garvell_Orks_Info ()
{
	AI_Output (other, self, "DIA_Garvell_Orks_15_00"); //Ho delle informazioni sugli orchi.
	AI_Output (self, other, "DIA_Garvell_Orks_04_01"); //Sentiamo.
	AI_Output (other, self, "DIA_Garvell_Orks_15_02"); //Sembra che siano bloccati nella Valle delle Miniere e che si fermeranno là.
	AI_Output (other, self, "DIA_Garvell_Orks_15_03"); //Per essere sicuri, i paladini stanno presidiando il passo.

	Tell_Garvell = (Tell_Garvell +1);
	B_GivePlayerXP (XP_Ambient);
	
	if (Tell_Garvell >= 3)
	{
		B_GarvellSuccess();
	}
	else
	{
		B_GarvellWeiter();
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Orks
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_Paladine		(C_INFO)
{
	npc			 = 	VLK_441_Garvell;
	nr			 = 	2;
	condition	 = 	DIA_Garvell_Paladine_Condition;
	information	 = 	DIA_Garvell_Paladine_Info;
	permanent    =  FALSE;
	description	 = 	"So perché i paladini sono qui.";
};
func int DIA_Garvell_Paladine_Condition ()
{	
	if (MIS_Garvell_Infos == LOG_RUNNING)
	&& (KnowsPaladins_Ore == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Garvell_Paladine_Info ()
{
	AI_Output (other, self, "DIA_Garvell_Paladine_15_00"); //So perché i paladini sono qui.
	AI_Output (self, other, "DIA_Garvell_Paladine_04_01"); //Davvero? Dimmelo!
	AI_Output (other, self, "DIA_Garvell_Paladine_15_02"); //I paladini sono qui per estrarre il metallo magico dalla Valle delle Miniere, non perché si aspettano che gli orchi possano attaccare la città.
	AI_Output (other, self, "DIA_Garvell_Paladine_15_03"); //Appena avranno il metallo, torneranno sulla terraferma.

	Tell_Garvell = (Tell_Garvell +1);
	B_GivePlayerXP (XP_Ambient);
	
	if (Tell_Garvell >= 3)
	{
		B_GarvellSuccess();
	}
	else
	{
		B_GarvellWeiter();
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Ork vor der Stadt
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_City		(C_INFO)
{
	npc			 = 	VLK_441_Garvell;
	nr			 = 	4;
	condition	 = 	DIA_Garvell_City_Condition;
	information	 = 	DIA_Garvell_City_Info;
	permanent    =  FALSE;
	description	 = 	"Riguardo a quell’orco fuori città...";
};
func int DIA_Garvell_City_Condition ()
{	
	if (MIS_Garvell_Infos == LOG_RUNNING)
	&& (Knows_Paladins >= 2)
	{
		return TRUE;
	};
};
func void DIA_Garvell_City_Info ()
{
	AI_Output (other, self, "DIA_Garvell_City_15_00"); //Riguardo a quell’orco fuori città...
	AI_Output (self, other, "DIA_Garvell_City_04_01"); //Sìììì?
	AI_Output (other, self, "DIA_Garvell_City_15_02"); //Non preoccuparti, se ne occuperà la guardia cittadina.
	

	Tell_Garvell = (Tell_Garvell +1);
	B_GivePlayerXP (XP_Ambient);
	
	if (Tell_Garvell >= 3)
	{
		B_GarvellSuccess();
	}
	else
	{
		B_GarvellWeiter();
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_Perm		(C_INFO)
{
	npc			 = 	VLK_441_Garvell;
	nr			 = 	13;
	condition	 = 	DIA_Garvell_Perm_Condition;
	information	 = 	DIA_Garvell_Perm_Info;
	permanent    =  TRUE;
	description	 = 	"Cosa sta succedendo al porto?";
};
func int DIA_Garvell_Perm_Condition ()
{	
	if Npc_KnowsInfo (other, DIA_Garvell_MISSION)
	{
		return TRUE;
	};
};
func void DIA_Garvell_Perm_Info ()
{
	AI_Output (other, self, "DIA_Garvell_Perm_15_00"); //Cosa sta succedendo al porto?
	
	if (MIS_Garvell_Infos != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Garvell_Perm_04_01"); //Gli orchi ci stanno col fiato addosso e tu mi chiedi del porto?
		AI_Output (other, self, "DIA_Garvell_Perm_15_02"); //Volevo solo...
		AI_Output (self, other, "DIA_Garvell_Perm_04_03"); //Il problema più grande è che c'è solo una nave qui e non è abbastanza per andarcene di qui.
		AI_Output (self, other, "DIA_Garvell_Perm_04_04"); //A essere onesti, c'è solo una nave qui e appartiene ai paladini. Di sicuro non ci faranno andare via con quella.
	}
	else
	{
		AI_Output (self, other, "DIA_Garvell_Perm_04_05"); //Guardati attorno, non succede nulla.
	};
};























