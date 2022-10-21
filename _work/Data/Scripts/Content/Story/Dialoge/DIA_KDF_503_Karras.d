///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Karras_KAP1_EXIT   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 999;
	condition   = DIA_Karras_KAP1_EXIT_Condition;
	information = DIA_Karras_KAP1_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Karras_KAP1_EXIT_Condition()
{
	if (Kapitel <= 1)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Karras_KAP1_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hello
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_Hello 		(C_INFO)
{
	npc			= KDF_503_Karras;
	nr          = 1;
	condition	= DIA_Karras_Hello_Condition;
	information	= DIA_Karras_Hello_Info;
	permanent   = FALSE;
	important	= TRUE;
};
func int DIA_Karras_Hello_Condition ()
{
	if Npc_IsInState (self, ZS_Talk)
	&& (MIS_NOVIZENCHASE != LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Karras_Hello_Info ()
{
	if (hero.guild == GIL_NOV)
	{
		AI_Output			(self, other, "DIA_Karras_Hello_10_00"); //Cosa posso fare per te, novizio?
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Karras_Hello_10_01"); //Cosa posso fare per te, fratello?
	}
	else if (hero.guild == GIL_PAL)
	{
		AI_Output			(self, other, "DIA_Karras_Hello_10_02"); //Gli onorevoli guerrieri di Innos raramente vengono in queste stanze.
		AI_Output			(self, other, "DIA_Karras_Hello_10_03"); //Cosa posso fare per te?
	}
	else
	{
		AI_Output			(self, other, "DIA_Karras_Hello_10_04"); //(sospettoso) Cosa ci fai qui?
	};
	
};
///////////////////////////////////////////////////////////////////////
//	Info Mission
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_Mission		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 = 	2;
	condition	 = 	DIA_Karras_Mission_Condition;
	information	 = 	DIA_Karras_Mission_Info;
	permanent    =  FALSE;
	description	 = 	"Sono qui per leggere i testi sacri.";
};
func int DIA_Karras_Mission_Condition ()
{	
	if (other.guild == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Karras_Mission_Info ()
{
	AI_Output (other, self, "DIA_Karras_Mission_15_00"); //Sono qui per leggere i testi sacri.
	AI_Output (self, other, "DIA_Karras_Mission_10_01"); //Capisco. Se dovesse avanzarti del tempo nei tuoi studi, vieni a trovarmi.
	AI_Output (self, other, "DIA_Karras_Mission_10_02"); //C'è un altro problema per il quale potrebbe tornarmi utile un novizio con le tue capacità.
};
///////////////////////////////////////////////////////////////////////
//	Info Aufgabe
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_Aufgabe		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 = 	2;
	condition	 = 	DIA_Karras_Aufgabe_Condition;
	information	 = 	DIA_Karras_Aufgabe_Info;
	permanent    =  FALSE;
	description	 = 	"Hai un compito da assegnarmi?";
};
func int DIA_Karras_Aufgabe_Condition ()
{	
	if Npc_KnowsInfo (other, DIA_Karras_Mission)
	{
		return TRUE;
	};
};
func void DIA_Karras_Aufgabe_Info ()
{
	AI_Output (other, self, "DIA_Karras_Aufgabe_15_00"); //Hai un compito da assegnarmi?
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_01"); //Sì. Si tratta di quel pazzo di Ignaz. Vive a Khorinis ed effettua esperimenti con vari intrugli e pozioni guaritrici, ma si diletta anche con gli incantesimi magici.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_02"); //Ed è esattamente questo che mi preoccupa. Mi chiedo se la sua magia sia ben vista da Innos.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_03"); //Per saperlo, mi servono alcune delle sue pergamene magiche.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_04"); //Voglio che tu vada in città e mi porti tre delle sue pergamene magiche.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_05"); //Ma non dirlo a nessuno, intesi?
	AI_Output (other, self, "DIA_Karras_Aufgabe_15_06"); //Certo.
	AI_Output (self, other, "DIA_Karras_Aufgabe_10_07"); //Eccoti 150 monete d'oro. Dovrebbero bastare a coprire le tue spese.
	
	MIS_KarrasVergessen = LOG_RUNNING;
	
	Log_CreateTopic (Topic_KarrasCharm,LOG_MISSION);
	Log_SetTopicStatus  (Topic_KarrasCharm,LOG_RUNNING);
	B_LogEntry (Topic_KarrasCharm,"Maestro Karras mi ha mandato in città. Vuole che gli compri tre delle pergamente che Ignaz produce e vende.");

	B_GiveInvItems (self, other, ItMi_Gold,150);
};
///////////////////////////////////////////////////////////////////////
//	Info Success
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_Success		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 = 	2;
	condition	 = 	DIA_Karras_Success_Condition;
	information	 = 	DIA_Karras_Success_Info;
	permanent    =  FALSE;
	description	 = 	"Ecco le pergamene per gli incantesimi che volevi.";
};
func int DIA_Karras_Success_Condition ()
{	
	if (MIS_KarrasVergessen == LOG_RUNNING)
	&& (Npc_HasItems (other, ItSc_Charm) >= 3)
	{
		return TRUE;
	};
};
func void DIA_Karras_Success_Info ()
{
	AI_Output (other, self, "DIA_Karras_Success_15_00"); //Ecco le pergamene magiche che volevi.
	AI_Output (self, other, "DIA_Karras_Success_10_01"); //Ben fatto, mio giovane amico.
	AI_Output (self, other, "DIA_Karras_Success_10_02"); //Ma ora è tempo che ti dedichi ai tuoi studi.
	AI_Output (self, other, "DIA_Karras_Success_10_03"); //Prendi questa pergamena magica come ricompensa.
	
	MIS_KarrasVergessen = LOG_SUCCESS;
	B_GivePlayerXP (XP_KarrasCharm);
	B_GiveInvItems (other, self, ItSc_Charm,3);
	B_GiveInvItems (self, other, ItSc_SumWolf,1);
};
///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_Trade		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 = 	2;
	condition	 = 	DIA_Karras_Trade_Condition;
	information	 = 	DIA_Karras_Trade_Info;
	permanent    =  TRUE;
	description	 = 	"Mostrami la mercanzia.";
	trade		 =  TRUE; 
};
func int DIA_Karras_Trade_Condition ()
{	
	if (hero.guild != GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Karras_Trade_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Karras_Trade_15_00"); //Mostrami la mercanzia.
};
///////////////////////////////////////////////////////////////////////
//	Info JOB
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_JOB		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 = 	2;
	condition	 = 	DIA_Karras_JOB_Condition;
	information	 = 	DIA_Karras_JOB_Info;
	permanent    =  FALSE;
	description	 = 	"Qual è esattamente il tuo lavoro?";
};
func int DIA_Karras_JOB_Condition ()
{	
		return TRUE;
};
func void DIA_Karras_JOB_Info ()
{
	AI_Output (other, self, "DIA_Karras_JOB_15_00"); //Qual è esattamente il tuo lavoro?
	AI_Output (self, other, "DIA_Karras_JOB_10_01"); //Sono il responsabile dell'addestramento dei maghi all'arte della manifestazione sferica.
	AI_Output (other, self, "DIA_Karras_JOB_15_02"); //Che significa?
	AI_Output (self, other, "DIA_Karras_JOB_10_03"); //Beh, io insegno loro come evocare le creature o gli esseri da altri stati o sfere.
	AI_Output (self, other, "DIA_Karras_JOB_10_04"); //Di solito si chiama evocazione, anche se questa espressione da sola non basta a definire l'arte di evocare un servitore.
	AI_Output (self, other, "DIA_Karras_JOB_10_05"); //Inoltre possiedo alcune interessanti pergamene magiche che Gorax non ha.
	
	if (other.guild == GIL_NOV)
	{
		AI_Output (self, other, "DIA_Karras_JOB_10_06"); //Ma saranno a disposizione dei soli membri dell'ordine.
	};
	Log_CreateTopic (Topic_KlosterTrader,LOG_NOTE);
	B_LogEntry (Topic_KlosterTrader,"Maestro Karras può rifornirmi con pergamene di incantesimi al monastero. Ma per questo dovrò essere un Mago del Fuoco.");
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_TEACH		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr 			 =  10;
	condition	 = 	DIA_Karras_TEACH_Condition;
	information	 = 	DIA_Karras_TEACH_Info;
	permanent	 = 	TRUE;
	description	 = 	"Istruiscimi (a creare le rune)";
};

