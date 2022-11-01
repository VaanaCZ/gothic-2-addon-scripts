// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Bennet_EXIT   (C_INFO)
{
	npc         = SLD_809_Bennet;
	nr          = 999;
	condition   = DIA_Bennet_EXIT_Condition;
	information = DIA_Bennet_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Bennet_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Bennet_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				  Hallo 
// ************************************************************
instance DIA_Bennet_HALLO	(C_INFO)
{
	npc		 	= SLD_809_Bennet;
	nr		 	= 1;
	condition	= DIA_Bennet_HALLO_Condition;
	information	= DIA_Bennet_HALLO_Info;
	permanent 	= FALSE;
	important 	= TRUE;
};

func int DIA_Bennet_HALLO_Condition ()
{
	if (Kapitel < 3)
	&& (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};	
};

func void DIA_Bennet_HALLO_Info ()
{
	AI_Output (self, other, "DIA_Bennet_HALLO_06_00"); //Non vendo alcuna arma. Khaled le vende. Lo trovi nella casa con Onar.
	
	Log_CreateTopic (Topic_SoldierTrader,LOG_NOTE);
	B_LogEntry (Topic_SoldierTrader,"Khaled è un venditore di armi.");
};

// ************************************************************
// 			  				TRADE 
// ************************************************************
instance DIA_Bennet_TRADE		(C_INFO)
{
	npc			= SLD_809_Bennet;
	nr          = 700;
	condition	= DIA_Bennet_TRADE_Condition;
	information	= DIA_Bennet_TRADE_Info;
	permanent	= TRUE;
	description	= "E la forgiatura di equipaggiamento?";
	trade		= TRUE;
};

func int DIA_Bennet_TRADE_Condition ()
{
	if ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS))		//damit Bennet dir im Knast kein Schmieden beibringt
	{
		return TRUE;
	};
};

func void DIA_Bennet_TRADE_Info ()
{
	AI_Output (other, self, "DIA_Bennet_TRADE_15_00"); //E la forgiatura di equipaggiamento?
	B_GiveTradeInv (self);

	//Joly: Mc ArrowBolt
	//////////////////////////////////////////////////////////////////////////////////////
	Npc_RemoveInvItems	(self, ItRw_Bolt, Npc_HasItems (self,ItRw_Bolt) );
	var int McBolzenAmount;
	McBolzenAmount = (Kapitel * 50);
	CreateInvItems 	(self, ItRw_Bolt, McBolzenAmount );
	
	Npc_RemoveInvItems	(self, ItRw_Arrow, Npc_HasItems (self,ItRw_Arrow) );
	var int McArrowAmount;
	McArrowAmount = (Kapitel * 50);
	CreateInvItems 	(self, ItRw_Arrow, McArrowAmount );
	//////////////////////////////////////////////////////////////////////////////////////

	AI_Output (self, other, "DIA_Bennet_TRADE_06_01"); //Di cosa hai bisogno?
	
	if (BennetLOG == FALSE)
	{
		Log_CreateTopic (Topic_SoldierTrader,LOG_NOTE);
		B_LogEntry (Topic_SoldierTrader,"Bennet vende equipaggiamento da fabbro.");
		BennetLOG = TRUE;
	};
};

// ************************************************************
// 			  				WhichWeapons 
// ************************************************************
instance DIA_Bennet_WhichWeapons (C_INFO)
{
	npc			= SLD_809_Bennet;
	nr          = 2;
	condition	= DIA_Bennet_WhichWeapons_Condition;
	information	= DIA_Bennet_WhichWeapons_Info;
	permanent	= FALSE;
	description	= "Che tipo di armi fabbrichi?";
};

func int DIA_Bennet_WhichWeapons_Condition ()
{
	if ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS))
	&& (MIS_Bennet_BringOre == FALSE)
	{
		return TRUE;
	};	
};

func void DIA_Bennet_WhichWeapons_Info ()
{
	AI_Output (other, self, "DIA_Bennet_WhichWeapons_15_00"); //Che tipo di armi fabbrichi?
	AI_Output (self, other, "DIA_Bennet_WhichWeapons_06_01"); //Spade normali al momento, non molto altro.
	AI_Output (self, other, "DIA_Bennet_WhichWeapons_06_02"); //Ma se avessi un po' di metallo magico potrei forgiare armi migliori delle solite fatte con il vecchio acciaio.
	AI_Output (self, other, "DIA_Bennet_WhichWeapons_06_03"); //Per caso non sai dove potrei trovarne qui attorno? (ride) A parte nella Valle delle Miniere, intendo.
	AI_Output (other, self, "DIA_Bennet_WhichWeapons_15_04"); //No.
	AI_Output (self, other, "DIA_Bennet_WhichWeapons_06_05"); //Certo che no.
};

// ************************************************************
// 			  				BauOrSld 
// ************************************************************
instance DIA_Bennet_BauOrSld (C_INFO)
{
	npc			= SLD_809_Bennet;
	nr          = 3;
	condition	= DIA_Bennet_BauOrSld_Condition;
	information	= DIA_Bennet_BauOrSld_Info;
	permanent	= FALSE;
	description	= "Stai dalla parte dei contadini o dei mercenari?";
};

func int DIA_Bennet_BauOrSld_Condition ()
{
	return TRUE;
};

func void DIA_Bennet_BauOrSld_Info ()
{
	AI_Output (other, self, "DIA_Bennet_BauOrSld_15_00"); //Stai dalla parte dei contadini o dei mercenari?
	AI_Output (self, other, "DIA_Bennet_BauOrSld_06_01"); //Mi stai prendendo in giro, vero?
	AI_Output (other, self, "DIA_Bennet_BauOrSld_15_02"); //Ero solo curioso.
	AI_Output (self, other, "DIA_Bennet_BauOrSld_06_03"); //Hai mai visto fattorie che forgiano anche armi?
	AI_Output (other, self, "DIA_Bennet_BauOrSld_15_04"); //No.
	AI_Output (self, other, "DIA_Bennet_BauOrSld_06_05"); //Allora perché fai domande stupide?
};

// ************************************************************
// 			  				WannaJoin 
// ************************************************************
instance DIA_Bennet_WannaJoin (C_INFO)
{
	npc			= SLD_809_Bennet;
	nr          = 4;
	condition	= DIA_Bennet_WannaJoin_Condition;
	information	= DIA_Bennet_WannaJoin_Info;
	permanent	= TRUE;
	description	= "Voglio unirmi ai mercenari!";
};

func int DIA_Bennet_WannaJoin_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bennet_BauOrSld))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Bennet_WannaJoin_Info ()
{
	AI_Output (other, self, "DIA_Bennet_WannaJoin_15_00"); //Voglio unirmi ai mercenari!
	AI_Output (self, other, "DIA_Bennet_WannaJoin_06_01"); //Allora smettila di chiacchierare, vai da Torlof e fatti mettere alla prova.
	if (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
	|| (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
	{
		AI_Output (other, self, "DIA_Bennet_WannaJoin_15_02"); //Ho superato la prova.
		AI_Output (self, other, "DIA_Bennet_WannaJoin_06_03"); //Bene, voterò per te allora.
	};
};

// ************************************************************
// 			  				WannaSmith 
// ************************************************************

instance DIA_Bennet_WannaSmith (C_INFO)
{
	npc			= SLD_809_Bennet;
	nr          = 5;
	condition	= DIA_Bennet_WannaSmith_Condition;
	information	= DIA_Bennet_WannaSmith_Info;
	permanent	= TRUE;
	description	= "Puoi insegnarmi a forgiare una spada?";
};

func int DIA_Bennet_WannaSmith_Condition ()
{
	if (PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	&& (Bennet_TeachCommon == FALSE)
	&& ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Bennet_WannaSmith_Info ()
{
	AI_Output (other, self, "DIA_Bennet_WannaSmith_15_00"); //Puoi insegnarmi a forgiare una spada?
	AI_Output (self, other, "DIA_Bennet_WannaSmith_06_01"); //Certo.
	AI_Output (self, other, "DIA_Bennet_WannaSmith_06_02"); //Questo ti costerà un po' però. Diciamo 30 pezzi d'oro.
	
	Info_ClearChoices (DIA_Bennet_WannaSmith);
	Info_AddChoice (DIA_Bennet_WannaSmith, "Forse più tardi.", DIA_Bennet_WannaSmith_Later);
	Info_AddChoice (DIA_Bennet_WannaSmith, "D’accordo. Ecco 30 monete d’oro per te.", DIA_Bennet_WannaSmith_Pay);
};

func void DIA_Bennet_WannaSmith_Pay()
{
	AI_Output (other, self, "DIA_Bennet_WannaSmith_Pay_15_00"); //D'accordo. Ecco 30 monete d’oro per te.
	
	if (B_GiveInvItems (other, self, itmi_gold, 30))
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmith_Pay_06_01"); //Ed è anche un ottimo prezzo! Possiamo iniziare non appena sarai pronto.
		
		Bennet_TeachCommon = TRUE;
		Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
		B_LogEntry (Topic_SoldierTeacher,"Bennet può insegnarmi l'arte del fabbro ferraio.");
	}
	else
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmith_Pay_06_02"); //Smettila di trattarmi da idiota. 30 pezzi, non una moneta di meno.
	};
	Info_ClearChoices (DIA_Bennet_WannaSmith);
};

func void DIA_Bennet_WannaSmith_Later()
{
	AI_Output (other, self, "DIA_Bennet_WannaSmith_Later_15_00"); //Forse più tardi.
	Info_ClearChoices (DIA_Bennet_WannaSmith);
};


// ************************************************************
// 			  				Teach COMMON 
// ************************************************************
instance DIA_Bennet_TeachCOMMON (C_INFO)
{
	npc			= SLD_809_Bennet;
	nr          = 6;
	condition	= DIA_Bennet_TeachCOMMON_Condition;
	information	= DIA_Bennet_TeachCOMMON_Info;
	permanent	= TRUE;
	description	= B_BuildLearnString("Apprendi come forgiare", B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_Common));
};

func int DIA_Bennet_TeachCOMMON_Condition ()
{
	if (PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	&& (Bennet_TeachCommon == TRUE)
	&& ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS))		//damit Bennet dir im Knast kein Schmieden beibringt
	{
		return TRUE;
	};
};

