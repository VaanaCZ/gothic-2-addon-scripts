// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Thorben_EXIT(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 999;
	condition	= DIA_Thorben_EXIT_Condition;
	information	= DIA_Thorben_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Thorben_EXIT_Condition()
{
		return TRUE;
};
FUNC VOID DIA_Thorben_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Thorben_PICKPOCKET (C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 900;
	condition	= DIA_Thorben_PICKPOCKET_Condition;
	information	= DIA_Thorben_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Thorben_PICKPOCKET_Condition()
{
	C_Beklauen (30, 28);
};
 
FUNC VOID DIA_Thorben_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Thorben_PICKPOCKET);
	Info_AddChoice		(DIA_Thorben_PICKPOCKET, DIALOG_BACK 		,DIA_Thorben_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Thorben_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Thorben_PICKPOCKET_DoIt);
};

func void DIA_Thorben_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Thorben_PICKPOCKET);
};
	
func void DIA_Thorben_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Thorben_PICKPOCKET);
};

// ************************************************************
// 		NEWS - Gritta ist tot Thorben ist angepisst
// ************************************************************
INSTANCE DIA_Thorben_angepisst(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 1;
	condition	= DIA_Thorben_angepisst_Condition;
	information	= DIA_Thorben_angepisst_Info;
	permanent	= TRUE;
	important   = TRUE; 
};                       
FUNC INT DIA_Thorben_angepisst_Condition()
{	
	if (Npc_IsDead (Gritta))
	&& (Npc_IsInState (self, ZS_Talk))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_angepisst_Info()
{	
	AI_Output (self, other,"DIA_Thorben_angepisst_06_00"); //Hai assassinato la mia Gritta. Non ti perdonerò mai. Via dalla mia vista, assassino!
	AI_StopProcessInfos (self);
};

// ************************************************************
// 		Hallo
// ************************************************************
INSTANCE DIA_Thorben_Hallo(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_Hallo_Condition;
	information	= DIA_Thorben_Hallo_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Thorben_Hallo_Condition()
{	
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Hallo_Info()
{	
	AI_Output (self, other,"DIA_Thorben_Hallo_06_00"); //Ah, una faccia nuova. Non sei di Khorinis, vero?
	AI_Output (self, other,"DIA_Thorben_Hallo_06_01"); //Questi non sono bei tempi per i viaggiatori. I briganti sono dappertutto e ora i contadini sono insorti.
	AI_Output (self, other,"DIA_Thorben_Hallo_06_02"); //Quali venti ti portano da queste parti?
};

// ************************************************************
// 		Suche Arbeit			//E1
// ************************************************************
INSTANCE DIA_Thorben_Arbeit(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_Arbeit_Condition;
	information	= DIA_Thorben_Arbeit_Info;
	permanent	= FALSE;
	description = "Sto cercando lavoro.";
};                       
FUNC INT DIA_Thorben_Arbeit_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Thorben_Arbeit_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Arbeit_15_00"); //Sto cercando lavoro.
	AI_Output (self, other,"DIA_Thorben_Arbeit_06_01"); //Sai qualcosa sul lavoro di carpenteria?
	AI_Output (other, self,"DIA_Thorben_Arbeit_15_02"); //L'unica cosa che posso ottenere dal legno è del fuoco.
	AI_Output (self, other,"DIA_Thorben_Arbeit_06_03"); //E a proposito di serrature che mi dici?
	AI_Output (other, self,"DIA_Thorben_Arbeit_15_04"); //Beh...
	AI_Output (self, other,"DIA_Thorben_Arbeit_06_05"); //Mi dispiace, ma non mi sei di nessun aiuto se non conosci nulla del mio lavoro...
	AI_Output (self, other,"DIA_Thorben_Arbeit_06_06"); //E non ho soldi per pagare un apprendista.
	
	Log_CreateTopic (TOPIC_Lehrling,LOG_MISSION); 
	Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
	B_LogEntry (TOPIC_Lehrling, "Thorben non mi prenderà come suo apprendista.");
};

// ************************************************************
// 		Bei anderem Meister		(MIS Blessings)	//E2
// ************************************************************
INSTANCE DIA_Thorben_OtherMasters(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_OtherMasters_Condition;
	information	= DIA_Thorben_OtherMasters_Info;
	permanent	= FALSE;
	description = "E se volessi iniziare un apprendistato con uno degli altri maestri?";
};                       
FUNC INT DIA_Thorben_OtherMasters_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Thorben_Arbeit))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_OtherMasters_Info()
{	
	AI_Output (other, self,"DIA_Thorben_OtherMasters_15_00"); //E se volessi iniziare un apprendistato con uno degli altri maestri?
	AI_Output (self, other,"DIA_Thorben_OtherMasters_06_01"); //Va bene, ti darò la mia approvazione.
	AI_Output (self, other,"DIA_Thorben_OtherMasters_06_02"); //Ma prima faresti meglio a ricevere la benedizione degli dei.
	AI_Output (self, other,"DIA_Thorben_OtherMasters_06_03"); //Dimmi, sei un uomo di fede?
	
	Info_ClearChoices (DIA_Thorben_OtherMasters);
	if (other.guild != GIL_KDF)
	&& (other.guild != GIL_NOV)
	&& (other.guild != GIL_PAL)
	{
		Info_AddChoice (DIA_Thorben_OtherMasters, "Beh, intendi se dico regolarmente le mie preghiere... ?", DIA_Thorben_OtherMasters_Naja);
	};
	Info_AddChoice (DIA_Thorben_OtherMasters, "Sì. Un umilissimo servo, maestro Thorben.", DIA_Thorben_OtherMasters_Devoutly);
};

