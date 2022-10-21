// ************************************************************
// 			  					EXIT
// ************************************************************
INSTANCE DIA_Cord_EXIT   (C_INFO)
{
	npc         = SLD_805_Cord;
	nr          = 999;
	condition   = DIA_Cord_EXIT_Condition;
	information = DIA_Cord_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Cord_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Cord_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info MeetingIsRunning
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cord_MeetingIsRunning		(C_INFO)
{
	npc		 = 	SLD_805_Cord;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Cord_MeetingIsRunning_Condition;
	information	 = 	DIA_Addon_Cord_MeetingIsRunning_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Addon_Cord_MeetingIsRunning_Condition ()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (RangerMeetingRunning == LOG_RUNNING)
		{
			return TRUE;
		};	
};
var int DIA_Addon_Cord_MeetingIsRunning_OneTime;
func void DIA_Addon_Cord_MeetingIsRunning_Info ()
{
	if (DIA_Addon_Cord_MeetingIsRunning_OneTime == FALSE)
	{
		AI_Output			(self, other, "DIA_Addon_Cord_MeetingIsRunning_14_00"); //Benvenuto nell'Anello dell'Acqua, fratello.
		DIA_Addon_Cord_MeetingIsRunning_OneTime = TRUE;
	}
	else
	{
		AI_Output			(self, other, "DIA_Addon_Cord_MeetingIsRunning_14_01"); //Va' da Vatras, ora...
	};
	
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  					Hallo
// ************************************************************
INSTANCE DIA_Cord_Hallo   (C_INFO)
{
	npc         = SLD_805_Cord;
	nr          = 2;
	condition   = DIA_Cord_Hallo_Condition;
	information = DIA_Cord_Hallo_Info;
	permanent   = FALSE;
	important 	= TRUE;
};

FUNC INT DIA_Cord_Hallo_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (other.guild == GIL_NONE)
	&& (RangerMeetingRunning != LOG_SUCCESS)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Cord_Hallo_Info()
{
	AI_Output (self ,other, "DIA_Cord_Hallo_14_00"); //Se hai qualche problema con i lupi o i razziatori dei campi, vai a parlare con uno dei mercenari più giovani.
	AI_Output (self ,other, "DIA_Cord_Hallo_14_01"); //Puoi venire da me quando i paladini si faranno vedere.
	
	if (SC_IsRanger == FALSE)
	{	
		AI_Output (other, self, "DIA_Cord_Hallo_15_02"); //Cosa?
		AI_Output (self ,other, "DIA_Cord_Hallo_14_03"); //Ogni volta che un contadino viene da me, è sempre per trucidare qualche bestia innocente.
		AI_Output (other, self, "DIA_Cord_Hallo_15_04"); //Non sono un contadino.
		AI_Output (self ,other, "DIA_Cord_Hallo_14_05"); //Oh? E cosa vuoi allora?
	};
};

// ************************************************************
// 			  					WannaJoin
// ************************************************************
var int Cord_SchonmalGefragt;
// ------------------------------------------------------------
INSTANCE DIA_Cord_WannaJoin   (C_INFO)
{
	npc         = SLD_805_Cord;
	nr          = 5;
	condition   = DIA_Cord_WannaJoin_Condition;
	information = DIA_Cord_WannaJoin_Info;
	permanent   = TRUE;
	description = "Voglio diventare un mercenario!";
};

FUNC INT DIA_Cord_WannaJoin_Condition()
{
	if (Cord_Approved == FALSE)
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID B_Cord_BeBetter ()
{
	AI_Output (self ,other, "DIA_Cord_WannaJoin_14_14"); //Fino a quando saprai a malapena reggere una spada in mano, sarai nel posto sbagliato!
};

FUNC VOID DIA_Cord_WannaJoin_Info()
{
	AI_Output (other, self, "DIA_Cord_WannaJoin_15_00"); //Voglio diventare un mercenario!
	if (Cord_SchonmalGefragt == FALSE)
	{
		AI_Output (self ,other, "DIA_Cord_WannaJoin_14_01"); //Sembri più qualcuno che sia nato per lavorare nei campi, ragazzo.
		AI_Output (self ,other, "DIA_Cord_WannaJoin_14_02"); //Sai impugnare un'arma?
		Cord_SchonmalGefragt = TRUE;
	}
	else
	{
		AI_Output (self ,other, "DIA_Cord_WannaJoin_14_03"); //Sei migliorato nel frattempo?
	};
	
	AI_Output (self ,other, "DIA_Cord_WannaJoin_14_04"); //Allora, che mi dici delle armi a una mano?
	if (Npc_GetTalentSkill(other, NPC_TALENT_1H) > 0)
	{
		AI_Output (other, self, "DIA_Cord_WannaJoin_15_05"); //Non me la cavo male.
	}
	else
	{
		AI_Output (other, self, "DIA_Cord_WannaJoin_15_06"); //Beh...
	};
	AI_Output (self ,other, "DIA_Cord_WannaJoin_14_07"); //E le armi a due mani, allora?
	if (Npc_GetTalentSkill(other, NPC_TALENT_2H) > 0)
	{
		AI_Output (other, self, "DIA_Cord_WannaJoin_15_08"); //So utilizzarle.
	}
	else
	{
		AI_Output (other, self, "DIA_Cord_WannaJoin_15_09"); //Sto sicuramente migliorando!
	};
	
	if (Npc_GetTalentSkill(other, NPC_TALENT_1H) > 0)
	|| (Npc_GetTalentSkill(other, NPC_TALENT_2H) > 0)
	{
		AI_Output (self ,other, "DIA_Cord_WannaJoin_14_10"); //Beh, perlomeno non sei un dannato principiante. D'accordo, voterò per te.
		AI_Output (self ,other, "DIA_Cord_WannaJoin_14_11"); //Qualsiasi altra cosa tu voglia sapere, potrai impararla da me.
		Cord_Approved = TRUE;
		B_GivePlayerXP (XP_Cord_Approved);
		B_LogEntry (TOPIC_SLDRespekt,"Ho ottenuto il voto di Cord.");
		Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
		B_LogEntry (Topic_SoldierTeacher,"Cord può allenarmi nell'uso delle armi a una e due mani.");
	}
	else
	{
		AI_Output (self ,other, "DIA_Cord_WannaJoin_14_12"); //In altre parole: sei un dannato pivello!
		AI_Output (self ,other, "DIA_Cord_WannaJoin_14_13"); //Ogni mercenario dev'essere in grado di poter contare sui propri compagni. Le nostre vite dipendono da questo.
		B_Cord_BeBetter ();
		
		Log_CreateTopic (TOPIC_CordProve,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_CordProve,LOG_RUNNING); 
		B_LogEntry (TOPIC_CordProve,"Cord mi concederà il suo voto quando avrò imparato a combattere meglio."); 
	};
};

///////////////////////////////////////////////////////////////////////
//	Info YouAreRanger
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cord_YouAreRanger		(C_INFO)
{
	npc		 = 	SLD_805_Cord;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Cord_YouAreRanger_Condition;
	information	 = 	DIA_Addon_Cord_YouAreRanger_Info;

	description	 = 	"Ho sentito dire che appartieni all'Anello dell'Acqua.";
};

func int DIA_Addon_Cord_YouAreRanger_Condition ()
{
	if (RangerHelp_gildeSLD == TRUE)
	&& (Cord_SchonmalGefragt == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Cord_YouAreRanger_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cord_YouAreRanger_15_00"); //Ho sentito dire che appartieni all'Anello dell'Acqua.
	
	if (SC_IsRanger == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Cord_YouAreRanger_14_01"); //Chi è lo spione che non è riuscito a tenere la bocca chiusa?
		
		if (SC_KnowsCordAsRangerFromLee == TRUE)
		{
			AI_Output	(other, self, "DIA_Addon_Cord_YouAreRanger_15_02"); //Me l'ha detto Lee.
		};
	
		if (SC_KnowsCordAsRangerFromLares == TRUE)
		{
			AI_Output	(other, self, "DIA_Addon_Cord_YouAreRanger_15_03"); //Lares mi ha detto di dirti che 'risiedo sotto la sua ala'.
		};
	};
	
	AI_Output	(self, other, "DIA_Addon_Cord_YouAreRanger_14_04"); //(sospira) A quanto pare adesso dovrò occuparmi di te, eh?
	//AI_Output	(self, other, "DIA_Addon_Cord_YouAreRanger_14_05"); //Was muss ich denn jetzt für dich machen, damit du die Schnauze hälst?
	AI_Output	(self, other, "DIA_Addon_Cord_Add_14_01"); //D'accordo, cosa ti serve allora?
	AI_Output	(self, other, "DIA_Addon_Cord_YouAreRanger_14_06"); //E sta' bene attento a quel che dici, perché se mi fai arrabbiare ti spello vivo.
	
	Info_ClearChoices	(DIA_Addon_Cord_YouAreRanger);
	Info_AddChoice	(DIA_Addon_Cord_YouAreRanger, "Non ho bisogno di nulla. Posso cavarmela da solo.", DIA_Addon_Cord_YouAreRanger_nix );
	Info_AddChoice	(DIA_Addon_Cord_YouAreRanger, "Voglio la tua armatura.", DIA_Addon_Cord_YouAreRanger_ruestung );
	Info_AddChoice	(DIA_Addon_Cord_YouAreRanger, "Voglio la tua arma!", DIA_Addon_Cord_YouAreRanger_waffe );
	if (Cord_Approved == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Cord_YouAreRanger, "Insegnami a combattere.", DIA_Addon_Cord_YouAreRanger_kampf );
	};
	if (hero.guild == GIL_NONE)
	{
		//Info_AddChoice	(DIA_Addon_Cord_YouAreRanger, "Verschwinde hier. Ich will deinen Platz auf dem Hof einnehmen.", DIA_Addon_Cord_YouAreRanger_weg );
	};
	if (hero.guild == GIL_NONE)
	{
		Info_AddChoice	(DIA_Addon_Cord_YouAreRanger, "Potresti aiutarmi a unirmi ai mercenari.", DIA_Addon_Cord_YouAreRanger_SLDAufnahme );
	};
	//Info_AddChoice	(DIA_Addon_Cord_YouAreRanger, "Bezahl mich für mein Schweigen.", DIA_Addon_Cord_YouAreRanger_Gold );
};
var int Cord_SC_Dreist;
func void 	B_DIA_Addon_Cord_YouAreRanger_WARN ()
{
	AI_Output			(self, other, "DIA_Addon_Cord_YouAreRanger_WARN_14_00"); //(minaccioso) E guai a te se vengo a sapere che non sai tenere la bocca chiusa. E non te lo ripeterò un'altra volta, intesi?
};
func void 	B_DIA_Addon_Cord_YouAreRanger_FRESSE ()
{
	AI_Output			(self, other, "DIA_Addon_Cord_YouAreRanger_FRESSE_14_00"); //(furioso) Ora hai proprio passato il segno. Ti userò per spazzare il cortile!
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
	Cord_RangerHelp_GetSLD = FALSE;
	Cord_RangerHelp_Fight = FALSE;
	TOPIC_End_RangerHelpSLD = TRUE;
};
func void DIA_Addon_Cord_YouAreRanger_ruestung ()
{
	AI_Output			(other, self, "DIA_Addon_Cord_YouAreRanger_ruestung_15_00"); //Voglio la tua armatura.

	if (Cord_SC_Dreist == FALSE)
	{
		AI_Output			(self, other, "DIA_Addon_Cord_YouAreRanger_ruestung_14_01"); //Dillo un'altra volta e ti faccio sputare tutti i denti.
		Cord_SC_Dreist = TRUE;
	}
	else
	{
		B_DIA_Addon_Cord_YouAreRanger_FRESSE ();
	};
};

func void DIA_Addon_Cord_YouAreRanger_waffe ()
{
	AI_Output (other, self, "DIA_Addon_Cord_YouAreRanger_Add_15_00"); //Voglio la tua arma!

	if (Cord_SC_Dreist == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Cord_Add_14_03"); //(in tono minaccioso) Ma davvero?!
		AI_Output (self, other, "DIA_Addon_Cord_Add_14_02"); //(cupo) Vieni a prendertela!
		Cord_SC_Dreist = TRUE;
	}
	else
	{
		B_DIA_Addon_Cord_YouAreRanger_FRESSE ();
	};
};

func void DIA_Addon_Cord_YouAreRanger_weg ()
{
	AI_Output			(other, self, "DIA_Addon_Cord_YouAreRanger_weg_15_00"); //Fila via. Voglio prendere il tuo posto qui alla fattoria.

	if (Cord_SC_Dreist == FALSE)
	{
		AI_Output			(self, other, "DIA_Addon_Cord_YouAreRanger_weg_14_01"); //Non fare il furbo con me, ragazzino, o ti spezzo le ossa.
		Cord_SC_Dreist = TRUE;
	}
	else
	{
		B_DIA_Addon_Cord_YouAreRanger_FRESSE ();
	};
};

var int DIA_Addon_Cord_YouAreRanger_SCGotOffer;

func void DIA_Addon_Cord_YouAreRanger_kampf ()
{
	AI_Output			(other, self, "DIA_Addon_Cord_YouAreRanger_kampf_15_00"); //Insegnami a combattere.
	AI_Output			(self, other, "DIA_Addon_Cord_YouAreRanger_kampf_14_01"); //D'accordo. Cos'altro?
	Cord_RangerHelp_Fight = TRUE;

	if (DIA_Addon_Cord_YouAreRanger_SCGotOffer == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Cord_YouAreRanger, "Questo è tutto.", DIA_Addon_Cord_YouAreRanger_reicht );
		DIA_Addon_Cord_YouAreRanger_SCGotOffer = TRUE;
	};
};
func void DIA_Addon_Cord_YouAreRanger_SLDAufnahme ()
{
	AI_Output			(other, self, "DIA_Addon_Cord_YouAreRanger_SLDAufnahme_15_00"); //Potresti aiutarmi a farmi accettare dai mercenari.
	AI_Output			(self, other, "DIA_Addon_Cord_YouAreRanger_SLDAufnahme_14_01"); //(ride) Ah, ora capisco. E va bene. Ci proverò. Che altro?

	Cord_RangerHelp_GetSLD = TRUE;
	
	if (DIA_Addon_Cord_YouAreRanger_SCGotOffer == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Cord_YouAreRanger, "Questo è tutto.", DIA_Addon_Cord_YouAreRanger_reicht );
		DIA_Addon_Cord_YouAreRanger_SCGotOffer = TRUE;
	};
};
func void DIA_Addon_Cord_YouAreRanger_Gold ()
{
	AI_Output			(other, self, "DIA_Addon_Cord_YouAreRanger_Gold_15_00"); //Pagami per il mio silenzio.
	if (Cord_SC_Dreist == FALSE)
	{
		AI_Output			(self, other, "DIA_Addon_Cord_YouAreRanger_Gold_14_01"); //Ti piacerebbe, eh? Mi dispiace, ma non cederò al tuo ricatto, cocco.
		Cord_SC_Dreist = TRUE;
	}
	else
	{
		B_DIA_Addon_Cord_YouAreRanger_FRESSE ();
	};
};
func void DIA_Addon_Cord_YouAreRanger_nix ()
{
	AI_Output			(other, self, "DIA_Addon_Cord_YouAreRanger_nix_15_00"); //Non ho bisogno di nulla. Posso cavarmela da solo.
	AI_Output			(self, other, "DIA_Addon_Cord_YouAreRanger_nix_14_01"); //Come vuoi... Hai avuto la tua possibilità.
	B_DIA_Addon_Cord_YouAreRanger_WARN ();
	Info_ClearChoices	(DIA_Addon_Cord_YouAreRanger);
};
func void DIA_Addon_Cord_YouAreRanger_reicht ()
{
	AI_Output			(other, self, "DIA_Addon_Cord_YouAreRanger_reicht_15_00"); //Questo è tutto.
	AI_Output			(self, other, "DIA_Addon_Cord_YouAreRanger_reicht_14_01"); //Non sembra difficile.
	B_DIA_Addon_Cord_YouAreRanger_WARN ();
	Info_ClearChoices	(DIA_Addon_Cord_YouAreRanger);
};

///////////////////////////////////////////////////////////////////////
//	Info RangerHelp2GetSLD
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cord_RangerHelp2GetSLD		(C_INFO)
{
	npc		 = 	SLD_805_Cord;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Cord_RangerHelp2GetSLD_Condition;
	information	 = 	DIA_Addon_Cord_RangerHelp2GetSLD_Info;
	permanent	 = 	TRUE;

	description	 = 	"Aiutami a diventare mercenario.";
};
var int DIA_Addon_Cord_RangerHelp2GetSLD_NoPerm;
func int DIA_Addon_Cord_RangerHelp2GetSLD_Condition ()
{
	if (Cord_RangerHelp_GetSLD == TRUE)
	&& (hero.guild == GIL_NONE)
	&& (DIA_Addon_Cord_RangerHelp2GetSLD_NoPerm == FALSE)
		{
			return TRUE;
		};
};
func void B_Cord_RangerHelpObsolete ()
{
	AI_Output	(other, self, "DIA_Addon_Cord_RangerHelpObsolete_15_00"); //Consideralo già fatto.
	AI_Output	(self, other, "DIA_Addon_Cord_RangerHelpObsolete_14_01"); //Allora credo di non poterti aiutare.
	AI_Output	(other, self, "DIA_Addon_Cord_RangerHelpObsolete_15_02"); //Cosa vuoi dire?
	AI_Output	(self, other, "DIA_Addon_Cord_RangerHelpObsolete_14_03"); //Voglio dire che non posso aiutarti.
	AI_Output	(self, other, "DIA_Addon_Cord_RangerHelpObsolete_14_04"); //Non pretenderai mica che affronti ogni singolo mercenario per permetterti di unirti alla banda?
	AI_Output	(self, other, "DIA_Addon_Cord_RangerHelpObsolete_14_05"); //Dovrai farlo da solo.
	DIA_Addon_Cord_RangerHelp2GetSLD_NoPerm = TRUE;
	TOPIC_End_RangerHelpSLD = TRUE;
};
func void B_Cord_ComeLaterWhenDone ()
{
	AI_Output	(self, other, "DIA_Addon_Cord_ComeLaterWhenDone_14_00"); //Che aspetti? Occupati di questa faccenda e poi torna qui.
	AI_StopProcessInfos (self);
};
func void B_Cord_IDoItForYou ()
{
	AI_Output	(self, other, "DIA_Addon_Cord_IDoItForYou_14_00"); //Ah, sì. È facile. Ascolta. Torna domani. Prenderò la cura di quello.
	AI_Output	(self, other, "DIA_Addon_Cord_IDoItForYou_14_01"); //Ma dovrete farmi qualcosa per nel ritorno.
	AI_Output	(other, self, "DIA_Addon_Cord_IDoItForYou_15_02"); //E sarebbe?
	AI_Output	(self, other, "DIA_Addon_Cord_IDoItForYou_14_03"); //Sui monti a sudest, non lontano da qui, c'è un piccolo accampamento di briganti.
	AI_Output	(self, other, "DIA_Addon_Cord_IDoItForYou_14_04"); //Vai verso sud-est, e ben presto avvisterai la torre.
	AI_Output	(self, other, "DIA_Addon_Cord_IDoItForYou_14_05"); //Uno dei miei uomini, Patrick, è partito giorni fa per certi traffici con quella gentaglia.
	AI_Output	(self, other, "DIA_Addon_Cord_IDoItForYou_14_06"); //Io gliel'avevo detto, che era una pessima idea. Ma quell'idiota non mi ha dato retta.
	AI_Output	(self, other, "DIA_Addon_Cord_IDoItForYou_14_07"); //Presumo l'abbiano fatto fuori, ma non ne sono sicuro.
	AI_Output	(self, other, "DIA_Addon_Cord_IDoItForYou_14_08"); //Tocca a te scoprirlo.

	B_LogEntry (TOPIC_Addon_RangerHelpSLD,"Cord si occuperà della prova di Torlof. Il compagno di Cord, Patrick, è scomparso. Vuole che raggiunga il piccolo campo dei briganti sulla montagna a sudest e scopra se Patrick si trova là."); 

	
	Info_ClearChoices	(DIA_Addon_Cord_RangerHelp2GetSLD);	
	Info_AddChoice	(DIA_Addon_Cord_RangerHelp2GetSLD, "Scordatelo. È molto più difficile dell'incarico di Torlof.", B_Cord_IDoItForYou_mist );
	Info_AddChoice	(DIA_Addon_Cord_RangerHelp2GetSLD, "E cosa ti fa pensare che non facciano fuori anche ME?", B_Cord_IDoItForYou_Dexter );
		
	DIA_Addon_Cord_RangerHelp2GetSLD_NoPerm = TRUE;
};
func void B_Cord_IDoItForYou_mist ()
{
	AI_Output			(other, self, "Dia_Addon_Cord_IDoItForYou_mist_15_00"); //Scordatelo. È molto più difficile dell'incarico di Torlof.
	AI_Output			(self, other, "Dia_Addon_Cord_IDoItForYou_mist_14_01"); //Non necessariamente. Un tizio scialbo e insignificante come te non desterà sospetti.
	AI_Output			(self, other, "Dia_Addon_Cord_IDoItForYou_mist_14_02"); //E non posso occuparmene io. Quei tizi sparano a vista, sui mercenari.
};
func void B_Cord_IDoItForYou_Dexter ()
{
	AI_Output			(other, self, "Dia_Addon_Cord_IDoItForYou_Dexter_15_00"); //E cosa ti fa pensare che non facciano fuori anche ME?
	AI_Output			(self, other, "Dia_Addon_Cord_IDoItForYou_Dexter_14_01"); //Il fatto che io conosca il nome del loro capo. È Dexter. Non dovrai far altro che fingere di conoscerlo.
	AI_Output			(self, other, "Dia_Addon_Cord_IDoItForYou_Dexter_14_02"); //I suoi uomini ci penseranno due volte prima di tirarti il collo.
	AI_Output			(self, other, "Dia_Addon_Cord_IDoItForYou_Dexter_14_03"); //Naturalmente qualche rischio c'è sempre.
	AI_Output			(self, other, "Dia_Addon_Cord_IDoItForYou_Dexter_14_04"); //Ma ce la puoi fare.
	Info_ClearChoices	(DIA_Addon_Cord_RangerHelp2GetSLD);	
	
	B_LogEntry (TOPIC_Addon_RangerHelpSLD,"Il capo dei briganti si chiama Dexter."); 

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"Cord, il mercenario, sta cercando il suo compagno Patrick."); 
		
	MIS_Addon_Cord_Look4Patrick = LOG_RUNNING;
	Ranger_SCKnowsDexter = TRUE; 
};
func void DIA_Addon_Cord_RangerHelp2GetSLD_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cord_RangerHelp2GetSLD_15_00"); //Aiutami a diventare un mercenario.
	AI_Output	(self, other, "DIA_Addon_Cord_RangerHelp2GetSLD_14_01"); //Fammi pensare. Mmm... Senza l'approvazione di Torlof non hai molte chance di progredire.
	AI_Output	(self, other, "DIA_Addon_Cord_RangerHelp2GetSLD_14_02"); //Ne hai già parlato con Torlof?

	if (Torlof_Go == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Cord_RangerHelp2GetSLD_15_03"); //Non proprio.
		B_Cord_ComeLaterWhenDone ();
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Cord_RangerHelp2GetSLD_15_04"); //Sì. Mi ha detto della prova.
		AI_Output	(self, other, "DIA_Addon_Cord_RangerHelp2GetSLD_14_05"); //Ah. Di quale prova parli?
		
		if	(Torlof_ProbeBestanden == TRUE)
		|| ((MIS_Torlof_BengarMilizKlatschen == LOG_RUNNING)&& (Npc_IsDead (Rumbold))&& (Npc_IsDead (Rick)))
		|| ((MIS_Torlof_HolPachtVonSekob == LOG_RUNNING)&&((Sekob.aivar[AIV_DefeatedByPlayer] == TRUE)||(Npc_IsDead (Sekob))))
		{
			B_Cord_RangerHelpObsolete ();
		}		
		else if (Torlof_Probe == 0)
		{
			AI_Output	(other, self, "DIA_Addon_Cord_RangerHelp2GetSLD_15_06"); //Non ho ancora accettato.
			B_Cord_ComeLaterWhenDone ();
		}		
		else if (Torlof_Probe == Probe_Sekob)
		{
			AI_Output	(other, self, "DIA_Addon_Cord_RangerHelp2GetSLD_15_07"); //Dovrei riscuotere la pigione alla fattoria di Sekob.
			B_Cord_IDoItForYou ();
		}
		else if (Torlof_Probe == Probe_Bengar)
		{
			AI_Output	(other, self, "DIA_Addon_Cord_RangerHelp2GetSLD_15_08"); //Dovrei allontanare la milizia dalla fattoria di Bengar.
			B_Cord_IDoItForYou ();
		}
		else 
		{
			B_Cord_RangerHelpObsolete ();
		};
	};
};