func void DIA_Bennet_TeachCOMMON_Info ()
{
	AI_Output (other, self, "DIA_Bennet_TeachCOMMON_15_00"); //Insegnami a forgiare una spada!
	
	if (B_TeachPlayerTalentSmith (self, other, WEAPON_Common))
	{
		AI_Output (self, other, "DIA_Bennet_TeachCOMMON_06_01"); //È abbastanza facile: prendi un pezzo di acciaio grezzo e tienilo sul fuoco fino a quando non sarà incandescente.
		AI_Output (self, other, "DIA_Bennet_TeachCOMMON_06_02"); //Poi appoggialo sull'incudine e martella la lama dandole la forma.
		AI_Output (self, other, "DIA_Bennet_TeachCOMMON_06_03"); //Molto importante, fai attenzione che la lama non si raffreddi troppo. Hai solo qualche minuto per lavorare la tua arma...
		AI_Output (self, other, "DIA_Bennet_TeachCOMMON_06_04"); //Il resto puoi scoprirlo da solo, è solo questione di pratica.
	};
};

// ************************************************************
// 			  				WannaSmithORE
// ************************************************************
instance DIA_Bennet_WannaSmithORE (C_INFO)
{
	npc			= SLD_809_Bennet;
	nr          = 7;
	condition	= DIA_Bennet_WannaSmithORE_Condition;
	information	= DIA_Bennet_WannaSmithORE_Info;
	permanent	= TRUE;
	description	= "Insegnami a forgiare armi di metallo magico!";
};

func int DIA_Bennet_WannaSmithORE_Condition ()
{
	if (Bennet_TeachSmith == FALSE)
	&& ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS))	
	{
		return TRUE;
	};
};

func void DIA_Bennet_WannaSmithORE_Info ()
{
	AI_Output (other, self, "DIA_Bennet_WannaSmithORE_15_00"); //Insegnami a forgiare armi di metallo magico!
		
	if (PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_01"); //Ma non conosci nemmeno le basi.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_02"); //Prima devi imparare a forgiare una spada decente, poi vedremo.
	}
	else if (other.guild != GIL_SLD)
	&& 		(other.guild != GIL_DJG)
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_03"); //Fino a quando non sei uno di noi, che io sia dannato se ti rivelerò i segreti delle armi di metallo magico.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_04"); //Solo pochissimi fabbri li conoscono tutti e credo che nemmeno i fabbri in città ne sappiano niente.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_05"); //E questo è un bene. Altrimenti quegli ubriaconi della guardia cittadina brandirebbero tutti spade magiche.
		if (other.guild == GIL_MIL)
		{	
			AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_06"); //Non ho niente contro di te. (ghigno) Sembri a posto.
		};
	}
	else if (MIS_Bennet_BringOre != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_07"); //Se avessi del metallo magico potrei anche farlo.
		AI_Output (other, self, "DIA_Bennet_WannaSmithORE_15_08");//Oh, suvvia, sto con i mercenari e so forgiare le armi. Che altro ti serve?
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_09"); //Sai dirmi allora come dovrei fare a insegnarti a forgiare un'arma di metallo magio senza alcun metallo magico?
		AI_Output (other, self, "DIA_Bennet_WannaSmithORE_15_10");//Beh...
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_11"); //Come pensavo. Mi servono almeno 5 pezzi di quel metallo, o puoi scordartelo.
		if (MIS_Bennet_BringOre == FALSE)
		{
			MIS_Bennet_BringOre = LOG_RUNNING;
		};
	}
	else //alles OK
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_12"); //Bene, mi hai portato il metallo e sai anche come forgiare una spada decente.
		AI_Output (other, self, "DIA_Bennet_WannaSmithORE_15_13");//Bene, dimmi tutto allora...
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_14"); //L'importante è: non importa se la tua arma è fatta tutta di metallo, oppure se hai solamente ricoperto una semplice lama di acciaio con uno strato di metallo. La superficie è quello che conta.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_15"); //E poiché questa dannata roba è così cara, prendi una barra d'acciaio e qualche pezzo di metallo.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_16"); //Naturalmente, non basterà ricoprire una spada già fatta con del metallo magico. Dovrai forgiarne una da zero.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_17"); //Tutto il resto dipende dall'arma che vorresti produrre.
		Bennet_TeachSmith = TRUE;
	};
};

// ************************************************************
// 			  				WhereOre
// ************************************************************
instance DIA_Bennet_WhereOre (C_INFO)
{
	npc			= SLD_809_Bennet;
	nr          = 8;
	condition	= DIA_Bennet_WhereOre_Condition;
	information	= DIA_Bennet_WhereOre_Info;
	permanent	= FALSE;
	description	= "Dove si trova il metallo magico?";
};

func int DIA_Bennet_WhereOre_Condition ()
{
	if (MIS_Bennet_BringOre == LOG_RUNNING)
	&& ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Bennet_WhereOre_Info ()
{
	AI_Output (other, self, "DIA_Bennet_WhereOre_15_00"); //Dove si trova il metallo magico?
	AI_Output (self, other, "DIA_Bennet_WhereOre_06_01"); //Beh, se solo lo sapessi. Dev'essercene sicuramente un po' nella colonia mineraria.
	AI_Output (self, other, "DIA_Bennet_WhereOre_06_02"); //Ma forse sarai così fortunato da trovare qui intorno qualche pezzo avanzato che tu possa mettere assieme.
	AI_Output (self, other, "DIA_Bennet_WhereOre_06_03"); //Penso ci siano alcuni tunnel di miniera nelle montagne a sud di qui. Forse lì avrai fortuna.
	AI_Output (self, other, "DIA_Bennet_WhereOre_06_04"); //Ma fai attenzione, ho sentito dire che il posto brulichi di briganti.
};

// ************************************************************
// 			  				BringOre
// ************************************************************
instance DIA_Bennet_BringOre (C_INFO)
{
	npc			= SLD_809_Bennet;
	nr          = 9;
	condition	= DIA_Bennet_BringOre_Condition;
	information	= DIA_Bennet_BringOre_Info;
	permanent	= FALSE;
	description	= "Ecco prendi... 5 pepite d’oro.";
};

func int DIA_Bennet_BringOre_Condition ()
{
	if (MIS_Bennet_BringOre == LOG_RUNNING)
	&& (Npc_HasItems (other,ItMi_Nugget) >= 5)
	{
		return TRUE;
	};
};

func void DIA_Bennet_BringOre_Info ()
{
	AI_Output (other, self, "DIA_Bennet_BringOre_15_00"); //Ecco.
	AI_Output (self, other, "DIA_Bennet_BringOre_06_01"); //(ride) Fammi vedere!
	B_GiveInvItems (other, self, itmi_nugget, 5);
	AI_Output (self, other, "DIA_Bennet_BringOre_06_02"); //Davvero! Stupiscimi!
	AI_Output (self, other, "DIA_Bennet_BringOre_06_03"); //Puoi tenere un paio di questi. Ti serviranno per forgiare la tua arma personale.
	B_GiveInvItems (self,other, itmi_nugget, 2);
	MIS_Bennet_BringOre = LOG_SUCCESS;
};

// ************************************************************
// 			  				  Teach 
// ************************************************************
var int Bennet_Kap2Smith;
var int Bennet_Kap3Smith;
var int Bennet_Kap4Smith;
var int Bennet_Kap5Smith;
// ---------------------------------

FUNC VOID B_SayBennetLATER()
{
	AI_Output	(self, other, "DIA_Bennet_GetInnosEye_06_04"); //No, non ancora. Torna più tardi.
};
instance DIA_Bennet_TeachSmith		(C_INFO)
{
	npc		 	= SLD_809_Bennet;
	nr		 	= 30;
	condition	= DIA_Bennet_TeachSmith_Condition;
	information	= DIA_Bennet_TeachSmith_Info;
	permanent	= TRUE;
	description	= "Dimmi di più su come forgiare armi di metallo magiche.";
};

func int DIA_Bennet_TeachSmith_Condition ()
{
	if (Bennet_TeachSmith == TRUE)
	&& ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS))		//damit Bennet dir im Knast kein Schmieden beibringt
	{
		return TRUE;
	};
};