func void B_Thorben_GetBlessings()
{
	AI_Output (self, other,"B_Thorben_GetBlessings_06_00"); //Allora vai a parlare con Vatras, il sacerdote di Adanos, e fatti dare la sua benedizione.
	if (other.guild != GIL_KDF)
	&& (other.guild != GIL_NOV)
	&& (other.guild != GIL_PAL)
	{
		AI_Output (self, other,"B_Thorben_GetBlessings_06_01"); //Ti dirà dove puoi trovare un sacerdote di Innos. Dovresti ottenere anche la sua benedizione.
	};
	AI_Output (self, other,"B_Thorben_GetBlessings_06_02"); //Una volta ricevuta la benedizione degli dei, voterò per te.
	
	MIS_Thorben_GetBlessings = LOG_RUNNING;
	
	Log_CreateTopic(TOPIC_Thorben,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Thorben,LOG_RUNNING);
	B_LogEntry (TOPIC_Thorben,"Thorben darà la sua approvazione se un prete di Adanos e un prete di Innos mi daranno la loro benedizione.");
};

func void DIA_Thorben_OtherMasters_Devoutly()
{
	AI_Output (other, self,"DIA_Thorben_OtherMasters_Devoutly_15_00"); //Sì. Un umilissimo servo, maestro Thorben.
	B_Thorben_GetBlessings();
	
	Info_ClearChoices (DIA_Thorben_OtherMasters);
};

func void DIA_Thorben_OtherMasters_Naja()
{
	AI_Output (other, self,"DIA_Thorben_OtherMasters_Naja_15_00"); //Beh, intendi se dico regolarmente le mie preghiere...?
	AI_Output (self, other,"DIA_Thorben_OtherMasters_Naja_06_01"); //Capisco!
	AI_Output (self, other,"DIA_Thorben_OtherMasters_Naja_06_02"); //Un uomo che esercita commercio senza la benedizione degli dei non riceverà mai la mia approvazione.
	AI_Output (self, other,"DIA_Thorben_OtherMasters_Naja_06_03"); //Chiedi agli dei la remissione dei tuoi peccati.
	B_Thorben_GetBlessings();
	
	Info_ClearChoices (DIA_Thorben_OtherMasters);
};