func int DIA_Karras_TEACH_Condition ()
{	
	if (other.guild == GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Karras_TEACH_Info ()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output (other, self, "DIA_Karras_TEACH_15_00"); //Insegnami.
	
		Info_ClearChoices   (DIA_Karras_TEACH);
		
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 1)
		&& (PLAYER_TALENT_RUNES [SPL_SummonGoblinSkeleton] == FALSE) 
		{
			Info_AddChoice 		(DIA_Karras_TEACH,B_BuildLearnString (NAME_SPL_SummonGoblinSkeleton, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonGoblinSkeleton)),DIA_Karras_TEACH_SUMGOBL);
			abletolearn = (abletolearn +1);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 2)
		&& (PLAYER_TALENT_RUNES [SPL_SummonWolf] == FALSE) 
		{
			Info_AddChoice	    (DIA_Karras_TEACH, B_BuildLearnString (NAME_SPL_SummonWolf, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonWolf)) ,DIA_Karras_TEACHSummonWolf);
			abletolearn = (abletolearn +1);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 3)
		&& (PLAYER_TALENT_RUNES [SPL_SummonSkeleton] == FALSE) 
		{
			Info_AddChoice	(DIA_Karras_TEACH, B_BuildLearnString (NAME_SPL_SummonSkeleton, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonSkeleton)) ,DIA_Karras_TEACH_SummonSkeleton);
			abletolearn = (abletolearn +1);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 4)
		&& (PLAYER_TALENT_RUNES [SPL_SummonGolem] == FALSE) 
		{
			Info_AddChoice	(DIA_Karras_TEACH, B_BuildLearnString (NAME_SPL_SummonGolem, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonGolem)) ,DIA_Karras_TEACH_SummonGolem);
			abletolearn = (abletolearn +1);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 5)
		&& (PLAYER_TALENT_RUNES [SPL_SummonDemon] == FALSE)
		{
			Info_AddChoice	(DIA_Karras_TEACH, B_BuildLearnString (NAME_SPL_SummonDemon, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonDemon)) ,DIA_Karras_TEACH_SummonDemon);
			abletolearn = (abletolearn +1);
		};
		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 6)
		&& (PLAYER_TALENT_RUNES [SPL_ArmyOfDarkness] == FALSE)
		{
			Info_AddChoice	(DIA_Karras_TEACH, B_BuildLearnString (NAME_SPL_ArmyOfDarkness, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_ArmyOfDarkness)) ,DIA_Karras_TEACH_ArmyOfDarkness);
			abletolearn = (abletolearn +1);
		};
		if 	(abletolearn < 1)
		{
			AI_Output (self, other, "DIA_Karras_TEACH_10_01"); //Per ora non c'è niente che tu possa imparare da me.
		}
		else
		{
			Info_AddChoice 		(DIA_Karras_TEACH,DIALOG_BACK,DIA_Karras_TEACH_BACK);
		};

};
FUNC VOID DIA_Karras_TEACH_BACK()
{
	Info_ClearChoices   (DIA_Karras_TEACH);
};
FUNC VOID DIA_Karras_TEACH_SUMGOBL()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonGoblinSkeleton);	
};
FUNC VOID DIA_Karras_TEACHSummonWolf()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonWolf);	
};
FUNC VOID DIA_Karras_TEACH_SummonSkeleton()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonSkeleton);	
};
FUNC VOID DIA_Karras_TEACH_SummonGolem()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonGolem);	
};
FUNC VOID DIA_Karras_TEACH_SummonDemon()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonDemon);	
};
FUNC VOID DIA_Karras_TEACH_ArmyOfDarkness()
{
	B_TeachPlayerTalentRunes (self, other, SPL_ArmyOfDarkness);	
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_CIRCLE4		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 = 	3;
	condition	 = 	DIA_Karras_CIRCLE4_Condition;
	information	 = 	DIA_Karras_CIRCLE4_Info;
	permanent	 = 	TRUE;
	description	 = 	"Voglio apprendere il quarto Circolo della Magia.";
};
func int DIA_Karras_CIRCLE4_Condition ()
{	
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 3)
	{
		return TRUE;
	};
};
func void DIA_Karras_CIRCLE4_Info ()
{
	AI_Output (other, self, "DIA_Karras_CIRCLE4_15_00"); //Voglio apprendere il quarto Cerchio della magia.
	
	if (MIS_ReadyforChapter4 == TRUE)
	{
		if B_TeachMagicCircle (self,other, 4)
		{
			AI_Output (self, other, "DIA_Karras_CIRCLE4_10_01"); //Bene. Tutte le prove sono state completate. Entra nel quarto cerchio per ricevere il potere della nuova magia.
			AI_Output (self, other, "DIA_Karras_CIRCLE4_10_02"); //Ne hai fatta di strada e Innos continuerà a illuminare il tuo cammino.
		};
	}
	else
	{
			AI_Output (self, other, "DIA_Karras_CIRCLE4_10_03"); //Non è ancora finita.
	};
};
/////////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_CIRCLE5		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 = 	3;
	condition	 = 	DIA_Karras_CIRCLE5_Condition;
	information	 = 	DIA_Karras_CIRCLE5_Info;
	permanent	 = 	TRUE;
	description	 = 	"Voglio apprendere il quinto Circolo della Magia.";
};
func int DIA_Karras_CIRCLE5_Condition ()
{	
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 4)
	{
		return TRUE;
	};
};
func void DIA_Karras_CIRCLE5_Info ()
{
	AI_Output (other, self, "DIA_Karras_CIRCLE5_15_00"); //Voglio apprendere il quinto Cerchio della magia.
	
	if (Kapitel >= 5)
	{
		if B_TeachMagicCircle (self,other, 5)
		{
			AI_Output (self, other, "DIA_Karras_CIRCLE5_10_01"); //Allora entra nel quinto cerchio della magia. Sarai in grado di lanciare incantesimi molto più potenti dei precedenti.
			AI_Output (self, other, "DIA_Karras_CIRCLE5_10_02"); //Usa il suo potere con saggezza, fratello, perché le tenebre sono ancora forti e così i tuoi nemici.
			AI_Output (self, other, "DIA_Karras_CIRCLE5_10_03"); //Non posso accompagnarti nel sesto e più alto cerchio della magia. Sarà Purokar in persona a farlo, al momento opportuno.
			
			B_LogEntry (Topic_KlosterTeacher,"Maestro Pyrokar mi introdurrà al sesto Circolo della Magia.");
		};
	}
	else
	{
			AI_Output (self, other, "DIA_Karras_CIRCLE4_10_04"); //I tempi non sono ancora maturi.
	};
};
//#####################################################################
//##
//##		Kapitel 2
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Karras_KAP2_EXIT   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 999;
	condition   = DIA_Karras_KAP2_EXIT_Condition;
	information = DIA_Karras_KAP2_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Karras_KAP2_EXIT_Condition()
{
	if (Kapitel == 2)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Karras_KAP2_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//#####################################################################
//##
//##		Kapitel 3
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Karras_KAP3_EXIT   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 999;
	condition   = DIA_Karras_KAP3_EXIT_Condition;
	information = DIA_Karras_KAP3_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Karras_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Karras_KAP3_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info ChasePedro
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_ChasePedro		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 =	31;
	condition	 = 	DIA_Karras_ChasePedro_Condition;
	information	 = 	DIA_Karras_ChasePedro_Info;
	permanent	 = 	FALSE;
	important 	 =  TRUE;
};