func void DIA_Bennet_TeachSmith_Info ()
{
	AI_Output (other, self, "DIA_Bennet_TeachSmith_15_00"); //Dimmi di più su come forgiare armi di metallo magiche.
	
	if (Kapitel == 1)//HACK Mattes  
	{
		B_SayBennetLATER();
	}
	else if (Kapitel == 2)
	&& (Bennet_Kap2Smith == FALSE)
	{
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_01"); //Posso insegnarti a forgiare spade di metallo magico, e persino spade a due mani.
		Bennet_Kap2Smith = TRUE;
	}
	else if (Kapitel == 3)
	&& (MIS_ReadyForChapter4 == FALSE)
	&& (Bennet_Kap3Smith == FALSE)
	{
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_02"); //Ho migliorato la mia tecnica. Ora posso insegnarti a fabbricare spade bastarde e spade a due mani pesanti con il metallo.
		Bennet_Kap3Smith = TRUE;
	}
	else if (MIS_ReadyForChapter4 == TRUE)
	&& (Kapitel < 5)
	&& (Bennet_Kap4Smith == FALSE)
	{
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_03"); //Penso di aver superato me stesso questa volta. Ho creato due lame da battaglia. Sono quanto di meglio io abbia mai visto finora.
		Bennet_Kap4Smith = TRUE;
	}
	else if (Kapitel >= 5)
	&& (Bennet_Kap5Smith == FALSE)
	{
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_04"); //Ascolta. Penso di avere appena avuto un'idea geniale. Armi di metallo magiche imbevute di sangue di drago. E so esattamente cosa farei.
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_05"); //(ghigno) Vuoi saperlo?
		Bennet_Kap5Smith = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_06"); //Che tipo di arma ti piacerebbe creare?
	};
	
	Info_ClearChoices (DIA_Bennet_TeachSmith);
	Info_AddChoice (DIA_Bennet_TeachSmith, DIALOG_BACK, DIA_Bennet_TeachSmith_BACK);
	// ------ Kapitel 2 ------
	if (PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] == FALSE)
	&& (Kapitel >= 2) 
	{
		Info_AddChoice		(DIA_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_1H_Special_01 , B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Special_01))		,DIA_Bennet_TeachSmith_1hSpecial1);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] == FALSE)
	&& (Kapitel >= 2) 
	{
		Info_AddChoice		(DIA_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_2H_Special_01, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_2H_Special_01))		,DIA_Bennet_TeachSmith_2hSpecial1);
	};
	// ------ Kapitel 3 ------
	if (PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] == FALSE)
	&& (Kapitel >= 3)
	{
		Info_AddChoice		(DIA_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_1H_Special_02, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Special_02))		,DIA_Bennet_TeachSmith_1hSpecial2);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] == FALSE)
	&& (Kapitel >= 3)
	{
		Info_AddChoice		(DIA_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_2H_Special_02, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_2H_Special_02))		,DIA_Bennet_TeachSmith_2hSpecial2);
	};
	// ------ Kapitel 4 ------
	if (PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] == FALSE)
	&& (Kapitel >= 4)
	{
		Info_AddChoice		(DIA_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_1H_Special_03, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Special_03))		,DIA_Bennet_TeachSmith_1hSpecial3);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] == FALSE)
	&& (Kapitel >= 4)
	{
		Info_AddChoice		(DIA_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_2H_Special_03, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_2H_Special_03))		,DIA_Bennet_TeachSmith_2hSpecial3);
	};
	// ------ Kapitel 5 ------
	if (PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] == FALSE)
	&& (Kapitel >= 5)
	{
		Info_AddChoice		(DIA_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_1H_Special_04, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Special_04))		,DIA_Bennet_TeachSmith_1hSpecial4);
	};  
	if (PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] == FALSE)
	&& (Kapitel >= 5)
	{
		Info_AddChoice		(DIA_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_2H_Special_04, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_2H_Special_04))		,DIA_Bennet_TeachSmith_2hSpecial4);
	};
};

FUNC VOID DIA_Bennet_TeachSmith_Back ()
{
	Info_ClearChoices (DIA_Bennet_TeachSmith);
};
func VOID DIA_Bennet_TeachSmith_1hSpecial1 ()
{
	
	B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Special_01);	
};
FUNC VOID DIA_Bennet_TeachSmith_2hSpecial1 ()
{

	B_TeachPlayerTalentSmith (self, other, WEAPON_2H_Special_01);
};
FUNC VOID DIA_Bennet_TeachSmith_1hSpecial2 ()
{

	B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Special_02);
};
FUNC VOID DIA_Bennet_TeachSmith_2hSpecial2 ()
{

	B_TeachPlayerTalentSmith (self, other, WEAPON_2H_Special_02);
};
FUNC VOID DIA_Bennet_TeachSmith_1hSpecial3 ()
{

	B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Special_03);
};
FUNC VOID DIA_Bennet_TeachSmith_2hSpecial3 ()
{

	B_TeachPlayerTalentSmith (self, other, WEAPON_2H_Special_03);
};
FUNC VOID DIA_Bennet_TeachSmith_1hSpecial4 ()
{
	
	B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Special_04);
};
FUNC VOID DIA_Bennet_TeachSmith_2hSpecial4 ()
{

	B_TeachPlayerTalentSmith(self, other, WEAPON_2H_Special_04);
};


//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Bennet_KAP3_EXIT(C_INFO)
{
	npc			= SLD_809_Bennet;
	nr			= 999;
	condition	= DIA_Bennet_KAP3_EXIT_Condition;
	information	= DIA_Bennet_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Bennet_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bennet_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//*********************************************************************
//	Was machst du hier im Knast?
//*********************************************************************
instance DIA_Bennet_WhyPrison		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_WhyPrison_Condition;
	information	 = 	DIA_Bennet_WhyPrison_Info;
	permanent	 = 	FALSE;
	description	 = 	"Per quale motivo sei in prigione?";
};

func int DIA_Bennet_WhyPrison_Condition ()
{
	IF (Kapitel == 3)
	&& (MIS_RescueBennet != LOG_SUCCESS)
	{
		return TRUE;
	};	
};

func void DIA_Bennet_WhyPrison_Info ()
{
	AI_Output	(other, self ,"DIA_Bennet_WhyPrison_15_00"); //Per quale motivo sei in prigione?
	AI_Output	(self , other,"DIA_Bennet_WhyPrison_06_01"); //Quei porci mi hanno gettato in cella. Dovrei aver assassinato un paladino secondo loro.
	AI_Output 	(self ,other ,"DIA_Bennet_WhyPrison_06_02"); //Ma non ho fatto niente, stanno cercando di incastrarmi.
	AI_Output	(other, self ,"DIA_Bennet_WhyPrison_15_03"); //Perché dovrebbero fare qualcosa del genere?
	AI_Output 	(self ,other ,"DIA_Bennet_WhyPrison_06_04"); //Come faccio a saperlo? Devi farmi uscire di qui.
	AI_Output 	(self ,other ,"DIA_Bennet_WhyPrison_06_05"); //Parla con Lord Hagen, demolisci il muro, che importa! Basta che fai qualcosa!
	
	MIS_RescueBennet = LOG_RUNNING; 
	Log_CreateTopic (TOPIC_RESCUEBENNET, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RESCUEBENNET, LOG_RUNNING);
	B_LogEntry (TOPIC_RESCUEBENNET,"Bennet è veramente nei guai. Farebbe qualsiasi cosa per uscire di prigione."); 
};