// ************************************************************
// 		ZUSTIMMUNG		//E3  (PERM)
// ************************************************************
INSTANCE DIA_Thorben_ZUSTIMMUNG(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 1;
	condition	= DIA_Thorben_ZUSTIMMUNG_Condition;
	information	= DIA_Thorben_ZUSTIMMUNG_Info;
	permanent	= TRUE;
	description = "E la tua approvazione, maestro?";
};                       
FUNC INT DIA_Thorben_ZUSTIMMUNG_Condition()
{	
	if (Player_IsApprentice == APP_NONE)
	&& (MIS_Thorben_GetBlessings == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_ZUSTIMMUNG_Info()
{	
	AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_00"); //E la tua approvazione, maestro?
	AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_01"); //Vatras ti ha dato la sua benedizione?
	
	if (Vatras_Segen == TRUE)
	{
		AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_02"); //Sì.
		AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_03"); //E hai ricevuto anche la benedizione del sacerdote di Innos?
		
		if (Daron_Segen == TRUE)
		|| (Isgaroth_Segen == TRUE)
		|| (other.guild == GIL_KDF)
		{
			AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_04"); //Sì, l'ho fatto.
			AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_05"); //Allora puoi avere anche la mia benedizione. Non importa quale strada deciderai di percorrere, sii fiero di fare un buon lavoro, ragazzo mio!
			
			MIS_Thorben_GetBlessings = LOG_SUCCESS;
			B_GivePlayerXP (XP_Zustimmung);
			
			Log_CreateTopic (TOPIC_Lehrling,LOG_MISSION);
			Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
			B_LogEntry (TOPIC_Lehrling,"Thorben darà la sua approvazione qualora dovessi fare l'apprendista da qualche parte.");
		}
		else
		{
			AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_06"); //No. Non ancora...
			AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_07"); //Ricorda quello che ti ho detto. Potrai avviare la tua attività commerciale solamente con la benedizione degli dei.
		};
	}
	else
	{
		AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_08"); //Non ancora...
		AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_09"); //Allora non capisco perché continui a chiedermelo. Conosci i miei termini.
	};
};

// ************************************************************
// 		Was weißt du über Schlösser?		//E2
// ************************************************************
INSTANCE DIA_Thorben_Locksmith(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_Locksmith_Condition;
	information	= DIA_Thorben_Locksmith_Info;
	permanent	= FALSE;
	description = "Allora, te ne intendi di serrature?";
};                       
FUNC INT DIA_Thorben_Locksmith_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Thorben_Arbeit))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Locksmith_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Locksmith_15_00"); //Allora, te ne intendi di serrature?
	AI_Output (self, other,"DIA_Thorben_Locksmith_06_01"); //Che cos'è un buon forziere senza una buona serratura?
	AI_Output (self, other,"DIA_Thorben_Locksmith_06_02"); //Faccio da solo le mie serrature, in questo modo posso essere sicuro che non ho fabbricato i miei forzieri così massicci per nulla...
	AI_Output (self, other,"DIA_Thorben_Locksmith_06_03"); //Una serratura realizzata malamente è facile da rompere. E ci sono un sacco di ladri in giro per Khorinis, specialmente negli ultimi tempi!
};

// ************************************************************
// 		Schuldenbuch
// ************************************************************
INSTANCE DIA_Thorben_Schuldenbuch(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_Schuldenbuch_Condition;
	information	= DIA_Thorben_Schuldenbuch_Info;
	permanent	= FALSE;
	description = "Ho il libro mastro di Lehmar proprio qui.";
};                       
FUNC INT DIA_Thorben_Schuldenbuch_Condition()
{	
	if (Npc_HasItems (other, ItWr_Schuldenbuch) > 0)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Schuldenbuch_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Schuldenbuch_15_00"); //Ho il libro mastro di Lehmar proprio qui.
	AI_Output (self, other,"DIA_Thorben_Schuldenbuch_06_01"); //(sospettoso) Dove l'hai preso?
	AI_Output (other, self,"DIA_Thorben_Schuldenbuch_15_02"); //Non dovrebbe interessarti molto per quanto il tuo nome sia all'interno.
	AI_Output (self, other,"DIA_Thorben_Schuldenbuch_06_03"); //Dammelo!
	B_GiveInvItems (other, self, ItWr_Schuldenbuch, 1);
	AI_Output (other, self,"DIA_Thorben_Schuldenbuch_15_04"); //Che cosa mi darai in cambio?
	AI_Output (self, other,"DIA_Thorben_Schuldenbuch_06_05"); //Non ho soldi da spendere e posso solamente offrirti la mia gratitudine di cuore.
	B_GivePlayerXP (XP_Schuldenbuch);
};