///////////////////////////////////////////////////////////////////////
//	Info TalkedToDexter
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cord_TalkedToDexter		(C_INFO)
{
	npc		 = 	SLD_805_Cord;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cord_TalkedToDexter_Condition;
	information	 = 	DIA_Addon_Cord_TalkedToDexter_Info;

	description	 = 	"Sono andato da Dexter.";
};

func int DIA_Addon_Cord_TalkedToDexter_Condition ()
{
	if ((BDT_1060_Dexter.aivar[AIV_TalkedToPlayer] == TRUE)
	|| (Npc_IsDead(BDT_1060_Dexter)))
	&& (MIS_Addon_Cord_Look4Patrick == LOG_RUNNING)
		{
			return TRUE;
		};
};

func void DIA_Addon_Cord_TalkedToDexter_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cord_TalkedToDexter_15_00"); //Sono andato da Dexter.
	AI_Output	(self, other, "DIA_Addon_Cord_TalkedToDexter_14_01"); //E...?
	
	if (Npc_IsDead(BDT_1060_Dexter))
	{
		AI_Output	(other, self, "DIA_Addon_Cord_TalkedToDexter_15_02"); //Dexter è morto.
	};
	
	AI_Output	(other, self, "DIA_Addon_Cord_TalkedToDexter_15_03"); //Non ho trovato alcuna traccia del tuo amico Patrick.
	
	if (Dexter_KnowsPatrick == TRUE)
	{
		AI_Output	(other, self, "DIA_Addon_Cord_TalkedToDexter_15_04"); //Dexter si ricordava di lui, ma mi ha detto che è da tanto che non lo vede.
		AI_Output	(self, other, "DIA_Addon_Cord_TalkedToDexter_14_05"); //E sei sicuro che Dexter non ti abbia mentito?
		AI_Output	(other, self, "DIA_Addon_Cord_TalkedToDexter_15_06"); //No, affatto. Ma putroppo non posso dirti altro.
		
	};
	
	AI_Output	(self, other, "DIA_Addon_Cord_TalkedToDexter_14_07"); //Non capisco. Sembra che sia scomparso dalla faccia della terra.
	AI_Output	(self, other, "DIA_Addon_Cord_TalkedToDexter_14_08"); //Bene, hai rispettato i patti...

	MIS_Addon_Cord_Look4Patrick = LOG_SUCCESS;
	TOPIC_End_RangerHelpSLD = TRUE;
	B_GivePlayerXP (XP_Addon_Cord_Look4Patrick);

	AI_Output	(other, self, "DIA_Addon_Cord_TalkedToDexter_15_09"); //E che mi dici della prova di Torlof?
	AI_Output	(self, other, "DIA_Addon_Cord_TalkedToDexter_14_10"); //Non preoccuparti. Puoi tornare da Torlof. Hai completato l'incarico e hai superato la prova. Ti avevo detto che ci avrei pensato io.

	Cord_RangerHelp_TorlofsProbe = TRUE;

	if (Torlof_Probe == Probe_Sekob)
	{
		MIS_Torlof_HolPachtVonSekob = LOG_SUCCESS;
	}
	else if (Torlof_Probe == Probe_Bengar)
	{
		MIS_Torlof_BengarMilizKlatschen = LOG_SUCCESS;
	};
};