//*********************************************************************
//	Was ist passiert?
//*********************************************************************
instance DIA_Bennet_WhatHappened		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_WhatHappened_Condition;
	information	 = 	DIA_Bennet_WhatHappened_Info;
	permanent	 = 	FALSE;
	description	 = 	"Cosa è successo?";
};

func int DIA_Bennet_WhatHappened_Condition ()
{
	IF (MIS_RescueBennet == LOG_RUNNING)
	&& (Npc_KnowsInfo (other,DIA_Bennet_WhyPrison))
	{
		return TRUE;
	};	
};

func void DIA_Bennet_WhatHappened_Info ()
{
	AI_Output	(other, self ,"DIA_Bennet_WhatHappened_15_00"); //Cosa è successo?
	AI_Output	(self , other,"DIA_Bennet_WhatHappened_06_01"); //Mi sono recato in città con Hodges per comprare dei rifornimenti per i ragazzi.
	AI_Output 	(self ,other ,"DIA_Bennet_WhatHappened_06_02"); //Improvvisamente abbiamo sentito un grido spaventoso e il rumore di qualcuno che correva.
	AI_Output	(other, self ,"DIA_Bennet_WhatHappened_15_03"); //Arriva al punto.
	AI_Output 	(self ,other ,"DIA_Bennet_WhatHappened_06_04"); //Abbiamo capito subito che era successo qualcosa e che ci avrebbero presi non appena ci avessero visti lì.
	AI_Output 	(self ,other ,"DIA_Bennet_WhatHappened_06_05"); //Siamo corsi via più velocemente possibile. Ma, prima che arrivassimo al cancello della città, sono caduto e ho preso una distorsione alla caviglia.
	AI_Output 	(self ,other ,"DIA_Bennet_WhatHappened_06_06"); //Non c'è molto altro da dire. L'esercito mi è saltato addosso in un attimo e mi hanno gettato direttamente in questo buco.
};

//*********************************************************************
//	Wer ist ermordet worden?
//*********************************************************************
instance DIA_Bennet_Victim		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_Victim_Condition;
	information	 = 	DIA_Bennet_Victim_Info;
	permanent	 = 	FALSE;
	description	 = 	"Chi è stato ucciso?";
};

func int DIA_Bennet_Victim_Condition ()
{
	IF (MIS_RescueBennet == LOG_RUNNING)
	&& (Npc_KnowsInfo (other,DIA_Bennet_WhyPrison))
	{
		return TRUE;
	};	
};

func void DIA_Bennet_Victim_Info ()
{
	AI_Output	(other, self ,"DIA_Bennet_Victim_15_00"); //Chi è stato ucciso?
	AI_Output	(self , other,"DIA_Bennet_Victim_06_01"); //Non ne ho idea... uno dei paladini, non li conosco.
	AI_Output	(other, self ,"DIA_Bennet_Victim_15_02"); //Sai il nome?
	AI_Output 	(self ,other ,"DIA_Bennet_Victim_06_03"); //Un tale Lothar, mi pare. Non so, non sono sicuro.
	AI_Output 	(self ,other ,"DIA_Bennet_Victim_06_04"); //Faresti meglio a chiedere a Lord Hagen, dovrebbe sapere tutti i dettagli.

	B_LogEntry (TOPIC_RESCUEBENNET,"Lothar, uno dei paladini, è stato assassinato. Lord Hagen dovrebbe sapermi dire di più, poiché si occupa lui delle indagini.");
};

//*********************************************************************
//	Haben sie Beweise gegen dich?
//*********************************************************************
instance DIA_Bennet_Evidence		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_Evidence_Condition;
	information	 = 	DIA_Bennet_Evidence_Info;
	permanent	 = 	FALSE;
	description	 = 	"Ci sono prove contro di te?";
};

func int DIA_Bennet_Evidence_Condition ()
{
	IF (MIS_RescueBennet == LOG_RUNNING)
	&& (Npc_KnowsInfo (other,DIA_Bennet_WhyPrison))
	{
		return TRUE;
	};	
};

func void DIA_Bennet_Evidence_Info ()
{
	AI_Output	(other, self ,"DIA_Bennet_Evidence_15_00"); //Ci sono prove contro di te?
	AI_Output	(self , other,"DIA_Bennet_Evidence_06_01"); //Dicono che un testimone mi ha riconosciuto.
	AI_Output	(other, self ,"DIA_Bennet_Evidence_15_02"); //Sai chi sia questo testimone?
	AI_Output 	(self ,other ,"DIA_Bennet_Evidence_06_03"); //No. Tutto quello che so è che sta mentendo.
	
	B_LogEntry (TOPIC_RESCUEBENNET,"C'è un testimone che afferma di aver visto Bennet. Devo trovarlo se voglio scoprire la verità.");
	
	RescueBennet_KnowsWitness = TRUE; 
};


//*********************************************************************
//	Wer führt die Untersuchungen durch?
//*********************************************************************
instance DIA_Bennet_Investigation		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_Investigation_Condition;
	information	 = 	DIA_Bennet_Investigation_Info;
	permanent	 = 	FALSE;
	description	 = 	"Chi è a capo delle investigazioni?";
};

func int DIA_Bennet_Investigation_Condition ()
{
	IF (MIS_RescueBennet == LOG_RUNNING)
	&& (Npc_KnowsInfo (other,DIA_Bennet_Evidence))
	{
		return TRUE;
	};	
};

func void DIA_Bennet_Investigation_Info ()
{
	AI_Output	(other, self ,"DIA_Bennet_Investigation_15_00"); //Chi conduce le indagini?
	AI_Output	(self , other,"DIA_Bennet_Investigation_06_01"); //Lord Hagen stesso. Visto che la vittima era uno dei paladini, questo ricade sotto la legge marziale.
	AI_Output	(other, self ,"DIA_Bennet_Investigation_15_02"); //Che significa?
	AI_Output 	(self ,other ,"DIA_Bennet_Investigation_06_03"); //Non è difficile da immaginare. Se non mi farai uscire da qui, mi impiccheranno senza tante cerimonie.
	AI_Output 	(self ,other ,"DIA_Bennet_Investigation_06_04"); //Devi aiutarmi, o scoppierà una guerra. Lee non starà certo a guardare.
	AI_Output 	(self ,other ,"DIA_Bennet_Investigation_06_05"); //Puoi immaginare da solo cosa questo significhi.
};


//*********************************************************************
//	Mann, ich hatte echt schon geglaubt, dass die mich hängen! 
//*********************************************************************
instance DIA_Bennet_ThankYou		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_ThankYou_Condition;
	information	 = 	DIA_Bennet_ThankYou_Info;
	permanent	 = 	FALSE;
	Important	 =	TRUE;
};

func int DIA_Bennet_ThankYou_Condition ()
{
	IF (MIS_RescueBennet == LOG_SUCCESS)
	{
		return TRUE;
	};	
};

func void DIA_Bennet_ThankYou_Info ()
{
	if (hero.guild == GIL_SLD)
	{
		other.guild = GIL_DJG;
		Npc_SetTrueGuild (other, GIL_DJG);
	};

	AI_Output	(self ,other,"DIA_Bennet_ThankYou_06_00"); //Cavoli, proprio quando stavo cominciando a credere che mi avrebbero impiccato veramente!
	AI_Output	(other,self ,"DIA_Bennet_ThankYou_15_01"); //Beh, è andato tutto a posto alla fine.
	AI_Output 	(self ,other,"DIA_Bennet_ThankYou_06_02"); //Puoi dirlo forte. Avresti dovuto vedere la faccia di quel soldato quando mi hanno fatto uscire!
	AI_Output 	(self ,other,"DIA_Bennet_ThankYou_06_03"); //(ride) Era così spaventato che se l'è quasi fatta addosso.
	AI_Output 	(self ,other,"DIA_Bennet_ThankYou_06_04"); //Ora che ci penso, ho qualcosa per te.
	AI_Output	(other,self ,"DIA_Bennet_ThankYou_15_05"); //Cosa vuoi dire?
	AI_Output 	(self ,other,"DIA_Bennet_ThankYou_06_06"); //(ghigno) Un regalo.
	
};

//*********************************************************************
//	Was für ein Geschenk?
//*********************************************************************

instance DIA_Bennet_Present		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_Present_Condition;
	information	 = 	DIA_Bennet_Present_Info;
	permanent	 = 	FALSE;
	description	 =	"Quale regalo?";
};

func int DIA_Bennet_Present_Condition ()
{
	IF (Npc_KnowsInfo (other,DIA_Bennet_ThankYou))
	{
		return TRUE;
	};	
};