// ************************************************************
// 		Kann ich Schlösser knacken lernen		//E3
// ************************************************************
INSTANCE DIA_Thorben_PleaseTeach(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_PleaseTeach_Condition;
	information	= DIA_Thorben_PleaseTeach_Info;
	permanent	= TRUE;
	description = "Puoi insegnarmi a scassinare le serrature?";
};                       
FUNC INT DIA_Thorben_PleaseTeach_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Thorben_Locksmith))
	&& (Thorben_TeachPlayer == FALSE)
	&& (Npc_GetTalentSkill (other, NPC_TALENT_PICKLOCK) == 0)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_PleaseTeach_Info()
{	
	AI_Output (other, self,"DIA_Thorben_PleaseTeach_15_00"); //Puoi insegnarmi a scassinare le serrature?
		
	if (Npc_HasItems (self, ItWr_Schuldenbuch) > 0)
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_01"); //Se non fosse stato per te, starei pagando Lehmar per il resto della mia vita.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_02"); //Ti insegnerò ciò che vuoi sapere.
		Thorben_TeachPlayer = TRUE;
	}
	else if (Thorben_GotGold == TRUE) //100 Gold bekommen
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_03"); //Mi hai portato i 100 pezzi d'oro, è stato molto garbato da parte tua.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_04"); //Sono quasi imbarazzato, ma devo chiedertene di più.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_05"); //Se non mi sdebito con Lehmar al più presto, manderà i suoi scagnozzi a prendermi.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_06"); //Dammi altri 100 pezzi d'oro e ti istruirò.

		Info_ClearChoices (DIA_Thorben_PleaseTeach);
		Info_AddChoice (DIA_Thorben_PleaseTeach, "Quanto vuoi?", DIA_Thorben_PleaseTeach_Later);
		Info_AddChoice (DIA_Thorben_PleaseTeach, "Bene. Ecco 100 monete d’oro.", DIA_Thorben_PleaseTeach_Pay100);
	}
	else if (MIS_Matteo_Gold == LOG_SUCCESS) //Grittas Schulden bezahlt
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_07"); //Hai saldato il debito di Gritta con Matteo. Sembri una brava persona, ti insegnerò ciò che vuoi sapere.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_08"); //In ogni caso, non posso farlo gratis. Ho ancora montagne di debiti da pagare e mi servono soldi.
		AI_Output (other, self,"DIA_Thorben_PleaseTeach_15_09"); //Quanto vuoi?
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_10"); //200 pezzi d’oro.
		
		Info_ClearChoices (DIA_Thorben_PleaseTeach);
		Info_AddChoice (DIA_Thorben_PleaseTeach, "Quanto vuoi?", DIA_Thorben_PleaseTeach_Later);
		Info_AddChoice (DIA_Thorben_PleaseTeach, "Bene. Ecco 200 monete d’oro.", DIA_Thorben_PleaseTeach_Pay200);
	}
	else
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_11"); //Mmmh... Non so se posso fidarmi di te o no.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_12"); //Per quel che ne so potresti essere uno di quei perdigiorno che vengono in città solamente per svuotare le tasche della gente onesta.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_13"); //Non ti insegnerò nulla almeno finché non mi dimostrerai di essere un tipo onesto.
	};
};

func void DIA_Thorben_PleaseTeach_Pay200()
{
	AI_Output (other, self,"DIA_Thorben_PleaseTeach_Pay200_15_00"); //Bene. Ecco 200 monete d’oro.
	
	if (B_GiveInvItems (other, self, ItMi_Gold, 200))
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_Pay200_06_01"); //Questi soldi mi aiuteranno parecchio. Possiamo cominciare quando vuoi.
		Thorben_TeachPlayer = TRUE;
	}
	else
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_Pay200_06_02"); //Ti mancano ancora alcune monete per arrivare a 200. Mi serve quel denaro.
	};
	
	Info_ClearChoices (DIA_Thorben_PleaseTeach);
};

func void DIA_Thorben_PleaseTeach_Pay100()
{	
	AI_Output (other, self,"DIA_Thorben_PleaseTeach_Pay100_15_00"); //Bene. Ecco 100 monete d’oro.
		
	if (B_GiveInvItems (other, self, ItMi_Gold, 100))
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_Pay100_06_01"); //In questo caso, possiamo cominciare quando vuoi.
		Thorben_TeachPlayer = TRUE;
	}
	else
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_Pay100_06_02"); //Ehi, ti mancano ancora alcune monete per arrivare a 100,
	};
	
	Info_ClearChoices (DIA_Thorben_PleaseTeach);
};
	