// ************************************************************
// 			  ReturnPatrick
// ************************************************************
INSTANCE DIA_Cord_ReturnPatrick   (C_INFO)
{
	npc         = SLD_805_Cord;
	nr          = 8;
	condition   = DIA_Cord_ReturnPatrick_Condition;
	information = DIA_Cord_ReturnPatrick_Info;
	permanent   = FALSE;
	description = "Patrick è tornato.";
};

FUNC INT DIA_Cord_ReturnPatrick_Condition()
{
	if (Npc_GetDistToWP (Patrick_NW, "NW_BIGFARM_PATRICK") <= 1000)
	&& (MissingPeopleReturnedHome == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cord_ReturnPatrick_Info()
{
	AI_Output (other, self, "DIA_Addon_Cord_ReturnPatrick_15_00"); //Patrick è tornato.
	AI_Output (self ,other, "DIA_Addon_Cord_ReturnPatrick_14_01"); //Già, amico. Quasi non ci speravo più. Tu...
	AI_Output (other, self, "DIA_Addon_Cord_ReturnPatrick_15_02"); //Ehi, fammi un favore.
	AI_Output (self ,other, "DIA_Addon_Cord_ReturnPatrick_14_03"); //Sì?
	AI_Output (other, self, "DIA_Addon_Cord_ReturnPatrick_15_04"); //Risparmiati i ringraziamenti.
	AI_Output (self ,other, "DIA_Addon_Cord_ReturnPatrick_14_05"); //Non avevo intenzione di ringraziarti.
	AI_Output (other, self, "DIA_Addon_Cord_ReturnPatrick_15_06"); //Ma... ?
	AI_Output (self ,other, "DIA_Addon_Cord_ReturnPatrick_14_07"); //(sorride) Volevo solo dirti che sei un demonietto sfacciato.
	AI_Output (self ,other, "DIA_Addon_Cord_ReturnPatrick_14_09"); //(sorride) Sta' calmo.
	
	B_GivePlayerXP (XP_Ambient);
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				ExplainSkills
// ************************************************************
INSTANCE DIA_Cord_ExplainSkills   (C_INFO)
{
	npc         = SLD_805_Cord;
	nr          = 1;
	condition   = DIA_Cord_ExplainSkills_Condition;
	information = DIA_Cord_ExplainSkills_Info;
	permanent   = FALSE;
	description = "Cosa dovrei apprendere prima, il combattimento a una o a due mani?";
};

FUNC INT DIA_Cord_ExplainSkills_Condition()
{
	if (Cord_Approved == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cord_ExplainSkills_Info()
{
	AI_Output (other, self, "DIA_Cord_ExplainSkills_15_00"); //Cosa dovrei apprendere prima, il combattimento a una o a due mani?
	AI_Output (self ,other, "DIA_Cord_ExplainSkills_14_01"); //Questi due tipi di arma sono abbastanza simili.
	AI_Output (self ,other, "DIA_Cord_ExplainSkills_14_02"); //Appena raggiungerai il livello successivo con un tipo di arma, migliorerai automaticamente anche l'altra.
	AI_Output (self ,other, "DIA_Cord_ExplainSkills_14_03"); //Per esempio, se sei bravo a combattere con le armi a una mano, ma sei ancora un principiante con quelle a due mani...
	AI_Output (self ,other, "DIA_Cord_ExplainSkills_14_04"); //...le tue abilità con le armi a due mani miglioreranno ogni volta che ti alleni con quelle a una mano sola.
	AI_Output (self ,other, "DIA_Cord_ExplainSkills_14_05"); //Se ti alleni solamente con un tipo di arma, troverai l'allenamento più faticoso.
	AI_Output (self ,other, "DIA_Cord_ExplainSkills_14_06"); //Se le alleni sempre entrambe, arriverai agli stessi risultati con meno sforzi.
	AI_Output (self ,other, "DIA_Cord_ExplainSkills_14_07"); //Alla fine, il risultato sarà lo stesso in entrambi i modi, è una tua scelta.
};
// ************************************************************
// 			  				ExplainWeapons
// ************************************************************
INSTANCE DIA_Cord_ExplainWeapons   (C_INFO)
{
	npc         = SLD_805_Cord;
	nr          = 2;
	condition   = DIA_Cord_ExplainWeapons_Condition;
	information = DIA_Cord_ExplainWeapons_Info;
	permanent   = FALSE;
	description = "Quali sono i vantaggi di un’arma a una o a due mani?";
};

FUNC INT DIA_Cord_ExplainWeapons_Condition()
{
	if (Cord_Approved == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Cord_ExplainWeapons_Info()
{
	AI_Output (other, self, "DIA_Cord_ExplainWeapons_15_00"); //Quali sono i vantaggi di un’arma a una o a due mani?
	AI_Output (self ,other, "DIA_Cord_ExplainWeapons_14_01"); //Buona domanda. Vedo che hai riflettuto abbastanza sull'argomento.
	AI_Output (self ,other, "DIA_Cord_ExplainWeapons_14_02"); //Le armi a una mano sono più veloci, ma anche più deboli.
	AI_Output (self ,other, "DIA_Cord_ExplainWeapons_14_03"); //Le armi a due mani infliggono più danni, ma non potrai colpire altrettanto velocemente.
	AI_Output (self ,other, "DIA_Cord_ExplainWeapons_14_04"); //Inoltre, avrai bisogno di più forza per brandire un'arma a due mani. Questo significa più allenamento.
	AI_Output (self ,other, "DIA_Cord_ExplainWeapons_14_05"); //L'unico modo di diventare veramente abile è metterci molto impegno.
};

// ******************************************************
//							Teach
// ******************************************************

var int Cord_Merke_1h;
var int Cord_Merke_2h;
// ------------------------------------------------------

INSTANCE DIA_Cord_Teach(C_INFO)
{
	npc			= SLD_805_Cord;
	nr			= 3;
	condition	= DIA_Cord_Teach_Condition;
	information	= DIA_Cord_Teach_Info;
	permanent	= TRUE;
	description = "Insegnami a combattere!";
};                       

FUNC INT DIA_Cord_Teach_Condition()
{
	return TRUE;
};

FUNC VOID B_Cord_Zeitverschwendung ()
{
	AI_Output (self ,other,"DIA_Cord_Teach_14_03"); //Non spreco il mio tempo con i principianti.
};

FUNC VOID DIA_Cord_Teach_Info()
{	
	AI_Output (other,self, "DIA_Cord_Teach_15_00"); //Insegnami a combattere!
	if (Cord_Approved == TRUE)
	|| (hero.guild == GIL_SLD)
	|| (hero.guild == GIL_DJG)
	|| (Cord_RangerHelp_Fight == TRUE)//ADDON
	{
		if ((Npc_GetTalentSkill(other, NPC_TALENT_1H) > 0)&&(Npc_GetTalentSkill(other, NPC_TALENT_2H) > 0))
		|| (Cord_RangerHelp_Fight == TRUE)//ADDON
		{
		
		
			AI_Output (self ,other,"DIA_Cord_Teach_14_01"); //Posso insegnarti a usare qualsiasi arma.
			Cord_Approved = TRUE;
		}
		else if  (Npc_GetTalentSkill(other, NPC_TALENT_1H) > 0)
		{
			AI_Output (self ,other,"DIA_Cord_Teach_14_02"); //Da dove vogliamo cominciare? Posso allenarti nell'uso delle spade a una mano, ma non sei ancora abbastanza abile per brandire una spada a due mani.
			B_Cord_Zeitverschwendung();
			Cord_Approved = TRUE;
		}
		else if (Npc_GetTalentSkill(other, NPC_TALENT_2H) > 0)
		{
			AI_Output (self ,other,"DIA_Cord_Teach_14_04"); //Per quanto riguarda le armi a una mano, sei un dannato principiante! Ma la tua abilità con le armi a due mani non è male.
			AI_Output (self ,other,"DIA_Cord_Teach_14_05"); //Sei hai bisogno di più esperienza con le armi a una mani, vai a cercare un altro insegnante.
			Cord_Approved = TRUE;
		}
		else
		{
			B_Cord_Zeitverschwendung();
			B_Cord_BeBetter ();
		};
		
		if (Cord_Approved == TRUE)
		{
			Info_ClearChoices (DIA_Cord_Teach);
			Info_AddChoice (DIA_Cord_Teach, DIALOG_BACK, DIA_Cord_Teach_Back);
		
			if (Npc_GetTalentSkill(other, NPC_TALENT_2H) > 0)
			|| (Cord_RangerHelp_Fight == TRUE)//ADDON
			{
				Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn2h1 , B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))	,DIA_Cord_Teach_2H_1);
				Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn2h5 , B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)),DIA_Cord_Teach_2H_5);
			};
		
			if (Npc_GetTalentSkill(other, NPC_TALENT_1H) > 0)
			|| (Cord_RangerHelp_Fight == TRUE)//ADDON
			{
				Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))  , DIA_Cord_Teach_1H_1);
				Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn1h5 , B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), DIA_Cord_Teach_1H_5);
			};
		
			Cord_Merke_1h = other.HitChance[NPC_TALENT_1H];
			Cord_Merke_2h = other.HitChance[NPC_TALENT_2H];
		};	
	}
	else 
	{
		AI_Output (self ,other,"DIA_Cord_Teach_14_06"); //Alleno solamente i mercenari o dei candidati meritevoli!
	};
};