func void DIA_Bennet_Present_Info ()
{
	AI_Output	(other,self ,"DIA_Bennet_Present_15_00"); //Quale regalo?
	
	AI_Output 	(self ,other,"DIA_Bennet_Present_06_01"); //Abbiamo sentito dire che ci sono dei draghi nella valle.
	AI_Output	(other,self ,"DIA_Bennet_Present_15_02"); //Ci sono veramente!
	AI_Output 	(self ,other,"DIA_Bennet_Present_06_03"); //D'accordo, ti credo.
	
	if (hero.guild == GIL_DJG)
	{
			
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_04"); //Ad ogni modo, alcuni dei ragazzi hanno deciso di recarsi nella valle.
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_05"); //(ghigno) Hanno intenzione di ripulire un po' la zona.
		AI_Output	(other,self ,"DIA_Bennet_Present_15_06"); //Cos'ha a che fare tutto questo con me?
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_07"); //(orgoglioso) Ho creato un nuovo tipo di armatura. L'armatura da cacciatore di draghi!
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_08"); //È più resistente e leggera delle armature tradizionali.
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_09"); //Visto che mi hai salvato la vita, voglio farti avere il primo modello. È un regalo!
			
		CreateInvItems (self,ITAR_DJG_L,1);
		B_GiveInvItems (self,other,ITAR_DJG_L,1);
			
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_10"); //Ho pensato che avresti voluto unirti alla festa. Avrai bisogno dell'equipaggiamento giusto quando scenderai in quella valle.
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_11"); //Inoltre, sono interessato nella scaglie di drago. Scaglie di drago autentiche. Ti pagherò un buon prezzo per esse.
		AI_Output	(other,self ,"DIA_Bennet_Present_15_12"); //Quando avrò per ogni scaglia?
		B_Say_Gold (self,other,Value_DragonScale); 
	}
	else
	{
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_13"); //Ad ogni modo, ho pensato che avresti sicuramente voluto partecipare all'imminente caccia al drago.
		AI_Output	(other,self ,"DIA_Bennet_Present_15_14"); //E allora?
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_15"); //Ecco, prendi questo amuleto. Penso ne avrai bisogno più di me.
	
		CreateInvItems (self,ItAm_Hp_01,1); 
		B_GiveInvItems (self,other,ItAm_Hp_01,1);
	};
};


//*********************************************************************
//		DragonScale
//*********************************************************************

//-------------------------------------------------
	var int Bennet_DragonScale_Counter;
	var int Show_DJG_Armor_M;
//-------------------------------------------------

instance DIA_Bennet_DragonScale		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_DragonScale_Condition;
	information	 = 	DIA_Bennet_DragonScale_Info;
	permanent	 = 	TRUE;
	description	 =	"Ho qualche scaglia di drago per te.";
};

func int DIA_Bennet_DragonScale_Condition ()
{
	IF (Npc_HasItems (other,ItAt_Dragonscale) > 0)
	&& (hero.guild == GIL_DJG)
	{
		return TRUE;
	};	
};

func void DIA_Bennet_DragonScale_Info ()
{	
	AI_Output	(other,self ,"DIA_Bennet_DragonScale_15_00"); //Ho qualche scaglia di drago per te.
	AI_Output 	(self ,other,"DIA_Bennet_DragonScale_06_01"); //Delle autentiche scaglie di drago!
	AI_Output 	(self ,other,"DIA_Bennet_DragonScale_06_02"); //Ecco il tuo oro!
	
	Bennet_DragonScale_Counter = (Bennet_DragonScale_Counter +(Npc_HasItems (other,ItAT_Dragonscale)));
	
	B_GiveInvItems (self ,other,ItMi_Gold,(Npc_HasItems(other,ItAT_Dragonscale) * Value_DragonScale) ); 
	B_GiveInvItems (other,self ,ItAt_Dragonscale,(Npc_HasItems (other,ItAT_Dragonscale)));
	
	
	if (Bennet_DragonScale_Counter >= 20)
	&& (Show_DJG_Armor_M == FALSE)
	{
		AI_Output 	(self ,other,"DIA_Bennet_DragonScale_06_03"); //D'accordo, dovrebbe essere sufficiente. Posso venderti una nuova armatura migliorata, se vuoi.
		
		Show_DJG_Armor_M = TRUE;
	};
};

//*********************************************************************
//		DJG_ARMOR_M
//*********************************************************************

//-----------------------------
var int Bennet_DIA_Bennet_DJG_ARMOR_M_permanent;
//-----------------------------

instance DIA_Bennet_DJG_ARMOR_M		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_DJG_ARMOR_M_Condition;
	information	 = 	DIA_Bennet_DJG_ARMOR_M_Info;
	permanent	 = 	TRUE;
	description	 =	"Armatura da cacciatore di draghi media: Protezione: armi 80, frecce 80 (12000 monete d’oro)"; //Wenn ändern, dann bitte auch in der Info-Instanz. s.u.
};

func int DIA_Bennet_DJG_ARMOR_M_Condition ()
{
	IF (Bennet_DIA_Bennet_DJG_ARMOR_M_permanent == FALSE)
	&& (hero.guild == GIL_DJG)
	&& (Show_DJG_Armor_M == TRUE)
	{
		return TRUE;
	};	
};

func void DIA_Bennet_DJG_ARMOR_M_Info ()
{	
	AI_Output	(other,self ,"DIA_Bennet_DJG_ARMOR_M_15_00"); //Voglio acquistare l'armatura.
	
	if (Npc_HasItems (other,itmi_Gold) >= 12000)
	{
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_M_06_01"); //Molto bene. Ti piacerà veramente.
		AI_Output	(other,self ,"DIA_Bennet_DJG_ARMOR_M_15_02"); //Vorrei ben vedere, visto il prezzo.
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_M_06_03"); //Scoprirai che lo vale fino all'ultimo pezzo d'oro.
		
		B_GiveInvItems (other,self,ItMi_Gold,12000);
		CreateInvItems (self,ITAR_DJG_M,1);
		B_GiveInvItems (self,other,ITAR_DJG_M,1);
		
		Bennet_DIA_Bennet_DJG_ARMOR_M_permanent = TRUE;
	}
	else
	{
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_M_06_04"); //Non hai abbastanza oro.
	};	
	
};

//*********************************************************************
//		Ich weiss, wie man die Rüstung noch mehr verbessern kann.
//*********************************************************************

instance DIA_Bennet_BetterArmor		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_BetterArmor_Condition;
	information	 = 	DIA_Bennet_BetterArmor_Info;
	permanent	 = 	FALSE;
	description	 =	"So che l’armatura può essere ulteriormente migliorata.";
};

func int DIA_Bennet_BetterArmor_Condition ()
{
	IF (PlayerGetsFinalDJGArmor == TRUE)
	&& (hero.guild == GIL_DJG)
	{
		return TRUE;
	};	
};

func void DIA_Bennet_BetterArmor_Info ()
{	
	AI_Output	(other,self ,"DIA_Bennet_BetterArmor_15_00"); //So che l’armatura può essere ulteriormente migliorata.
	AI_Output 	(self ,other,"DIA_Bennet_BetterArmor_06_01"); //(sorridendo) Dimmi come, allora.
	AI_Output	(other,self ,"DIA_Bennet_BetterArmor_15_02"); //Potresti ricoprire le scaglie di drago con del metallo magico.
	AI_Output 	(self ,other,"DIA_Bennet_BetterArmor_06_03"); //(ride) Ci avevo già pensato anch'io. E hai ragione.
	AI_Output 	(self ,other,"DIA_Bennet_BetterArmor_06_04"); //La mia nuova armatura batte tutte quelle che tu abbia mai visto. È leggerissima, ma allo stesso tempo resistente.
	AI_Output 	(self ,other,"DIA_Bennet_BetterArmor_06_05"); //È PERFETTA.
	AI_Output 	(self ,other,"DIA_Bennet_BetterArmor_06_06"); //Puoi comprarla se vuoi. Non faccio questa offerta a chiunque e il prezzo copre solamente il costo di fabbricazione.
};


//*********************************************************************
//		DJG_ARMOR_H
//*********************************************************************

//---------------------------------------------------
var int Bennet_DIA_Bennet_DJG_ARMOR_H_permanent;
//---------------------------------------------------

instance DIA_Bennet_DJG_ARMOR_H		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_DJG_ARMOR_H_Condition;
	information	 = 	DIA_Bennet_DJG_ARMOR_H_Info;
	permanent	 = 	TRUE;
	description	 =	"Armatura da cacciatore di draghi pesante: Protezione: armi 90, frecce 90. (20000 monete d’oro)"; //Wenn ändern, dann bitte auch in der Info-Instanz. s.u.
};