func int DIA_Karras_ChasePedro_Condition ()
{	
	if (Npc_IsInState (self,ZS_Talk))
	&& (KAPITEL == 3)
	&& (MIS_NOVIZENCHASE == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Karras_ChasePedro_Info ()
{
	if (hero.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Karras_ChasePedro_10_00"); //Fratello, non devi perdere altro tempo. Devi metterti sulle tracce di Pedro e riportare l'Occhio di Innos al monastero.
		AI_Output (self ,other,"DIA_Karras_ChasePedro_10_01"); //Se l'Occhio non viene recuperato, saremo tutti persi.
	}
	else
	{
		AI_Output	(self ,other, "DIA_Karras_ChasePedro_10_02"); //Cosa ci fai qui? Non dovresti dare la caccia al traditore Pedro?
	
		Info_ClearChoices (DIA_Karras_ChasePedro);
		Info_AddChoice (DIA_Karras_ChasePedro,"Più tardi. Prima devo occuparmi di un’altra faccenda.",DIA_Karras_ChasePedro_Later);
		Info_AddChoice (DIA_Karras_ChasePedro,"Non andrà molto lontano…",DIA_Karras_ChasePedro_WontEscape);
	};

};	

func void DIA_Karras_ChasePedro_Later ()
{
	AI_Output (other,self ,"DIA_Karras_ChasePedro_Later_15_00"); //Più tardi. Prima devo occuparmi di un’altra faccenda.
	AI_Output (self ,other,"DIA_Karras_ChasePedro_Later_10_01"); //Hai idea di cosa significhi questa perdita per il monastero? L'Occhio di Innos è un'arma potente.
	AI_Output (self ,other,"DIA_Karras_ChasePedro_Later_10_02"); //Nessuno può prevedere cosa ha intenzione di fare il nemico con quell'amuleto, ma starà certamente pensando a qualcosa e noi dobbiamo fermarlo.
	AI_Output (self ,other,"DIA_Karras_ChasePedro_Later_10_03"); //Muoviti immediatamente e acciuffa quel ladro!

	AI_StopProcessInfos (self);
};

FUNC VOID DIA_Karras_ChasePedro_WontEscape ()
{
	AI_Output (other,self ,"DIA_Karras_ChasePedro_WontEscape_15_00"); //Non andrà molto lontano...
	AI_Output (self ,other,"DIA_Karras_ChasePedro_WontEscape_10_01"); //Lo spero per il tuo bene. Se dovesse fuggire perché ti sei attardato qui, ti trascinerò di persona dinanzi al tribunale.
	AI_Output (other,self ,"DIA_Karras_ChasePedro_WontEscape_15_02"); //Di cosa mi accuseresti?
	AI_Output (self ,other,"DIA_Karras_ChasePedro_WontEscape_10_03"); //Cospirazione con il nemico. Ci vuole poco a intuire quale sia la punizione per un crimine del genere.
	AI_Output (self ,other,"DIA_Karras_ChasePedro_WontEscape_10_04"); //E ora vedi di non perdere altro tempo, altrimenti la prossima volta che ci incontreremo potrebbe essere sul rogo.

	AI_StopProcessInfos (self);
};
	
///////////////////////////////////////////////////////////////////////
//	Info ChasePedro
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_NeedInfo		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 =	31;
	condition	 = 	DIA_Karras_NeedInfo_Condition;
	information	 = 	DIA_Karras_NeedInfo_Info;
	permanent	 = 	TRUE;
	important	 =	TRUE;
};

func int DIA_Karras_NeedInfo_Condition ()
{	
	if (Npc_KnowsInfo  (other ,DIA_Karras_ChasePedro))
	&& (KAPITEL == 3)
	&& (hero.Guild != GIL_KDF)
	&& (MIS_NOVIZENCHASE == LOG_RUNNING)
	&& (Npc_IsInState (self,ZS_Talk))
	{
		return TRUE;
	};
};
func void DIA_Karras_NeedInfo_Info ()
{
	
	AI_Output (self ,other,"DIA_Karras_NeedInfo_10_00"); //Hai tutte le informazioni che ti servono. Ora vattene!
	
	AI_StopProcessInfos (self);
};

//********************************************************************
//		Auge gefunden
//********************************************************************

///////////////////////////////////////////////////////////////////////
//	Info ChasePedro
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_InnosEyeRetrieved		(C_INFO)
{
	npc			 = 	KDF_503_Karras;
	nr			 =	1;	//damit auch ganz sicher diese Info kommt (wg hello)!!!!
	condition	 = 	DIA_Karras_InnosEyeRetrieved_Condition;
	information	 = 	DIA_Karras_InnosEyeRetrieved_Info;
	permanent	 = 	FALSE;
	description	 =	"Ho riportato l’Occhio di Innos.";
};

func int DIA_Karras_InnosEyeRetrieved_Condition ()
{	
	if	(KAPITEL == 3)
	&& 	(MIS_NOVIZENCHASE == LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Karras_InnosEyeRetrieved_Info ()
{
	
	AI_Output (other,self ,"DIA_Karras_InnosEyeRetrieved_15_00"); //Ho riportato l’Occhio di Innos.
	AI_Output (self ,other,"DIA_Karras_InnosEyeRetrieved_10_01"); //Sono sollevato che tu sia riuscito a recuperare l'Occhio dal nemico.
	AI_Output (self ,other,"DIA_Karras_InnosEyeRetrieved_10_02"); //Ma il pericolo non è ancora stato scongiurato. Il male sta facendo altri piani e sta procedendo con un'aggressività insolita.
	AI_Output (other,self ,"DIA_Karras_InnosEyeRetrieved_15_03"); //Me ne sono già accorto personalmente.
	AI_Output (self ,other,"DIA_Karras_InnosEyeRetrieved_10_04"); //Non scherzare. La situazione è seria, molto seria, e non sappiamo di chi possiamo fidarci.
	AI_Output (self ,other,"DIA_Karras_InnosEyeRetrieved_10_05"); //Il nemico è già riuscito a indurre in tentazione il novizio Pedro e potrebbe riuscirci con molti altri.

	B_GivePlayerXP (XP_AMBIENT);
};
	
///////////////////////////////////////////////////////////////////////
//	KAP3_Perm
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Karras_KAP3_Perm   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 5;
	condition   = DIA_Karras_KAP3_Perm_Condition;
	information = DIA_Karras_KAP3_Perm_Info;
	permanent   = TRUE;
	description = "Come procedono i tuoi studi?";
};
FUNC INT DIA_Karras_KAP3_Perm_Condition()
{
	if (Kapitel >= 3)
	&& (Npc_KnowsInfo(other, DIA_Karras_JOB))
		{
			return TRUE;
		};	
};
FUNC VOID DIA_Karras_KAP3_Perm_Info()
{
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_15_00"); //Come procedono i tuoi studi?

	if (MIS_KarrasResearchDMT == FALSE)
	&& (PyrokarToldKarrasToResearchDMT == TRUE)
	&& (hero.guild == GIL_KDF)
	{
		
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_01"); //Sono riuscito a scoprire qualcosa sui Cercatori.
		AI_Output (other,self ,"DIA_Karras_KAP3_Perm_15_02"); //E sarebbe?
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_03"); //La loro origine è chiaramente demoniaca. Beh, almeno sono, o erano, sotto l'influenza dei demoni.
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_04"); //Fai attenzione nel caso dovessi incontrarli.
		AI_Output (other,self ,"DIA_Karras_KAP3_Perm_15_05"); //Sai che novità.
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_06"); //Mi dispiace, ma non ho abbastanza materiale per fare delle affermazioni più precise.
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_07"); //Ma se tu riuscissi a prendere qualcosa che appartiene a loro per poterla studiare...
		
		MIS_KarrasResearchDMT = LOG_RUNNING;
		B_LogEntry (TOPIC_DEMENTOREN,"Karras ha bisogno di qualcosa che sia stato in contatto diretto con i Cercatori per poter continuare le proprie ricerche."); 

		Info_ClearChoices (DIA_Karras_KAP3_Perm);
		Info_AddChoice (DIA_Karras_KAP3_Perm,DIALOG_BACK,DIA_Karras_KAP3_Perm_Back);
		Info_AddChoice (DIA_Karras_KAP3_Perm,"Vedrò cosa posso fare.",DIA_Karras_KAP3_Perm_WillSee);
		Info_AddChoice (DIA_Karras_KAP3_Perm,"Il Dormiente c’entra qualcosa in tutto questo?",DIA_Karras_KAP3_Perm_Sleeper);
		Info_AddChoice (DIA_Karras_KAP3_Perm,"Che tipo di materiale ti serve?",DIA_Karras_KAP3_Perm_Material);
	}
	else if MIS_KarrasResearchDMT == LOG_RUNNING 
	{
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_08"); //Sto ancora lavorando all'interpretazione delle prove sui Cercatori.
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_09"); //Ovviamente ti informerò subito non appena scopro qualcosa.
	}
	else 
	{
		AI_Output (self ,other,"DIA_Karras_KAP3_Perm_10_10"); //Il nemico ha molte facce. È difficile dire quali di queste rappresentano il pericolo maggiore per il monastero.
	};
};


FUNC VOID DIA_Karras_KAP3_Perm_Back()
{
	Info_ClearChoices (DIA_Karras_KAP3_Perm);
};

FUNC VOID DIA_Karras_KAP3_Perm_Sleeper()
{
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_Sleeper_15_00"); //Il Dormiente c’entra qualcosa in tutto questo?
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Sleeper_10_01"); //Ho sentito la storia sul Dormiente. Ma da qui non posso dire nulla in proposito.
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Sleeper_10_02"); //Ci sono un numero infinito di demoni e tutti loro potrebbero essere coinvolti.
};

FUNC VOID DIA_Karras_KAP3_Perm_Corpse()
{
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_Corpse_15_00"); //Vuoi dunque che ti porti un cadavere?
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Corpse_10_01"); //No, sei pazzo? I pericoli rappresentati da un essere demoniaco all'interno delle mura del monastero sono troppo elevati.
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Corpse_10_02"); //È più che sufficiente che mi porti degli oggetti appartenenti a questi esseri.
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Corpse_10_03"); //I resti di un'aura demoniaca dovrebbero essere una prova più che sufficiente da esaminare.
};

FUNC VOID DIA_Karras_KAP3_Perm_Material()
{
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_Material_15_00"); //Che tipo di materiale ti serve?
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_Material_10_01"); //Che ne so, qualsiasi oggetto che appartenga in paricolar modo a questi esseri.
	
	Info_AddChoice (DIA_Karras_KAP3_Perm,"Vuoi che ti porti un cadavere?",DIA_Karras_KAP3_Perm_Corpse);
};

FUNC VOID DIA_Karras_KAP3_Perm_WillSee()
{
	AI_Output (other,self ,"DIA_Karras_KAP3_Perm_WillSee_15_00"); //Vedrò cosa posso fare.
	AI_Output (self ,other,"DIA_Karras_KAP3_Perm_WillSee_10_01"); //Sarebbe certamente d'aiuto. Nel frattempo, condurrrò la mia ricerca personale
	Info_ClearChoices (DIA_Karras_KAP3_Perm);
};

//********************************************************************
//	Ich habe hier dieses Buch.
//********************************************************************

INSTANCE DIA_Karras_HaveBook   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 2;
	condition   = DIA_Karras_HaveBook_Condition;
	information = DIA_Karras_HaveBook_Info;
	permanent   = FALSE;
	description = "Ho un almanacco sui posseduti, qui.";
};
FUNC INT DIA_Karras_HaveBook_Condition()
{
	if (MIS_KarrasResearchDMT == LOG_RUNNING)
	&& (Npc_HasItems (hero, ITWR_DementorObsessionBook_MIS) >= 1)
	&& (hero.guild == GIL_KDF)
	{
		return TRUE;
	};	
};
var int KarrasGotResearchDMTBook_Day;
FUNC VOID DIA_Karras_HaveBook_Info()
{
	AI_Output (other,self ,"DIA_Karras_HaveBook_15_00"); //Ho qui con me un almanacco dei posseduti. Forse potrebbe tornarti utile.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_01"); //Mostramelo.
	
	Npc_RemoveInvItems	(other,	ITWR_DementorObsessionBook_MIS,	1);
    AI_PrintScreen (PRINT_ItemGegeben, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);	// "1 Gegenstand gegeben"	
		
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_02"); //Sì, potrebbe servire. Esaminerò il libro.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_03"); //Ma sono già convinto di una cosa.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_04"); //Secondo la mia opinione, i Cercatori sono una forma di vita completamente corrotta creata da Beliar.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_05"); //Questi essere sono di origine mezza umana e mezza demoniaca.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_06"); //Tuttavia, al momento non sono ancora in grado di dire se abbiamo di fronte un tipo di possessione spirituale o o una semplice mutazione fisica.
	AI_Output (self ,other,"DIA_Karras_HaveBook_10_07"); //Ripassa più tardi e saprò essere certamente più preciso.
	MIS_KarrasResearchDMT = LOG_SUCCESS;
	B_LogEntry (TOPIC_DEMENTOREN,"Karras è riuscito a utilizzare l'almanacco dei posseduti per ulteriori ricerche. Dovrò tornare da lui più tardi."); 
	KarrasGotResearchDMTBook_Day = Wld_GetDay(); 
	B_GivePlayerXP (XP_KarrasResearchDMT);
};