func void DIA_Thorben_PleaseTeach_Later()
{	
	AI_Output (other, self,"DIA_Thorben_PleaseTeach_Later_15_00"); //Forse più tardi...

	Info_ClearChoices (DIA_Thorben_PleaseTeach);
};

// ************************************************************
// 		Schlösser knacken lernen		//E4
// ************************************************************
INSTANCE DIA_Thorben_Teach(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_Teach_Condition;
	information	= DIA_Thorben_Teach_Info;
	permanent	= TRUE;
	description = B_BuildLearnString("Insegnami a forzare le serratura.", B_GetLearnCostTalent(other, NPC_TALENT_PICKLOCK, 1));
};                       
FUNC INT DIA_Thorben_Teach_Condition()
{	
	if (Thorben_TeachPlayer == TRUE)
	&& (Npc_GetTalentSkill (other, NPC_TALENT_PICKLOCK) == 0)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Teach_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Teach_15_00"); //Insegnami a scassinare una serratura.
	
	if B_TeachThiefTalent (self, other, NPC_TALENT_PICKLOCK)
	{
		AI_Output (self, other,"DIA_Thorben_Teach_06_01"); //Tutto ciò di cui hai bisogno è un grimaldello: se lo muovi con cautela da destra a sinistra nella serratura, puoi sbloccare il meccanismo.
		AI_Output (self, other,"DIA_Thorben_Teach_06_02"); //Ma se lo muovi troppo velocemente e nella direzione sbagliata, puoi rompere tutto.
		AI_Output (self, other,"DIA_Thorben_Teach_06_03"); //Più diventi abile, meno grimaldelli ti serviranno per aprire una serratura. Questo è tutto quello che c'è da sapere, davvero.
	};
};

// ************************************************************
// 		TRADE (PERM)
// ************************************************************
INSTANCE DIA_Thorben_TRADE(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 3;
	condition	= DIA_Thorben_TRADE_Condition;
	information	= DIA_Thorben_TRADE_Info;
	permanent	= TRUE;
	description = "Puoi vendermi dei grimaldelli?";
	trade		= TRUE;
};                       
FUNC INT DIA_Thorben_TRADE_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Thorben_Locksmith))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_TRADE_Info()
{	
	AI_Output (other, self,"DIA_Thorben_TRADE_15_00"); //Puoi vendermi qualche grimaldello?
	
	if (Npc_GetTalentSkill (other, NPC_TALENT_PICKLOCK) > 0)
	{
		AI_Output (self, other,"DIA_Thorben_TRADE_06_01"); //Se me ne sono avanzati...
	}
	else
	{
		AI_Output (self, other,"DIA_Thorben_TRADE_06_02"); //Bene, ma non ti saranno di nessun aiuto finché non saprai come usarli.
	};
	
	if (Npc_HasItems (self, ITke_Lockpick) == 0) 
	&& (Kapitel > Dietrichgeben) 
	{
		CreateInvItems (self, ITKE_LOCKPICK,5);
		Dietrichgeben = Dietrichgeben +1;
	};
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Thorben, il carpentiere, vende grimaldelli."); 
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Thorben_MissingPeople		(C_INFO)
{
	npc		 = 	VLK_462_Thorben;
	nr		 = 	4;
	condition	 = 	DIA_Addon_Thorben_MissingPeople_Condition;
	information	 = 	DIA_Addon_Thorben_MissingPeople_Info;

	description	 = 	"Hai già avuto un apprendista?";
};

func int DIA_Addon_Thorben_MissingPeople_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Thorben_Arbeit))
	&& (SC_HearedAboutMissingPeople == TRUE)
	&& (Elvrich_GoesBack2Thorben == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Thorben_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Thorben_MissingPeople_15_00"); //Hai già avuto un apprendista?
	AI_Output	(self, other, "DIA_Addon_Thorben_MissingPeople_06_01"); //Sì, e non molto tempo fa.
	AI_Output	(other, self, "DIA_Addon_Thorben_MissingPeople_15_02"); //E...? Cosa è successo?
	AI_Output	(self, other, "DIA_Addon_Thorben_MissingPeople_06_03"); //Si chiama Elvrich, ed è mio nipote.
	AI_Output	(self, other, "DIA_Addon_Thorben_MissingPeople_06_04"); //Ero molto contento di lui, in verità, ma un giorno non si è presentato al lavoro.
	
	MIS_Thorben_BringElvrichBack = LOG_RUNNING;

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"Elvrich, l'apprendista del carpentiere Thorben, è scomparso."); 
	
	Info_ClearChoices	(DIA_Addon_Thorben_MissingPeople);
	Info_AddChoice	(DIA_Addon_Thorben_MissingPeople, DIALOG_BACK, DIA_Addon_Thorben_MissingPeople_Back );
	Info_AddChoice	(DIA_Addon_Thorben_MissingPeople, "Hai denunciato il fatto alla milizia?", DIA_Addon_Thorben_MissingPeople_Mil );
	Info_AddChoice	(DIA_Addon_Thorben_MissingPeople, "Quand'è stata l'ultima volta che l'hai visto?", DIA_Addon_Thorben_MissingPeople_wann );
	Info_AddChoice	(DIA_Addon_Thorben_MissingPeople, "Dov'è Elvrich adesso?", DIA_Addon_Thorben_MissingPeople_where );
};