func int DIA_Bennet_DJG_ARMOR_H_Condition ()
{
	IF (Bennet_DIA_Bennet_DJG_ARMOR_H_permanent == FALSE)
	&& (hero.guild == GIL_DJG)
	&& (Npc_KnowsInfo (other,DIA_Bennet_BetterArmor))
	{
		return TRUE;
	};	
};

func void DIA_Bennet_DJG_ARMOR_H_Info ()
{	
	AI_Output	(other,self ,"DIA_Bennet_DJG_ARMOR_H_15_00"); //Dammi l'armatura.
	
	if (Npc_HasItems (other,itmi_Gold) >= 20000)
	{
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_H_06_01"); //Questa è la migliore armatura che io abbia mai fatto.
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_H_06_02"); //Un vero capolavoro.
		
		B_GiveInvItems (other,self,ItMi_Gold,20000);
		CreateInvItems (self,ITAR_DJG_H,1);
		B_GiveInvItems (self,other,ITAR_DJG_H,1);
		
		Bennet_DIA_Bennet_DJG_ARMOR_H_permanent = TRUE;
	}
	else
	{
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_H_06_03"); //Non hai abbastanza oro.
	};	
	
};
//*********************************************************************
//	Kannst du auch Schmuckstücke reparieren?
//*********************************************************************
instance DIA_Bennet_RepairNecklace		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_RepairNecklace_Condition;
	information	 = 	DIA_Bennet_RepairNecklace_Info;
	permanent	 = 	FALSE;
	description	 = 	"Ripari gioielli?";
};

func int DIA_Bennet_RepairNecklace_Condition ()
{
	if 	(MIS_Bennet_InnosEyeRepairedSetting   != LOG_SUCCESS)
	&&	((Npc_HasItems (other,ItMi_InnosEye_Broken_MIS)) 
	||   (MIS_SCKnowsInnosEyeIsBroken  == TRUE)) 
  	{
  		return TRUE;
  	};
};

func void DIA_Bennet_RepairNecklace_Info ()
{
	AI_Output			(other, self, "DIA_Bennet_RepairNecklace_15_00"); //Ripari gioielli?
	AI_Output			(self, other, "DIA_Bennet_RepairNecklace_06_01"); //Dipende. Dovresti mostrarmi il pezzo in questione prima.
	
	if (MIS_RescueBennet != LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Bennet_RepairNecklace_06_02"); //Inoltre, devo prima uscire di qui.
		AI_Output (self ,other,"DIA_Bennet_RepairNecklace_06_03"); //Altrimenti, ovviamente, non posso farci niente.
	};	
	
	MIS_SCKnowsInnosEyeIsBroken  = TRUE; 	
};

//*********************************************************************
//		Hier wird das Amulett repariert
//*********************************************************************

//*********************************************************************
//	Kannst du mir dieses Amulett reparieren?
//*********************************************************************
instance DIA_Bennet_ShowInnosEye		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_ShowInnosEye_Condition;
	information	 = 	DIA_Bennet_ShowInnosEye_Info;
	permanent	 = 	FALSE;
	description	 = 	"Puoi dare un’occhiata a questo amuleto?";
};

func int DIA_Bennet_ShowInnosEye_Condition ()
{
	if (Npc_HasItems (other,ItMi_InnosEye_Broken_MIS))
	&& (MIS_Bennet_InnosEyeRepairedSetting   != LOG_SUCCESS)
 	{
    	return TRUE;
  	};

};

func void DIA_Bennet_ShowInnosEye_Info ()
{
	AI_Output			(other, self, "DIA_Bennet_ShowInnosEye_15_00"); //Puoi dare un’occhiata a questo amuleto?
	AI_Output			(self, other, "DIA_Bennet_ShowInnosEye_06_01"); //Certo, fammi vedere.
	AI_Output			(self, other, "DIA_Bennet_ShowInnosEye_06_02"); //Mmmh, è un pregevole artefatto. La montatura si è spezzata. Penso di poterla aggiustare, comunque.
	AI_Output			(other, self, "DIA_Bennet_ShowInnosEye_15_03"); //Quanto tempo ci vorrà?
	if (MIS_REscueBennet != LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Bennet_ShowInnosEye_06_04"); //Beh, per il momento sono bloccato qui. O vedi forse una forgia in questo postaccio?
		AI_Output (self ,other,"DIA_Bennet_ShowInnosEye_06_05"); //Se fossi alla mia fucina potrei fare tutto in un giorno. Ma, naturalmente, prima devo uscire di qui.
	}
	else
	{
	AI_Output			(self, other, "DIA_Bennet_ShowInnosEye_06_06"); //Se me lo lasci, sarà pronto per quando tornerai domani.
	AI_Output			(self, other, "DIA_Bennet_ShowInnosEye_06_07"); //Non ti chiederò nemmeno un pagamento. Mi hai tirato fuori dalla prigione, dopo tutto.
	};
	
	B_LogEntry (TOPIC_INNOSEYE, "Bennet è il fabbro che mi serve se voglio riparare l'amuleto.");

	MIS_SCKnowsInnosEyeIsBroken  = TRUE;
};

//*********************************************************************
//	Kannst du mir dieses Amulett reparieren?
//*********************************************************************
instance DIA_Bennet_GiveInnosEye		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_GiveInnosEye_Condition;
	information	 = 	DIA_Bennet_GiveInnosEye_Info;
	permanent	 = 	FALSE;
	description	 = 	"Ecco l’amuleto: riparamelo.";
};

func int DIA_Bennet_GiveInnosEye_Condition ()
{
	IF (Npc_HasItems (other,ItMi_InnosEye_Broken_Mis)	>=1)
	&& (MIS_SCKnowsInnosEyeIsBroken  == TRUE)
	&& (MIS_REscueBennet == LOG_SUCCESS)
	&& (MIS_Bennet_InnosEyeRepairedSetting   != LOG_SUCCESS)
	{
		return TRUE;
	};	                                                                             
};

func void DIA_Bennet_GiveInnosEye_Info ()
{
	AI_Output			(other, self, "DIA_Bennet_GiveInnosEye_15_00"); //Ecco l’amuleto: riparamelo.
	AI_Output			(self, other, "DIA_Bennet_GiveInnosEye_06_01"); //D'accordo. Vedrò di finire la nuova montatura entro domani.
	AI_Output			(self, other, "DIA_Bennet_GiveInnosEye_06_02"); //Allora potrai venire a riprenderlo.
	
	Npc_RemoveInvItems	(other,	ItMi_InnosEye_Broken_Mis,1);
	AI_PrintScreen (Print_InnoseyeGiven, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);
	
	Bennet_RepairDay = Wld_GetDay ();	
};



///////////////////////////////////////////////////////////////////////
//	Kannst du mir dieses Amulett reparieren?
///////////////////////////////////////////////////////////////////////
instance DIA_Bennet_GetInnosEye		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_GetInnosEye_Condition;
	information	 = 	DIA_Bennet_GetInnosEye_Info;
	permanent	 = 	TRUE;
	description	 = 	"È pronto l’amuleto?";
};

func int DIA_Bennet_GetInnosEye_Condition ()
{
	IF (Npc_KnowsInfo (other,DIA_Bennet_GiveInnosEye)
	&& (MIS_Bennet_InnosEyeRepairedSetting   != LOG_SUCCESS)) 
	{
		return TRUE;
	};	
};

func void DIA_Bennet_GetInnosEye_Info ()
{
	AI_Output			(other, self, "DIA_Bennet_GetInnosEye_15_00"); //È pronto l’amuleto?
	
	if (Bennet_RepairDay < Wld_GetDay())
	{
		AI_Output			(self, other, "DIA_Bennet_GetInnosEye_06_01"); //Sì, qui.
	
		TEXT_Innoseye_Setting = TEXT_Innoseye_Setting_Repaired;
		CreateInvItems (other,ItMi_InnosEye_Broken_Mis,1);
		AI_PrintScreen (Print_InnoseyeGet, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);
	
		AI_Output			(self, other, "DIA_Bennet_GetInnosEye_06_02"); //Ho dovuto creare una nuova montatura per la pietra.
		AI_Output			(self, other, "DIA_Bennet_GetInnosEye_06_03"); //Ci ho lavorato tutta la notte e ora è come nuovo.
		
		B_LogEntry (TOPIC_INNOSEYE, "L'amuleto è nuovamente intero. Bennet ha fatto un buon lavoro.");
		
		MIS_Bennet_InnosEyeRepairedSetting   = LOG_SUCCESS;
		
		B_GivePlayerXP (XP_InnosEyeIsRepaired);
	}
	else
	{	//Hack Mattes
		B_SayBennetLATER();
		//AI_Output			(self, other, "DIA_Bennet_GetInnosEye_06_04"); //Nein, noch nicht. Komm später wieder.
		AI_Output			(self, other, "DIA_Bennet_GetInnosEye_06_05"); //Se continui a interrompere il mio lavoro, ci vorrà più tempo.
		
		AI_StopProcessInfos (self);
	};	 
};