//********************************************************************
//	ResearchDMTEnd
//********************************************************************

INSTANCE DIA_Karras_ResearchDMTEnd   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 2;
	condition   = DIA_Karras_ResearchDMTEnd_Condition;
	information = DIA_Karras_ResearchDMTEnd_Info;
	permanent   = TRUE;

	description = "Hai trovato qualcosa di nuovo sui Cercatori?";
};
FUNC INT DIA_Karras_ResearchDMTEnd_Condition()
{
	if (MIS_KarrasResearchDMT == LOG_SUCCESS)
	&& (hero.guild == GIL_KDF)
	&& (SC_KnowsMadPsi == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Karras_ResearchDMTEnd_Info()
{
	AI_Output (other,self ,"DIA_Karras_ResearchDMTEnd_15_00"); //Hai trovato qualcosa di nuovo sui Cercatori?

	if (KarrasGotResearchDMTBook_Day <= (Wld_GetDay()-2))
	{
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_01"); //Sì. Ora so con esattezza chi o cosa sono i Cercatori.
		AI_Output (other ,self,"DIA_Karras_ResearchDMTEnd_15_02"); //Sputa l'osso!
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_03"); //Un tempo erano esseri umani come noi, poi hanno fatto il madornale errore di dedicarsi alla magia impura di un arcidemone molto potente.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_04"); //Sotto l'influenza di questo arcidemone, oltre che di droghe molto potenti, essi esistevano solo per servire lui finché non furono ridotti a semplici ombre di se stessi.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_05"); //Oggi non sono altro che strumenti del male, senza una volontà propria, e non smetteranno mai di dare la caccia ai seguaci di Innos.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_06"); //Dobbiamo fare attenzione. Per ora sembrano tenersi alla larga dalle sacre stanze di Innos.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_07"); //Tuttavia, se il loro potere continua a crescere, non so se saremo ancora al sicuro qui dentro.
		AI_Output (other ,self,"DIA_Karras_ResearchDMTEnd_15_08"); //Grazie. Sei stato molto chiaro.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_09"); //Davvero? A me tutto questo ha fatto sorgere solo ulteriori domande. Per esempio, chi erano prima, e quale arcidemone li ha trasformati in ciò che sono ora?
		AI_Output (other ,self,"DIA_Karras_ResearchDMTEnd_15_10"); //Mi sono fatto un'idea personale. Tutto sembrerebbe risalire alla Confraternita del Dormiente. La conosco bene.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_11"); //Spero tu sappia ciò in cui stai per essere coinvolto. Abbi cura di te, fratello.
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_12"); //Ma certo. Ecco il tuo almanacco. A me non serve più.

		CreateInvItems	(other,	ITWR_DementorObsessionBook_MIS,	1);
		AI_PrintScreen	(PRINT_ItemErhalten, -1, YPOS_ItemTaken, FONT_ScreenSmall, 2);	// "1 Gegenstand erhalten"

		SC_KnowsMadPsi = TRUE;
		B_LogEntry (TOPIC_DEMENTOREN,"Gli studi di Karras hanno avuto successo. Sembra che ci sia un legame di qualche tipo tra i Cercatori e la Fratellanza del Dormiente."); 
		B_GivePlayerXP (XP_SC_KnowsMadPsi);
	}
	else
	{
		AI_Output (self ,other,"DIA_Karras_ResearchDMTEnd_10_13"); //Ci sto lavorando sopra. Ripassa più tardi.
	};
};

//********************************************************************
//	Prot_BlackEye	(ItAm_Prot_BlackEye_Mis)
//********************************************************************

INSTANCE DIA_Karras_Prot_BlackEye   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 2;
	condition   = DIA_Karras_Prot_BlackEye_Condition;
	information = DIA_Karras_Prot_BlackEye_Info;
	permanent   = TRUE;

	description = "Esiste un modo per proteggersi dagli attacchi mentali dei Cercatori?";
};
FUNC INT DIA_Karras_Prot_BlackEye_Condition()
{
	if (hero.guild == GIL_KDF)
	&& (Pyrokar_AskKarrasAboutDMTAmulett == TRUE)
	&& (MIS_Karras_FindBlessedStone == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Karras_JOB))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Karras_Prot_BlackEye_Info()
{
	AI_Output (other,self ,"DIA_Karras_Prot_BlackEye_15_00"); //Esiste un modo per proteggersi dagli attacchi mentali dei Cercatori?

	if (SC_KnowsMadPsi == TRUE)
	{
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_01"); //Sì. Un amuleto preparato con una pietra proveniente da un terreno benedetto potrebbe avere un effetto positivo.
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_02"); //Sfortunatamente, non ho nessuna di queste pietre con me.
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_03"); //Alcuni dei nostri santuari di preghiera che abbiamo eretto qui sono costituiti da queste pietre.
		AI_Output (other,self ,"DIA_Karras_Prot_BlackEye_15_04"); //D'accordo. Prenderò alcune di queste.
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_05"); //D’accordo, ma non provare a danneggiare i santuari, intesi?
		B_LogEntry (TOPIC_DEMENTOREN,"Karras può fornirmi una certa protezione contro gli attacchi mentali dei Cercatori. Ha bisogno di una pietra proveniente da un terreno benedetto. Alcuni santuari sono fatti di tali pietre."); 
		MIS_Karras_FindBlessedStone = LOG_RUNNING;
	}
	else
	{
		AI_Output (self ,other,"DIA_Karras_Prot_BlackEye_10_06"); //Non ne ho idea. So ancora troppo poco per poterti rispondere. Richiedimelo più tardi.
	};
};