func void DIA_Addon_Thorben_MissingPeople_Back ()
{
	Info_ClearChoices	(DIA_Addon_Thorben_MissingPeople);
};

func void DIA_Addon_Thorben_MissingPeople_wann ()
{
	AI_Output			(other, self, "DIA_Addon_Thorben_MissingPeople_wann_15_00"); //Quand'è stata l'ultima volta che l'hai visto?
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_wann_06_01"); //Saranno state due settimane fa.
};

func void DIA_Addon_Thorben_MissingPeople_where ()
{
	AI_Output			(other, self, "DIA_Addon_Thorben_MissingPeople_where_15_00"); //Dov'è Elvrich adesso?
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_where_06_01"); //E come faccio a saperlo? Bazzicava quello schifoso bordello giù al porto.
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_where_06_02"); //Non mi stupirei se fosse ancora lì a scaldare il letto di qualche donnaccia.
};

func void DIA_Addon_Thorben_MissingPeople_Mil ()
{
	AI_Output			(other, self, "DIA_Addon_Thorben_MissingPeople_Mil_15_00"); //Hai denunciato il fatto alla milizia?
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_Mil_06_01"); //Certo. Gli ho detto di trovare quel fannullone e costringerlo a tornare al lavoro. Ma mi pento di averlo fatto.
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_Mil_06_02"); //Faccia pure quel che vuole. Prima o poi si renderà conto che senza un lavoro decente non farà strada, a Khorinis.
	AI_Output			(other, self, "DIA_Addon_Thorben_MissingPeople_Mil_15_03"); //(cinico) Davvero?
};

///////////////////////////////////////////////////////////////////////
//	Info ElvrichIsBack
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Thorben_ElvrichIsBack		(C_INFO)
{
	npc		 = 	VLK_462_Thorben;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Thorben_ElvrichIsBack_Condition;
	information	 = 	DIA_Addon_Thorben_ElvrichIsBack_Info;

	description	 = 	"Da oggi Elvrich riprenderà a lavorare per te.";
};