//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Bennet_KAP4_EXIT(C_INFO)
{
	npc			= SLD_809_Bennet;
	nr			= 999;
	condition	= DIA_Bennet_KAP4_EXIT_Condition;
	information	= DIA_Bennet_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Bennet_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bennet_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Dracheneier
///////////////////////////////////////////////////////////////////////
instance DIA_Bennet_DRACHENEIER		(C_INFO)
{
	npc		 = 	SLD_809_Bennet;
	nr		 = 	5;
	condition	 = 	DIA_Bennet_DRACHENEIER_Condition;
	information	 = 	DIA_Bennet_DRACHENEIER_Info;
	permanent	 = 	TRUE;

	description	 = 	"Cosa puoi fare con le uova di drago?";
};

func int DIA_Bennet_DRACHENEIER_Condition ()
{
	if (Kapitel >= 4)
	&& (BennetsDragonEggOffer == 0)
	&& (Npc_HasItems (other,ItAt_DragonEgg_MIS) >= 1)
	&& (hero.guild == GIL_DJG)
		{
				return TRUE;
		};
};
var int BennetsDragonEggOffer;
var int DRACHENEIER_angebotenXP_OneTime;
func void DIA_Bennet_DRACHENEIER_Info ()
{
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_15_00"); //Cosa puoi fare con le uova di drago?
	if (DRACHENEIER_angebotenXP_OneTime == FALSE)
	{
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_01"); //Uova di drago? Come diavolo le hai avute?
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_15_02"); //Le ho prese da alcuni uomini lucertola.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_03"); //Fammi vedere.
	};

	Npc_RemoveInvItems	(other,	ItAt_DragonEgg_MIS,	1);
	AI_PrintScreen (PRINT_ItemGegeben, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);	// "1 Gegenstand gegeben"	

	if (DRACHENEIER_angebotenXP_OneTime == FALSE)
	{
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_04"); //Mmmh, un materiale molto resistente. Ideale per rifinire le armature. Se si riusciranno ad aprire, naturalmente.
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_15_05"); //Che mi dici, allora? Le vuoi?
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_06"); //Sicuro! Da' qui.
	}
	else
	{
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_07"); //Quante altre volte vuoi farmi vedere quella dannata roba? Vuoi che le compri o no?
	};

	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_08"); //Ti pagherò, mmh... diciamo 300 monete d'oro per ogni uovo che mi porterai.

	Info_ClearChoices	(DIA_Bennet_DRACHENEIER);
	Info_AddChoice	(DIA_Bennet_DRACHENEIER, "Risparmia il tuo oro, allora. Penso che le terrò.", DIA_Bennet_DRACHENEIER_nein );
	Info_AddChoice	(DIA_Bennet_DRACHENEIER, "Queste uova di drago non sono come le comuni uova di gallina.", DIA_Bennet_DRACHENEIER_mehr );
	Info_AddChoice	(DIA_Bennet_DRACHENEIER, "Affare fatto.", DIA_Bennet_DRACHENEIER_ok );

	IF (DRACHENEIER_angebotenXP_OneTime == FALSE)
	{
	B_LogEntry (TOPIC_DRACHENEIER,"Bennet è disposto a comprare per un buon prezzo tutte le uova di drago che riuscirò a trovare."); 
	B_GivePlayerXP (XP_DJG_BringDragonEgg);
	DRACHENEIER_angebotenXP_OneTime = TRUE;
	};
};
func void DIA_Bennet_DRACHENEIER_ok ()
{
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_ok_15_00"); //Affare fatto.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_01"); //D'accordo.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_02"); //Allora continua a portarmi quelle cose quando le trovi.

	if (BennetsDragonEggOffer != 350)
	{
		BennetsDragonEggOffer = 300;	
	};

	CreateInvItems (self, ItMi_Gold, BennetsDragonEggOffer);									
	B_GiveInvItems (self, other, ItMi_Gold,	BennetsDragonEggOffer);

	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_03"); //Ehm, hai detto che le hai prese dagli uomini lucertola?
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_ok_15_04"); //Esatto.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_05"); //Per quello che ne so, la maggior parte degli uomini lucertola vive nelle caverne.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_06"); //Non sarei sorpreso se tu trovassi altre di queste cose nelle caverne qui attorno.
	B_LogEntry (TOPIC_DRACHENEIER,"Bennet pensa che potrei trovare delle uova nelle caverne di Khorinis. Ci dovrebbero essere degli uomini lucertola in molte caverne."); 
	
	AI_Output (self, other, "DIA_Bennet_DRACHENEIER_ok_06_07"); //Ecco, tieni questa mappa. Ti aiuterà a trovare le caverne.
	CreateInvItems (self, ItWr_Map_Caves_MIS, 1);									
	B_GiveInvItems (self, other, ItWr_Map_Caves_MIS,1);
	B_LogEntry (TOPIC_DRACHENEIER,"Mi ha dato una mappa per aiutarmi."); 
	
	if (1 == 2) //MH: Besser Karte direkt (war sowieso so - wegen Bug)
	{
		AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_08"); //Ma prima devi comprare una mappa delle caverne da un cartografo in città. Sarebbe un peccato se tu non riuscissi a trovarle tutte.
		B_LogEntry (TOPIC_DRACHENEIER,"Dovrei comprare una mappa delle caverne dal cartografo della città, tanto per essere sicuro di non perdere alcun uovo."); 
	};
	
	Info_ClearChoices	(DIA_Bennet_DRACHENEIER);
};

func void DIA_Bennet_DRACHENEIER_mehr ()
{
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_mehr_15_00"); //Queste uova di drago non sono come le comuni uova di gallina.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_mehr_06_01"); //(esasperato) D'accordo, facciamo 350. Ma non posso darti più di così, o non ci guadagnerò nulla.
	BennetsDragonEggOffer =	350;
};

func void DIA_Bennet_DRACHENEIER_nein ()
{
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_nein_15_00"); //Risparmia il tuo oro, allora. Penso che le terrò.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_nein_06_01"); //Fammi sapere quando cambierai idea.

	CreateInvItems (other, ItAt_DragonEgg_MIS, 1);									
	AI_PrintScreen	(PRINT_ItemErhalten, -1, YPOS_ItemTaken, FONT_ScreenSmall, 2);	// "1 Gegenstand erhalten"

	BennetsDragonEggOffer = 0;
	Info_ClearChoices	(DIA_Bennet_DRACHENEIER);
};

///////////////////////////////////////////////////////////////////////
//	Info EierBringen
///////////////////////////////////////////////////////////////////////
instance DIA_Bennet_EierBringen		(C_INFO)
{
	npc		 = 	SLD_809_Bennet;
	nr		 = 	5;
	condition	 = 	DIA_Bennet_EierBringen_Condition;
	information	 = 	DIA_Bennet_EierBringen_Info;
	permanent	 = 	TRUE;

	description	 = 	"Ti interessano altre uova di drago?";
};

func int DIA_Bennet_EierBringen_Condition ()
{
	if (BennetsDragonEggOffer > 0)
	&& (Kapitel >= 4)
	&& (Npc_HasItems (other,ItAt_DragonEgg_MIS) >= 1)
	&& (hero.guild == GIL_DJG)
		{
				return TRUE;
		};
};

var int DragonEggCounter;