//********************************************************************
//	KarrasBlessedStone	(ItAm_Prot_BlackEye_Mis)
//********************************************************************

INSTANCE DIA_Karras_KarrasBlessedStone   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 2;
	condition   = DIA_Karras_KarrasBlessedStone_Condition;
	information = DIA_Karras_KarrasBlessedStone_Info;

	description = "Ho una pietra prelevata dal suolo benedetto.";
};
FUNC INT DIA_Karras_KarrasBlessedStone_Condition()
{
	if (hero.guild == GIL_KDF)
	&& (Npc_HasItems (other,ItMi_KarrasBlessedStone_Mis))
	&& (MIS_Karras_FindBlessedStone == LOG_RUNNING)
	{
		return TRUE;
	};	
};
var int KarrasMakesBlessedStone_Day;
FUNC VOID DIA_Karras_KarrasBlessedStone_Info()
{
	AI_Output (other,self ,"DIA_Karras_KarrasBlessedStone_15_00"); //Ho una pietra prelevata dal suolo benedetto.
	B_GiveInvItems (other, self, ItMi_KarrasBlessedStone_Mis,1);
	AI_Output (self ,other,"DIA_Karras_KarrasBlessedStone_10_01"); //Bene. Spero che tutti i santuari di preghiera siano ancora al loro posto.
	AI_Output (self ,other,"DIA_Karras_KarrasBlessedStone_10_02"); //D'accordo. Preparerò un amuleto di protezione contro lo sguardo oscuro dei Cercatori.
	AI_Output (self ,other,"DIA_Karras_KarrasBlessedStone_10_03"); //Dammi un po' di tempo. Devo tornare subito al lavoro.
	KarrasMakesBlessedStone_Day = Wld_GetDay(); 
	MIS_Karras_FindBlessedStone	= LOG_SUCCESS;
	B_LogEntry (TOPIC_DEMENTOREN,"Karras mi darà un amuleto protettivo contro gli attacchi mentali dei Cercatori. Questo semplificherà le cose."); 
	B_GivePlayerXP (XP_Karras_FoundBlessedStone);
	AI_StopProcessInfos (self);
};