FUNC VOID DIA_Cord_Teach_Back ()
{
	if (Cord_Merke_1h < other.HitChance[NPC_TALENT_1H])
	|| (Cord_Merke_2h < other.HitChance[NPC_TALENT_2H])
	{
		AI_Output (self ,other,"DIA_Cord_Teach_BACK_14_00"); //Sei già migliorato, continua così!
	};
	
	Info_ClearChoices (DIA_Cord_Teach);
};

FUNC VOID DIA_Cord_Teach_2H_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, 90);
	
	Info_ClearChoices (DIA_Cord_Teach);
	Info_AddChoice (DIA_Cord_Teach, DIALOG_BACK, DIA_Cord_Teach_Back);
	
	if (Npc_GetTalentSkill(other, NPC_TALENT_2H) > 0)
	{
		Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn2h1 , B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))	,DIA_Cord_Teach_2H_1);
		Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn2h5 , B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)),DIA_Cord_Teach_2H_5);
	};
	
	if (Npc_GetTalentSkill(other, NPC_TALENT_1H) > 0)
	{
		Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn1h1 , B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))  , DIA_Cord_Teach_1H_1);
		Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn1h5 , B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), DIA_Cord_Teach_1H_5);
	};
};

FUNC VOID DIA_Cord_Teach_2H_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 5, 90);
	
	Info_ClearChoices (DIA_Cord_Teach);
	Info_AddChoice (DIA_Cord_Teach, DIALOG_BACK, DIA_Cord_Teach_Back);
	
	if (Npc_GetTalentSkill(other, NPC_TALENT_2H) > 0)
	{
		Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))	,DIA_Cord_Teach_2H_1);
		Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn2h5 , B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)),DIA_Cord_Teach_2H_5);
	};
	
	if (Npc_GetTalentSkill(other, NPC_TALENT_1H) > 0)
	{
		Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn1h1 , B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))  , DIA_Cord_Teach_1H_1);
		Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn1h5 , B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), DIA_Cord_Teach_1H_5);
	};
};