func int DIA_Addon_Thorben_ElvrichIsBack_Condition ()
{
	if (Elvrich_GoesBack2Thorben == TRUE)
	&& ((Npc_IsDead(Elvrich)) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorben_ElvrichIsBack_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Thorben_ElvrichIsBack_15_00"); //Da oggi Elvrich riprenderà a lavorare per te.
	AI_Output	(self, other, "DIA_Addon_Thorben_ElvrichIsBack_06_01"); //Spero solo che non scompaia di nuovo la prossima volta che una sgualdrina gli fa gli occhi dolci.
	AI_Output	(self, other, "DIA_Addon_Thorben_ElvrichIsBack_06_02"); //Prendi quest'oro per avermi riportato il mio apprendista.
	CreateInvItems (self, ItMi_Gold, 200);									
	B_GiveInvItems (self, other, ItMi_Gold, 200);
	MIS_Thorben_BringElvrichBack = LOG_SUCCESS;
	VLK_4302_Addon_Elvrich.flags = 0;
};

// ************************************************************
// 		Paladine		//E1
// ************************************************************
INSTANCE DIA_Thorben_Paladine(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 4;
	condition	= DIA_Thorben_Paladine_Condition;
	information	= DIA_Thorben_Paladine_Info;
	permanent	= FALSE;
	description = "Cosa sai sui paladini?";
};                       
FUNC INT DIA_Thorben_Paladine_Condition()
{	
	if (other.guild != GIL_PAL)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Thorben_Paladine_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Paladine_15_00"); //Cosa sai sui paladini?
	AI_Output (self, other,"DIA_Thorben_Paladine_06_01"); //Non molto. Sono arrivati via mare due settimane fa dal continente.
	AI_Output (self, other,"DIA_Thorben_Paladine_06_02"); //Da allora, si sono ritirati nella parte alta della città.
	AI_Output (self, other,"DIA_Thorben_Paladine_06_03"); //Nessuno sa esattamente perché siano venuti qui.
	AI_Output (self, other,"DIA_Thorben_Paladine_06_04"); //Molti sono spaventati da un attacco degli orchi.
	AI_Output (self, other,"DIA_Thorben_Paladine_06_05"); //Suppongo, tuttavia, che siano qui per sedare la rivolta dei contadini!
};

// ************************************************************
// 		Bauernaufstand		//E2
// ************************************************************
INSTANCE DIA_Thorben_Bauernaufstand(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 4;
	condition	= DIA_Thorben_Bauernaufstand_Condition;
	information	= DIA_Thorben_Bauernaufstand_Info;
	permanent	= FALSE;
	description = "Sai qualcosa sulla ribellione contadina?";
};                       
FUNC INT DIA_Thorben_Bauernaufstand_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Thorben_Paladine))
	&& (other.guild != GIL_SLD)
	&& (other.guild != GIL_DJG)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Bauernaufstand_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Bauernaufstand_15_00"); //Sai qualcosa sulla ribellione contadina?
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_01"); //Girano voci che Onar, il proprietario terriero, abbia assoldato dei mercenari per tenere lontane le truppe del Re.
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_02"); //Probabilmente era stanco di vedere i suoi raccolti e il suo bestiame dati a paladini e all'esercito.
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_03"); //Tutto ciò aumenta in continuazione i prezzi del cibo in città.
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_04"); //La fattoria di Onar è a est di qui. Non sapremmo dire se ci sono dei combattimenti in corso.
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_05"); //Se vuoi saperne di più, chiedi ai commercianti al mercato. Girano per l'isola sicuramente più di quanto non lo faccia io.
};

// ************************************************************
// 		Gritta
// ************************************************************
INSTANCE DIA_Thorben_Gritta(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 5;
	condition	= DIA_Thorben_Gritta_Condition;
	information	= DIA_Thorben_Gritta_Info;
	permanent	= FALSE;
	description = "Sono qui per Gritta...";
};                       
FUNC INT DIA_Thorben_Gritta_Condition()
{	
	if (MIS_Matteo_Gold == LOG_RUNNING)
	&& (!Npc_IsDead (Gritta))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Gritta_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Gritta_15_00"); //Sono qui per Gritta...
	AI_Output (self, other,"DIA_Thorben_Gritta_06_01"); //Mia nipote? Che problemi hai con lei? Non si tratta di soldi, vero?
	AI_Output (other, self,"DIA_Thorben_Gritta_15_02"); //Deve 100 pezzi d'oro al mercante Matteo.
	
	AI_Output (self, other,"DIA_Thorben_Gritta_06_03"); //Dimmi che non è vero. Da quando si è trasferita qui non ha fatto altro che crearmi problemi!
	AI_Output (self, other,"DIA_Thorben_Gritta_06_04"); //Praticamente è in debito con tutti i mercanti della città.
	AI_Output (self, other,"DIA_Thorben_Gritta_06_05"); //Ho dovuto farmi prestare 200 pezzi d'oro da quello strozzino di Lehmar per pagare i suoi debiti! E adesso questo!
	if (Npc_GetDistToWP(self, "NW_CITY_MERCHANT_SHOP01_FRONT_01") < 500)
	{
		AI_Output (self, other,"DIA_Thorben_Gritta_06_06"); //Gritta dovrebbe essere in casa.
	};
	AI_Output (self, other,"DIA_Thorben_Gritta_06_07"); //Vai a chiederglielo. Ma posso dirti una cosa: non un uno STRACCIO di pezzo d'oro.
	if (Npc_HasItems(Gritta, itmi_gold) >= 100)
	{
		AI_Output (other, self,"DIA_Thorben_Gritta_15_08"); //Vedremo...
	};
};