func void DIA_Bennet_EierBringen_Info ()
{
	AI_Output			(other, self, "DIA_Bennet_EierBringen_15_00"); //Ti interessano altre uova di drago?
	AI_Output			(self, other, "DIA_Bennet_EierBringen_06_01"); //Certo!

	var int DragonEggCount;
	var int XP_DJG_BringDragonEggs;
	var int DragonEggGeld;
	var string concatText;
	
	DragonEggCount = Npc_HasItems(other, ItAt_DragonEgg_MIS);


	if (DragonEggCount == 1)
		{
			AI_Output		(other, self, "DIA_Bennet_EierBringen_15_02"); //Ecco, ne ho un altro.
			B_GivePlayerXP (XP_DJG_BringDragonEgg);
			Npc_RemoveInvItems	(other,	ItAt_DragonEgg_MIS,	1);
			AI_PrintScreen (PRINT_ItemGegeben, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);	// "1 Gegenstand gegeben"	
			DragonEggCounter = DragonEggCounter + 1;
		}
		else
		{
			AI_Output		(other, self, "DIA_Bennet_EierBringen_15_03"); //Ne ho alcune qui.

			Npc_RemoveInvItems	(other,	ItAt_DragonEgg_MIS,	DragonEggCount);
			concatText = ConcatStrings(IntToString(DragonEggCount), PRINT_ItemsGegeben);		// "x Gegenstände gegeben"
			AI_PrintScreen (concatText, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);

			XP_DJG_BringDragonEggs = (DragonEggCount * XP_DJG_BringDragonEgg);
			DragonEggCounter = (DragonEggCounter + DragonEggCount); 

			B_GivePlayerXP (XP_DJG_BringDragonEggs);
		};

	if (DragonEggCounter <= 7)
	{
		AI_Output			(self, other, "DIA_Bennet_EierBringen_06_04"); //Ottimo. Da' qua. Hai guardato ovunque, allora? Devono essercene sicuramente delle altre.
	}
	else if	(DragonEggCounter <= 11)
	{
		AI_Output			(self, other, "DIA_Bennet_EierBringen_06_05"); //Dove hai trovato quelle cose? Non possono essercene ancora altre.
	}
	else
	{
		AI_Output			(self, other, "DIA_Bennet_EierBringen_06_06"); //Non credo ne troverai molte altre ora. E io ne ho già così tante che non so quasi cosa farmene.
		TOPIC_END_DRACHENEIER = TRUE;
	};

	AI_Output			(self, other, "DIA_Bennet_EierBringen_06_07"); //Oh, d'accordo. Ecco i tuoi soldi.

	DragonEggGeld	= (DragonEggCount * BennetsDragonEggOffer);

	CreateInvItems (self, ItMi_Gold, DragonEggGeld); 
	B_GiveInvItems (self, other, ItMi_Gold, DragonEggGeld);
};


//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Bennet_KAP5_EXIT(C_INFO)
{
	npc			= SLD_809_Bennet;
	nr			= 999;
	condition	= DIA_Bennet_KAP5_EXIT_Condition;
	information	= DIA_Bennet_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Bennet_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bennet_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Ich weiss wo der Feind ist.
///////////////////////////////////////////////////////////////////////
instance DIA_Bennet_KnowWhereEnemy		(C_INFO)
{
	npc			 = 	SLD_809_Bennet;
	nr			 = 	55;
	condition	 = 	DIA_Bennet_KnowWhereEnemy_Condition;
	information	 = 	DIA_Bennet_KnowWhereEnemy_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Devo recarmi su un’isola. Potrei servirmi di un fabbro.";
};
func int DIA_Bennet_KnowWhereEnemy_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Bennet_IsOnBoard == FALSE) 
	{
		return TRUE;
	};
};
func void DIA_Bennet_KnowWhereEnemy_Info ()
{
	AI_Output			(other, self, "DIA_Bennet_KnowWhereEnemy_15_00"); //Devo recarmi su un’isola. Potrei servirmi di un fabbro.
	AI_Output			(self, other, "DIA_Bennet_KnowWhereEnemy_06_01"); //E quindi hai pensato a me?
	AI_Output			(other, self, "DIA_Bennet_KnowWhereEnemy_15_02"); //Sì. Cosa ne dici? Ad ogni modo, questo ti permetterebbe di andartene da qui.
	AI_Output			(self, other, "DIA_Bennet_KnowWhereEnemy_06_03"); //Meglio che la fattoria di Onar. Ragazzo, neanche l'inferno potrebbe essere COSÌ brutto!
	
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);   
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 
	B_LogEntry (TOPIC_Crew,"Bennet potrebbe partire da un momento all'altro. La sua abilità come fabbro è impareggiabile. Sono sicuro che potrei imparare molto da lui.");
		
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Bennet_KnowWhereEnemy_15_04"); //Il mio equipaggio è già completo al momento.
		AI_Output			(self, other, "DIA_Bennet_KnowWhereEnemy_06_05"); //Allora fai in modo di mandare via qualcuno.
	}
	else 
	{
		Info_ClearChoices (DIA_Bennet_KnowWhereEnemy);
		Info_AddChoice (DIA_Bennet_KnowWhereEnemy,"Ti farò sapere quando avrò bisogno di te.",DIA_Bennet_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Bennet_KnowWhereEnemy,"Allora, ti nomino mio fabbro. Ci vediamo al porto.",DIA_Bennet_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Bennet_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Bennet_KnowWhereEnemy_Yes_15_00"); //Allora, ti nomino mio fabbro. Ci vediamo al porto.
	AI_Output (self ,other,"DIA_Bennet_KnowWhereEnemy_Yes_06_01"); //Va bene. Ci vediamo dopo.
	
	B_GivePlayerXP (XP_Crewmember_Success); 
	
	
	self.flags 		 = NPC_FLAG_IMMORTAL;
	Bennet_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	
	if (MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine (self,"SHIP"); 
		}
		else
		{
			Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
		};

	Info_ClearChoices (DIA_Bennet_KnowWhereEnemy);
};

FUNC VOID DIA_Bennet_KnowWhereEnemy_No ()
{
	AI_Output (other,self ,"DIA_Bennet_KnowWhereEnemy_No_15_00"); //Ti farò sapere quando avrò bisogno di te.
	AI_Output (self ,other,"DIA_Bennet_KnowWhereEnemy_No_06_01"); //D'accordo. Io sono qui.

	Bennet_IsOnBoard	 = LOG_OBSOLETE;
	Info_ClearChoices (DIA_Bennet_KnowWhereEnemy);
};

///////////////////////////////////////////////////////////////////////
//	I kann dich doch nicht gebrauchen!
///////////////////////////////////////////////////////////////////////
instance DIA_Bennet_LeaveMyShip		(C_INFO)
{
	npc			 = 	SLD_809_Bennet;
	nr			 = 	55;
	condition	 = 	DIA_Bennet_LeaveMyShip_Condition;
	information	 = 	DIA_Bennet_LeaveMyShip_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Mi troverò un altro fabbro.";
};
func int DIA_Bennet_LeaveMyShip_Condition ()
{	
	if (Bennet_IsOnBOard == LOG_SUCCESS)
	&& (MIS_ReadyforChapter6 == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Bennet_LeaveMyShip_Info ()
{
	AI_Output			(other, self, "DIA_Bennet_LeaveMyShip_15_00"); //Mi troverò un altro fabbro.
	AI_Output			(self, other, "DIA_Bennet_LeaveMyShip_06_01"); //Dici una cosa e cambi idea un minuto dopo. Cerca di deciderti! Quando avrai capito cosa vuoi, fammelo sapere.
	
	Bennet_IsOnBoard	 = LOG_OBSOLETE;				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	crewmember_Count = (Crewmember_Count -1);
	
	Npc_ExchangeRoutine (self,"Start"); 
};

///////////////////////////////////////////////////////////////////////
//	Ich habs mir überlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_Bennet_StillNeedYou		(C_INFO)
{
	npc			 = 	SLD_809_Bennet;
	nr			 = 	55;
	condition	 = 	DIA_Bennet_StillNeedYou_Condition;
	information	 = 	DIA_Bennet_StillNeedYou_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Torna indietro. Non riesco a trovare altri fabbri.";
};

func int DIA_Bennet_StillNeedYou_Condition ()
{	
	if ((Bennet_IsOnBOard == LOG_OBSOLETE)	
	|| (Bennet_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew)
	{
		return TRUE;
	};
};

func void DIA_Bennet_StillNeedYou_Info ()
{
	AI_Output	(other, self, "DIA_Bennet_StillNeedYou_15_00"); //Torna indietro. Non riesco a trovare altri fabbri.
	AI_Output	(self, other, "DIA_Bennet_StillNeedYou_06_01"); //(irritato) D'accordo! Sono solo io, quindi che importa? Ci vediamo al porto più tardi.
		
	self.flags 		 = NPC_FLAG_IMMORTAL;
	Bennet_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	
	AI_StopProcessInfos (self);

		if (MIS_ReadyforChapter6 == TRUE)
			{
				Npc_ExchangeRoutine (self,"SHIP"); 
			}
			else
			{
				Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
			};
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Bennet_PICKPOCKET (C_INFO)
{
	npc			= SLD_809_Bennet;
	nr			= 900;
	condition	= DIA_Bennet_PICKPOCKET_Condition;
	information	= DIA_Bennet_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Bennet_PICKPOCKET_Condition()
{
	C_Beklauen (35, 45);
};
 
FUNC VOID DIA_Bennet_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Bennet_PICKPOCKET);
	Info_AddChoice		(DIA_Bennet_PICKPOCKET, DIALOG_BACK 		,DIA_Bennet_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Bennet_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Bennet_PICKPOCKET_DoIt);
};

func void DIA_Bennet_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Bennet_PICKPOCKET);
};
	
func void DIA_Bennet_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Bennet_PICKPOCKET);
};


