FUNC VOID DIA_Cord_Teach_1H_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 1, 90);
	
	Info_ClearChoices (DIA_Cord_Teach);
	Info_AddChoice (DIA_Cord_Teach, DIALOG_BACK, DIA_Cord_Teach_Back);
	
	if (Npc_GetTalentSkill(other, NPC_TALENT_2H) > 0)
	{
		Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn2h1 , B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))	,DIA_Cord_Teach_2H_1);
		Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn2h5 , B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)),DIA_Cord_Teach_2H_5);
	};
	
	if (Npc_GetTalentSkill(other, NPC_TALENT_1H) > 0)
	{
		Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn1h1 , B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))  , DIA_Cord_Teach_1H_1);
		Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn1h5 , B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), DIA_Cord_Teach_1H_5);
	};
};

FUNC VOID DIA_Cord_Teach_1H_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 5, 90);
	
	Info_ClearChoices (DIA_Cord_Teach);
	Info_AddChoice (DIA_Cord_Teach, DIALOG_BACK, DIA_Cord_Teach_Back);
	
	if (Npc_GetTalentSkill(other, NPC_TALENT_2H) > 0)
	{
		Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))	,DIA_Cord_Teach_2H_1);
		Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn2h5 , B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)),DIA_Cord_Teach_2H_5);
	};
	
	if (Npc_GetTalentSkill(other, NPC_TALENT_1H) > 0)
	{
		Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn1h1 , B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))  , DIA_Cord_Teach_1H_1);
		Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn1h5 , B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), DIA_Cord_Teach_1H_5);
	};
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Cord_PICKPOCKET (C_INFO)
{
	npc			= SLD_805_Cord;
	nr			= 900;
	condition	= DIA_Cord_PICKPOCKET_Condition;
	information	= DIA_Cord_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Cord_PICKPOCKET_Condition()
{
	C_Beklauen (65, 75);
};
 
FUNC VOID DIA_Cord_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Cord_PICKPOCKET);
	Info_AddChoice		(DIA_Cord_PICKPOCKET, DIALOG_BACK 		,DIA_Cord_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Cord_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Cord_PICKPOCKET_DoIt);
};

func void DIA_Cord_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Cord_PICKPOCKET);
};
	
func void DIA_Cord_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Cord_PICKPOCKET);
};