//********************************************************************
//	ItAm_Prot_BlackEye_Mis
//********************************************************************

INSTANCE DIA_Karras_ItAm_Prot_BlackEye_Mis   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 2;
	condition   = DIA_Karras_ItAm_Prot_BlackEye_Mis_Condition;
	information = DIA_Karras_ItAm_Prot_BlackEye_Mis_Info;
	permanent	 = 	TRUE;

	description = "Allora, dov’è l’amuleto protettivo che mi avevi promesso?";
};
var int DIA_Karras_ItAm_Prot_BlackEye_Mis_NoPerm;
FUNC INT DIA_Karras_ItAm_Prot_BlackEye_Mis_Condition()
{
	if (hero.guild == GIL_KDF)
	&& (MIS_Karras_FindBlessedStone == LOG_SUCCESS)
	&& (DIA_Karras_ItAm_Prot_BlackEye_Mis_NoPerm == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Karras_ItAm_Prot_BlackEye_Mis_Info()
{
	AI_Output (other,self ,"DIA_Karras_ItAm_Prot_BlackEye_Mis_15_00"); //Allora, dov’è l’amuleto protettivo che mi avevi promesso?
	
	if (KarrasMakesBlessedStone_Day<=(Wld_GetDay()-2))
	{
		AI_Output (self ,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_01"); //Ho terminato. Ecco, dai un'occhiata. È venuta fuori una meraviglia.
		CreateInvItems (self, ItAm_Prot_BlackEye_Mis, 1);									
		B_GiveInvItems (self, other, ItAm_Prot_BlackEye_Mis, 1);					
		AI_Output (self ,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_02"); //Portalo sempre con te e i Cercatori non saranno in grado di trascinarti nel loro abisso mentale.
		AI_Output (other,self ,"DIA_Karras_ItAm_Prot_BlackEye_Mis_15_03"); //Grazie.
		B_LogEntry (TOPIC_DEMENTOREN,"Karras mi ha dato un amuleto per proteggermi contro lo sguardo oscuro dei Cercatori."); 
		DIA_Karras_ItAm_Prot_BlackEye_Mis_NoPerm = TRUE;
		B_GivePlayerXP (XP_Ambient);
	}
	else
	{
		AI_Output (self ,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_04"); //Porta pazienza. Ci sto ancora lavorando.
	};
};

//#####################################################################
//##
//##		Kapitel 4
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Kap4 Exit	
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Karras_KAP4_EXIT   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 999;
	condition   = DIA_Karras_KAP4_EXIT_Condition;
	information = DIA_Karras_KAP4_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Karras_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Karras_KAP4_EXIT_Info()
{
	AI_StopProcessInfos (self);
};


//#####################################################################
//##
//##		Kapitel 5
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Karras_KAP5_EXIT   (C_INFO)
{
	npc         = KDF_503_Karras;
	nr          = 999;
	condition   = DIA_Karras_KAP5_EXIT_Condition;
	information = DIA_Karras_KAP5_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Karras_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Karras_KAP5_EXIT_Info()
{
	AI_StopProcessInfos (self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Karras_PICKPOCKET (C_INFO)
{
	npc			= KDF_503_Karras;
	nr			= 900;
	condition	= DIA_Karras_PICKPOCKET_Condition;
	information	= DIA_Karras_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Karras_PICKPOCKET_Condition()
{
	C_Beklauen (49, 35);
};
 
FUNC VOID DIA_Karras_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Karras_PICKPOCKET);
	Info_AddChoice		(DIA_Karras_PICKPOCKET, DIALOG_BACK 		,DIA_Karras_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Karras_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Karras_PICKPOCKET_DoIt);
};

func void DIA_Karras_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Karras_PICKPOCKET);
};
	
func void DIA_Karras_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Karras_PICKPOCKET);
};