// ************************************************************
// 		Grittas Gold genommen
// ************************************************************
INSTANCE DIA_Thorben_GrittaHatteGold(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 5;
	condition	= DIA_Thorben_GrittaHatteGold_Condition;
	information	= DIA_Thorben_GrittaHatteGold_Info;
	permanent	= FALSE;
	description = "Tua nipote ha avuto 100 monete d’oro.";
};                       
FUNC INT DIA_Thorben_GrittaHatteGold_Condition()
{	
	if (Npc_KnowsInfo(other, DIA_Thorben_Gritta))
	&& (Npc_HasItems(Gritta, itmi_gold) < 100)
	&& (!Npc_IsDead (Gritta))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_GrittaHatteGold_Info()
{	
	AI_Output (other, self,"DIA_Thorben_GrittaHatteGold_15_00"); //Tua nipote ha avuto 100 monete d’oro.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_06_01"); //COSA? Quella vipera, era il MIO oro! L'ha preso dal mio forziere!
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_06_02"); //Ridammelo! Devo pagare Lehmar prima. Matteo potrà avere i suoi soldi in seguito!

	Info_ClearChoices (DIA_Thorben_GrittaHatteGold);
	if (MIS_Matteo_Gold == LOG_SUCCESS)
	{
		Info_AddChoice (DIA_Thorben_GrittaHatteGold, "Ho già dato a Matteo il suo oro!", DIA_Thorben_GrittaHatteGold_MatteoHatEs);
	}
	else
	{
		Info_AddChoice (DIA_Thorben_GrittaHatteGold, "No. Matteo riavrà i suoi soldi da me.", DIA_Thorben_GrittaHatteGold_MatteoSollHaben);
	};

	if (Npc_HasItems(other, itmi_gold) >= 100)
	{
		Info_AddChoice (DIA_Thorben_GrittaHatteGold, "Ecco il tuo oro.", DIA_Thorben_GrittaHatteGold_HereItIs);
	};
};

func void B_Thorben_DeletePetzCrimeGritta()
{
	if (Gritta_GoldGiven == FALSE)
	{
		AI_Output (self, other,"B_Thorben_DeletePetzCrimeGritta_06_00"); //Se conosco quella piccola vipera, sono certo che correrà dalla guardia cittadina e farà accusare anche te!
		AI_Output (self, other,"B_Thorben_DeletePetzCrimeGritta_06_01"); //Vedremo quando la faccenda sarà sistemata.
		B_DeletePetzCrime (Gritta);
	};
};

func void DIA_Thorben_GrittaHatteGold_MatteoHatEs()
{
	AI_Output (other, self,"DIA_Thorben_GrittaHatteGold_MatteoHatEs_15_00"); //Ho già dato a Matteo il suo oro!
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_MatteoHatEs_06_01"); //Dannazione! Oh beh, un debito è un debito. Almeno non ti sei tenuto i soldi. Immagino che dovrei ringraziarti per questo.
	
	B_Thorben_DeletePetzCrimeGritta();
	
	Info_ClearChoices (DIA_Thorben_GrittaHatteGold);
};

func void DIA_Thorben_GrittaHatteGold_MatteoSollHaben()
{
	AI_Output (other, self,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_15_00"); //No. Matteo riavrà i suoi soldi da me.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_06_01"); //Mi stai mettendo in un bel guaio. Lehmar non è particolarmente generoso quando si parla di debiti.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_06_02"); //Ma almeno hai intenzione di pagare i debiti di mia nipote. Immagino che dovrei ringraziarti...
	
	B_Thorben_DeletePetzCrimeGritta();
	
	Info_ClearChoices (DIA_Thorben_GrittaHatteGold);
};

func void DIA_Thorben_GrittaHatteGold_HereItIs()
{
	AI_Output (other, self,"DIA_Thorben_GrittaHatteGold_HereItIs_15_00"); //Ecco il tuo oro.
	B_GiveInvItems(other, self, itmi_gold, 100);
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_HereItIs_06_01"); //Grazie! Almeno adesso ho una parte dei soldi che devo a Lehmar.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_HereItIs_06_02"); //Non posso credere che abbia avuto il coraggio di prendere il mio oro!
	
	B_Thorben_DeletePetzCrimeGritta();
	
	Thorben_GotGold = TRUE;
	
	Info_ClearChoices (DIA_Thorben_GrittaHatteGold);
};



















