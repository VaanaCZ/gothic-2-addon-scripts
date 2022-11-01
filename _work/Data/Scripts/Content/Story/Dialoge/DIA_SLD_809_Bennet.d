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
	AI_Output (self, other, "DIA_Bennet_HALLO_06_00"); //No vendo armas. Khaled lo hace. Está en la casa, con Onar.
	
	Log_CreateTopic (Topic_SoldierTrader,LOG_NOTE);
	B_LogEntry (Topic_SoldierTrader,"Khaled es comerciante de armas.");
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
	description	= "¿Y qué hay de fabricar equipo?";
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
	AI_Output (other, self, "DIA_Bennet_TRADE_15_00"); //¿Y qué hay de fabricar equipo?
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

	AI_Output (self, other, "DIA_Bennet_TRADE_06_01"); //¿Qué es lo que necesitas?
	
	if (BennetLOG == FALSE)
	{
		Log_CreateTopic (Topic_SoldierTrader,LOG_NOTE);
		B_LogEntry (Topic_SoldierTrader,"Bennet vende equipo de herrero.");
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
	description	= "¿Qué tipo de armas haces?";
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
	AI_Output (other, self, "DIA_Bennet_WhichWeapons_15_00"); //¿Qué tipo de armas haces?
	AI_Output (self, other, "DIA_Bennet_WhichWeapons_06_01"); //Por el momento espadas normales, no mucho más.
	AI_Output (self, other, "DIA_Bennet_WhichWeapons_06_02"); //Pero si tuviera algo de mineral mágico podría crear armas mejores que sus contrapartidas de acero normal.
	AI_Output (self, other, "DIA_Bennet_WhichWeapons_06_03"); //¿Por casualidad no sabrás dónde encontrar un poco? (Se ríe) Es decir, aparte del Valle de las Minas.
	AI_Output (other, self, "DIA_Bennet_WhichWeapons_15_04"); //No.
	AI_Output (self, other, "DIA_Bennet_WhichWeapons_06_05"); //Claro que no.
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
	description	= "¿Estás con los granjeros o con los mercenarios?";
};

func int DIA_Bennet_BauOrSld_Condition ()
{
	return TRUE;
};

func void DIA_Bennet_BauOrSld_Info ()
{
	AI_Output (other, self, "DIA_Bennet_BauOrSld_15_00"); //¿Estás con los granjeros o con los mercenarios?
	AI_Output (self, other, "DIA_Bennet_BauOrSld_06_01"); //Me estás tomando el pelo, ¿verdad?
	AI_Output (other, self, "DIA_Bennet_BauOrSld_15_02"); //Sentía curiosidad.
	AI_Output (self, other, "DIA_Bennet_BauOrSld_06_03"); //¿Has visto alguna vez un granjero que forje armas?
	AI_Output (other, self, "DIA_Bennet_BauOrSld_15_04"); //No.
	AI_Output (self, other, "DIA_Bennet_BauOrSld_06_05"); //¿Entonces por qué haces preguntas tan tontas?
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
	description	= "¡Quiero unirme a los mercenarios!";
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
	AI_Output (other, self, "DIA_Bennet_WannaJoin_15_00"); //¡Quiero unirme a los mercenarios!
	AI_Output (self, other, "DIA_Bennet_WannaJoin_06_01"); //Entonces deja de parlotear y busca a Torlof. Él te pondrá a prueba.
	if (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
	|| (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
	{
		AI_Output (other, self, "DIA_Bennet_WannaJoin_15_02"); //He superado la prueba.
		AI_Output (self, other, "DIA_Bennet_WannaJoin_06_03"); //Bien, entonces votaré por ti.
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
	description	= "¿Me puedes enseñar a forjar una espada?";
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
	AI_Output (other, self, "DIA_Bennet_WannaSmith_15_00"); //¿Me puedes enseñar a forjar una espada?
	AI_Output (self, other, "DIA_Bennet_WannaSmith_06_01"); //Claro.
	AI_Output (self, other, "DIA_Bennet_WannaSmith_06_02"); //Pero te costará algo. Digamos, 30 piezas de oro.
	
	Info_ClearChoices (DIA_Bennet_WannaSmith);
	Info_AddChoice (DIA_Bennet_WannaSmith, "Tal vez más adelante.", DIA_Bennet_WannaSmith_Later);
	Info_AddChoice (DIA_Bennet_WannaSmith, "Bien, toma las 30 piezas de oro.", DIA_Bennet_WannaSmith_Pay);
};

func void DIA_Bennet_WannaSmith_Pay()
{
	AI_Output (other, self, "DIA_Bennet_WannaSmith_Pay_15_00"); //Bien, toma las 30 piezas de oro.
	
	if (B_GiveInvItems (other, self, itmi_gold, 30))
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmith_Pay_06_01"); //¡Desde luego era un buen precio! Podemos empezar en cuanto estés listo.
		
		Bennet_TeachCommon = TRUE;
		Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
		B_LogEntry (Topic_SoldierTeacher,"Bennet puede enseñarme el arte de la herrería.");
	}
	else
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmith_Pay_06_02"); //Deja de tomarme el pelo. 30, ni una menos.
	};
	Info_ClearChoices (DIA_Bennet_WannaSmith);
};

func void DIA_Bennet_WannaSmith_Later()
{
	AI_Output (other, self, "DIA_Bennet_WannaSmith_Later_15_00"); //Tal vez más adelante.
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
	description	= B_BuildLearnString("Aprender a forjar", B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_Common));
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
	AI_Output (other, self, "DIA_Bennet_TeachCOMMON_15_00"); //¡Enséñame a forjar una espada!
	
	if (B_TeachPlayerTalentSmith (self, other, WEAPON_Common))
	{
		AI_Output (self, other, "DIA_Bennet_TeachCOMMON_06_01"); //Es sencillo: hazte con un trozo de acero en bruto y caliéntalo hasta que se ponga al rojo.
		AI_Output (self, other, "DIA_Bennet_TeachCOMMON_06_02"); //Ponlo entonces en el yunque y martilléalo hasta que la hoja tome forma.
		AI_Output (self, other, "DIA_Bennet_TeachCOMMON_06_03"); //Lo más importante es que la hoja no se enfríe demasiado. Solo tienes unos cuantos minutos para trabajar en el arma.
		AI_Output (self, other, "DIA_Bennet_TeachCOMMON_06_04"); //El resto lo puedes descubrir tú mismo. No es más que cuestión de práctica.
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
	description	= "¡Enséñame a forjar armas de mineral mágico!";
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
	AI_Output (other, self, "DIA_Bennet_WannaSmithORE_15_00"); //¡Enséñame a forjar armas de mineral mágico!
		
	if (PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_01"); //Pero si ni siquiera sabes lo básico.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_02"); //Lo primero es que aprendas a forjar una espada decente. Luego ya veremos.
	}
	else if (other.guild != GIL_SLD)
	&& 		(other.guild != GIL_DJG)
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_03"); //Mientras no seas uno de los nuestros, así me muera si te cuento el secreto de las armas de mineral mágico.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_04"); //Solo lo conocen unos pocos herreros y, créeme, ni siquiera los de la ciudad saben de él.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_05"); //Y es bueno que así sea. De otra forma, esos borrachos de la guardia de la ciudad llevarían todos armas mágicas.
		if (other.guild == GIL_MIL)
		{	
			AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_06"); //No tengo nada contra ti. (Sonríe) Pareces buen tipo.
		};
	}
	else if (MIS_Bennet_BringOre != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_07"); //Si tuviera mineral mágico, podría hacerlo.
		AI_Output (other, self, "DIA_Bennet_WannaSmithORE_15_08");//Ah, vamos, estoy con los mercenarios y sé forjar, ¿qué más quieres?
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_09"); //¿Me puedes decir cómo se supone que voy a forjar una espada de mineral mágico si no tengo mineral mágico?
		AI_Output (other, self, "DIA_Bennet_WannaSmithORE_15_10");//Bueeeeno...
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_11"); //Eso es lo que pensaba. Necesito al menos 10 trozos de mineral, o te puedes ir olvidando.
		if (MIS_Bennet_BringOre == FALSE)
		{
			MIS_Bennet_BringOre = LOG_RUNNING;
		};
	}
	else //alles OK
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_12"); //Estupendo, me traes el mineral y también sabes forjar una espada decente.
		AI_Output (other, self, "DIA_Bennet_WannaSmithORE_15_13");//Bien, entonces adelante...
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_14"); //Lo más importante es que da igual si tu arma está hecha completamente de mineral mágico o solo está cubierta de él. Es la superficie lo que importa.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_15"); //Y como el material es caro, coge una barra de acero y unos cuantos trozos de mineral.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_16"); //Por supuesto, no sirve de nada cubrir con mineral mágico un arma terminada. Tendrás que forjar tú mismo el arma desde cero.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_17"); //Todo lo demás depende del arma que quieras crear.
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
	description	= "¿Dónde puedo encontrar mineral mágico?";
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
	AI_Output (other, self, "DIA_Bennet_WhereOre_15_00"); //¿Dónde puedo encontrar mineral mágico?
	AI_Output (self, other, "DIA_Bennet_WhereOre_06_01"); //Ojalá lo supiera. Seguramente habrá algo en la colonia minera.
	AI_Output (self, other, "DIA_Bennet_WhereOre_06_02"); //Pero si tienes suerte, puede que encuentres algo por aquí cerca.
	AI_Output (self, other, "DIA_Bennet_WhereOre_06_03"); //Creo que hay algunas galerías de minas en las montañas al sur de aquí. A lo mejor tienes suerte.
	AI_Output (self, other, "DIA_Bennet_WhereOre_06_04"); //Pero cuidado, he oído que por allí hay bandidos.
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
	description	= "Aquí tienes: 5 pepitas de oro.";
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
	AI_Output (other, self, "DIA_Bennet_BringOre_15_00"); //Aquí tienes.
	AI_Output (self, other, "DIA_Bennet_BringOre_06_01"); //(Se ríe) ¡Veamos!
	B_GiveInvItems (other, self, itmi_nugget, 5);
	AI_Output (self, other, "DIA_Bennet_BringOre_06_02"); //¡Increíble! ¡Que me aspen!
	AI_Output (self, other, "DIA_Bennet_BringOre_06_03"); //Puedes quedarte dos de éstas. Las necesitarás para forjar tu propia arma.
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
	AI_Output	(self, other, "DIA_Bennet_GetInnosEye_06_04"); //No, todavía no. Vuelve más tarde.
};
instance DIA_Bennet_TeachSmith		(C_INFO)
{
	npc		 	= SLD_809_Bennet;
	nr		 	= 30;
	condition	= DIA_Bennet_TeachSmith_Condition;
	information	= DIA_Bennet_TeachSmith_Info;
	permanent	= TRUE;
	description	= "Quiero saber más acerca de la forja de armas de mineral mágico.";
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
	AI_Output (other, self, "DIA_Bennet_TeachSmith_15_00"); //Quiero saber más acerca de la forja de armas de mineral mágico.
	
	if (Kapitel == 1)//HACK Mattes  
	{
		B_SayBennetLATER();
	}
	else if (Kapitel == 2)
	&& (Bennet_Kap2Smith == FALSE)
	{
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_01"); //Te puedo enseñar cómo forjar espadas de mineral mágico e incluso hojas para llevar a dos manos.
		Bennet_Kap2Smith = TRUE;
	}
	else if (Kapitel == 3)
	&& (MIS_ReadyForChapter4 == FALSE)
	&& (Bennet_Kap3Smith == FALSE)
	{
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_02"); //He mejorado mi técnica. Ahora puedo enseñarte a crear espadas bastardas o mandobles pesados con mineral.
		Bennet_Kap3Smith = TRUE;
	}
	else if (MIS_ReadyForChapter4 == TRUE)
	&& (Kapitel < 5)
	&& (Bennet_Kap4Smith == FALSE)
	{
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_03"); //Creo que esta vez me he superado. He diseñado dos espadas de batalla. Es lo mejor que he visto hasta ahora.
		Bennet_Kap4Smith = TRUE;
	}
	else if (Kapitel >= 5)
	&& (Bennet_Kap5Smith == FALSE)
	{
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_04"); //Escucha. Creo que se me ha ocurrido una idea genial. Armas de mineral mágico, cubiertas de sangre de dragón. ¡Y sé cómo hacerlo exactamente!
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_05"); //(Sonríe) ¿Quieres saberlo?
		Bennet_Kap5Smith = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_06"); //¿Qué tipo de arma querrías crear?
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
	description	 = 	"¿Cómo acabaste en la trena?";
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
	AI_Output	(other, self ,"DIA_Bennet_WhyPrison_15_00"); //¿Cómo es que estás en chirona?
	AI_Output	(self , other,"DIA_Bennet_WhyPrison_06_01"); //Me han metido esos cerdos. Se supone que he asesinado a un paladín.
	AI_Output 	(self ,other ,"DIA_Bennet_WhyPrison_06_02"); //Pero no es cierto, solo intentan incriminarme de manera falsa.
	AI_Output	(other, self ,"DIA_Bennet_WhyPrison_15_03"); //¿Por qué iban a hacerlo?
	AI_Output 	(self ,other ,"DIA_Bennet_WhyPrison_06_04"); //¿Y yo qué sé? Tienes que sacarme de aquí.
	AI_Output 	(self ,other ,"DIA_Bennet_WhyPrison_06_05"); //Habla con lord Hagen, derriba los muros, lo que sea, ¡pero haz algo!
	
	MIS_RescueBennet = LOG_RUNNING; 
	Log_CreateTopic (TOPIC_RESCUEBENNET, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RESCUEBENNET, LOG_RUNNING);
	B_LogEntry (TOPIC_RESCUEBENNET,"Bennet está metido en problemas. Hará lo que sea para salir de la trena."); 
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
	description	 = 	"¿Qué ha pasado?";
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
	AI_Output	(other, self ,"DIA_Bennet_WhatHappened_15_00"); //¿Qué ha pasado?
	AI_Output	(self , other,"DIA_Bennet_WhatHappened_06_01"); //Fui al centro de la ciudad con Hodges a comprar provisiones para nuestros muchachos.
	AI_Output 	(self ,other ,"DIA_Bennet_WhatHappened_06_02"); //De repente, oímos un grito y el sonido de alguien corriendo.
	AI_Output	(other, self ,"DIA_Bennet_WhatHappened_15_03"); //Ve al grano.
	AI_Output 	(self ,other ,"DIA_Bennet_WhatHappened_06_04"); //Nos dimos cuenta de que había pasado algo y de que nos cogerían si nos veían allí.
	AI_Output 	(self ,other ,"DIA_Bennet_WhatHappened_06_05"); //Corrimos como locos. Entonces, justo antes de llegar a la puerta de la ciudad, tropecé y me torcí el tobillo.
	AI_Output 	(self ,other ,"DIA_Bennet_WhatHappened_06_06"); //El resto se cuenta rápido. La milicia me cogió y me metió en chirona.
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
	description	 = 	"¿A quién asesinaron?";
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
	AI_Output	(other, self ,"DIA_Bennet_Victim_15_00"); //¿A quién asesinaron?
	AI_Output	(self , other,"DIA_Bennet_Victim_06_01"); //No tengo ni idea... a uno de los paladines, pero no lo conozco.
	AI_Output	(other, self ,"DIA_Bennet_Victim_15_02"); //¿Me puedes dar un nombre?
	AI_Output 	(self ,other ,"DIA_Bennet_Victim_06_03"); //A un tal Lothar, creo. Bueno, no sé, no estoy seguro.
	AI_Output 	(self ,other ,"DIA_Bennet_Victim_06_04"); //Harías bien en preguntar a lord Hagen, pues conoce todos los detalles.

	B_LogEntry (TOPIC_RESCUEBENNET,"Lothar, uno de los paladines, ha sido asesinado. Lord Hagen debería poder decirme más, es el encargado de las investigaciones.");
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
	description	 = 	"¿Tienen alguna prueba contra ti?";
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
	AI_Output	(other, self ,"DIA_Bennet_Evidence_15_00"); //¿Tienen alguna prueba contra ti?
	AI_Output	(self , other,"DIA_Bennet_Evidence_06_01"); //Dicen que tienen un testigo que me ha identificado.
	AI_Output	(other, self ,"DIA_Bennet_Evidence_15_02"); //¿Sabes quién es?
	AI_Output 	(self ,other ,"DIA_Bennet_Evidence_06_03"); //No. Solo sé que miente.
	
	B_LogEntry (TOPIC_RESCUEBENNET,"Hay un testigo que asegura haber visto a Bennet. Tengo que encontrarlo y descubrir la verdad.");
	
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
	description	 = 	"¿Quién lleva la investigación?";
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
	AI_Output	(other, self ,"DIA_Bennet_Investigation_15_00"); //¿Quién lleva la investigación?
	AI_Output	(self , other,"DIA_Bennet_Investigation_06_01"); //El mismo lord Hagen. Como la víctima era uno de sus paladines, pertenece a la jurisdicción militar.
	AI_Output	(other, self ,"DIA_Bennet_Investigation_15_02"); //¿Y eso qué significa?
	AI_Output 	(self ,other ,"DIA_Bennet_Investigation_06_03"); //Es fácil deducirlo. Si no me sacas de aquí me van a colgar sin más.
	AI_Output 	(self ,other ,"DIA_Bennet_Investigation_06_04"); //Tienes que ayudarme o estallará una guerra. Lee no va a permitirlo sin pelear.
	AI_Output 	(self ,other ,"DIA_Bennet_Investigation_06_05"); //Y te puedes imaginar lo que eso significa.
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

	AI_Output	(self ,other,"DIA_Bennet_ThankYou_06_00"); //Caramba, ¡y yo que pensaba que me iban a colgar!
	AI_Output	(other,self ,"DIA_Bennet_ThankYou_15_01"); //Bueno, al final todo ha salido bien.
	AI_Output 	(self ,other,"DIA_Bennet_ThankYou_06_02"); //Puedes jurarlo. ¡Deberías haber visto la cara del soldado cuando tuvo que soltarme!
	AI_Output 	(self ,other,"DIA_Bennet_ThankYou_06_03"); //(Se ríe) Estaba tan asustado que casi se lo hace en los pantalones.
	AI_Output 	(self ,other,"DIA_Bennet_ThankYou_06_04"); //Lo que me recuerda que tengo algo para ti.
	AI_Output	(other,self ,"DIA_Bennet_ThankYou_15_05"); //¿Qué quieres decir?
	AI_Output 	(self ,other,"DIA_Bennet_ThankYou_06_06"); //(Sonríe) Un regalo.
	
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
	description	 =	"¿Qué regalo?";
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
	AI_Output	(other,self ,"DIA_Bennet_Present_15_00"); //¿Qué regalo?
	
	AI_Output 	(self ,other,"DIA_Bennet_Present_06_01"); //Hemos oído hablar de los dragones que se supone que están en el valle.
	AI_Output	(other,self ,"DIA_Bennet_Present_15_02"); //¡Están allí de verdad!
	AI_Output 	(self ,other,"DIA_Bennet_Present_06_03"); //De acuerdo, te creo.
	
	if (hero.guild == GIL_DJG)
	{
			
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_04"); //De todas maneras, algunos de los chicos han decidido ir también al valle.
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_05"); //(Sonríe) Planean, ''ordenar'' un poco las cosas por allí.
		AI_Output	(other,self ,"DIA_Bennet_Present_15_06"); //¿Qué tiene eso que ver conmigo?
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_07"); //(Con orgullo) He fabricado un nuevo tipo de armadura. ¡La armadura del cazador de dragones!
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_08"); //Es más resistente y ligera que la armadura tradicional.
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_09"); //Como eres el que me ha salvado, quiero que tengas la primera. ¡Es un regalo!
			
		CreateInvItems (self,ITAR_DJG_L,1);
		B_GiveInvItems (self,other,ITAR_DJG_L,1);
			
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_10"); //Pensé que no querrías perderte la diversión. Y en el valle vas a necesitar el mejor equipo.
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_11"); //Además, estoy interesado en conseguir escamas de dragón. Escamas de dragón de verdad. Te pagaré un buen precio por ellas.
		AI_Output	(other,self ,"DIA_Bennet_Present_15_12"); //¿Cuánto sacaré por cada una?
		B_Say_Gold (self,other,Value_DragonScale); 
	}
	else
	{
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_13"); //Bueno, pensé que querrías participar en la inminente cacería de dragones.
		AI_Output	(other,self ,"DIA_Bennet_Present_15_14"); //¿Y?
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_15"); //Toma este amuleto. Creo que lo vas a necesitar más que yo.
	
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
	description	 =	"Tengo unas cuantas escamas de dragón.";
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
	AI_Output	(other,self ,"DIA_Bennet_DragonScale_15_00"); //Tengo unas cuantas escamas de dragón para ti.
	AI_Output 	(self ,other,"DIA_Bennet_DragonScale_06_01"); //¡Escamas de dragón de verdad!
	AI_Output 	(self ,other,"DIA_Bennet_DragonScale_06_02"); //¡Toma tu oro!
	
	Bennet_DragonScale_Counter = (Bennet_DragonScale_Counter +(Npc_HasItems (other,ItAT_Dragonscale)));
	
	B_GiveInvItems (self ,other,ItMi_Gold,(Npc_HasItems(other,ItAT_Dragonscale) * Value_DragonScale) ); 
	B_GiveInvItems (other,self ,ItAt_Dragonscale,(Npc_HasItems (other,ItAT_Dragonscale)));
	
	
	if (Bennet_DragonScale_Counter >= 20)
	&& (Show_DJG_Armor_M == FALSE)
	{
		AI_Output 	(self ,other,"DIA_Bennet_DragonScale_06_03"); //De acuerdo, debería bastar. Si quieres te puedo vender una armadura nueva y mejorada.
		
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
	description	 =	"Armadura media de cazadragones: Protección: armas 80, flechas 80 (12000)."; //Wenn ändern, dann bitte auch in der Info-Instanz. s.u.
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
	AI_Output	(other,self ,"DIA_Bennet_DJG_ARMOR_M_15_00"); //Quiero comprar la armadura.
	
	if (Npc_HasItems (other,itmi_Gold) >= 12000)
	{
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_M_06_01"); //Muy bien. Te va a encantar.
		AI_Output	(other,self ,"DIA_Bennet_DJG_ARMOR_M_15_02"); //Más vale, teniendo en cuenta su precio.
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_M_06_03"); //Descubrirás que vale cada moneda de oro que pagas.
		
		B_GiveInvItems (other,self,ItMi_Gold,12000);
		CreateInvItems (self,ITAR_DJG_M,1);
		B_GiveInvItems (self,other,ITAR_DJG_M,1);
		
		Bennet_DIA_Bennet_DJG_ARMOR_M_permanent = TRUE;
	}
	else
	{
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_M_06_04"); //No tienes oro suficiente.
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
	description	 =	"Sé cómo mejorar aún más la armadura.";
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
	AI_Output	(other,self ,"DIA_Bennet_BetterArmor_15_00"); //Sé cómo mejorar aún más la armadura.
	AI_Output 	(self ,other,"DIA_Bennet_BetterArmor_06_01"); //(Sonriendo para sí mismo) Entonces, dímelo.
	AI_Output	(other,self ,"DIA_Bennet_BetterArmor_15_02"); //Podrías cubrir las escamas de dragón con mineral mágico.
	AI_Output 	(self ,other,"DIA_Bennet_BetterArmor_06_03"); //(Se ríe) Ya se me había ocurrido a mí. Y tienes razón.
	AI_Output 	(self ,other,"DIA_Bennet_BetterArmor_06_04"); //Mi nueva armadura es la mejor que has visto en tu vida. Es ligera pero resistente.
	AI_Output 	(self ,other,"DIA_Bennet_BetterArmor_06_05"); //Es PERFECTA.
	AI_Output 	(self ,other,"DIA_Bennet_BetterArmor_06_06"); //Si quieres la puedes comprar. Esta oferta no se la hago a cualquiera y el precio solo cubre los gastos de fabricación.
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
	description	 =	"Armadura pesada de cazadragones. Protección: armas 90, flechas 90 (20000)."; //Wenn ändern, dann bitte auch in der Info-Instanz. s.u.
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
	AI_Output	(other,self ,"DIA_Bennet_DJG_ARMOR_H_15_00"); //Dame la armadura.
	
	if (Npc_HasItems (other,itmi_Gold) >= 20000)
	{
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_H_06_01"); //Es la mejor armadura que he hecho jamás.
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_H_06_02"); //Una auténtica obra maestra.
		
		B_GiveInvItems (other,self,ItMi_Gold,20000);
		CreateInvItems (self,ITAR_DJG_H,1);
		B_GiveInvItems (self,other,ITAR_DJG_H,1);
		
		Bennet_DIA_Bennet_DJG_ARMOR_H_permanent = TRUE;
	}
	else
	{
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_H_06_03"); //No tienes oro suficiente.
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
	description	 = 	"¿Puedes reparar joyas?";
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
	AI_Output			(other, self, "DIA_Bennet_RepairNecklace_15_00"); //¿Puedes reparar joyas?
	AI_Output			(self, other, "DIA_Bennet_RepairNecklace_06_01"); //Depende. Antes tendrías que enseñarme la pieza.
	
	if (MIS_RescueBennet != LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Bennet_RepairNecklace_06_02"); //Y, además, tendría que salir de aquí.
		AI_Output (self ,other,"DIA_Bennet_RepairNecklace_06_03"); //Antes de eso, como es evidente, no puedo hacer nada.
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
	description	 = 	"¿Puedes echarle un vistazo a este amuleto?";
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
	AI_Output			(other, self, "DIA_Bennet_ShowInnosEye_15_00"); //¿Puedes echarle un vistazo a este amuleto?
	AI_Output			(self, other, "DIA_Bennet_ShowInnosEye_06_01"); //Claro, déjame ver.
	AI_Output			(self, other, "DIA_Bennet_ShowInnosEye_06_02"); //Mmm, es un trabajo hermoso. El engaste está roto, pero creo que puedo arreglarlo.
	AI_Output			(other, self, "DIA_Bennet_ShowInnosEye_15_03"); //¿Cuánto te llevará?
	if (MIS_REscueBennet != LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Bennet_ShowInnosEye_06_04"); //Bien, por ahora no me puedo mover de aquí. ¿O acaso ves una forja por aquí?
		AI_Output (self ,other,"DIA_Bennet_ShowInnosEye_06_05"); //Si estuviera en mi herrería podría hacerlo en un día. Pero, claro, antes tendría que salir de aquí.
	}
	else
	{
	AI_Output			(self, other, "DIA_Bennet_ShowInnosEye_06_06"); //Si me lo dejas, estará acabado para cuando vuelvas mañana.
	AI_Output			(self, other, "DIA_Bennet_ShowInnosEye_06_07"); //Y ni siquiera te cobraré. Al fin y al cabo, me sacaste de la cárcel.
	};
	
	B_LogEntry (TOPIC_INNOSEYE, "Bennet es el herrero que necesito para reparar el amuleto.");

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
	description	 = 	"Toma el amuleto. Repáralo si puedes.";
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
	AI_Output			(other, self, "DIA_Bennet_GiveInnosEye_15_00"); //Toma el amuleto. Repáralo si puedes.
	AI_Output			(self, other, "DIA_Bennet_GiveInnosEye_06_01"); //De acuerdo. Habré terminado el nuevo engaste para mañana.
	AI_Output			(self, other, "DIA_Bennet_GiveInnosEye_06_02"); //Puedes venir y recogerlo.
	
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
	description	 = 	"¿Está listo el amuleto?";
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
	AI_Output			(other, self, "DIA_Bennet_GetInnosEye_15_00"); //¿Está listo el amuleto?
	
	if (Bennet_RepairDay < Wld_GetDay())
	{
		AI_Output			(self, other, "DIA_Bennet_GetInnosEye_06_01"); //Sí, ten.
	
		TEXT_Innoseye_Setting = TEXT_Innoseye_Setting_Repaired;
		CreateInvItems (other,ItMi_InnosEye_Broken_Mis,1);
		AI_PrintScreen (Print_InnoseyeGet, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);
	
		AI_Output			(self, other, "DIA_Bennet_GetInnosEye_06_02"); //Tengo que crear un engaste nuevo para la piedra.
		AI_Output			(self, other, "DIA_Bennet_GetInnosEye_06_03"); //He trabajado toda la noche pero ahora está como nuevo.
		
		B_LogEntry (TOPIC_INNOSEYE, "El engaste del amuleto vuelve a estar entero. Bennet ha hecho un buen trabajo.");
		
		MIS_Bennet_InnosEyeRepairedSetting   = LOG_SUCCESS;
		
		B_GivePlayerXP (XP_InnosEyeIsRepaired);
	}
	else
	{	//Hack Mattes
		B_SayBennetLATER();
		//AI_Output			(self, other, "DIA_Bennet_GetInnosEye_06_04"); //Nein, noch nicht. Komm später wieder.
		AI_Output			(self, other, "DIA_Bennet_GetInnosEye_06_05"); //Si sigues interrumpiendo mi trabajo, me costará más terminar.
		
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

	description	 = 	"¿Puedes hacer algo con huevos de dragón?";
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
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_15_00"); //¿Puedes hacer algo con huevos de dragón?
	if (DRACHENEIER_angebotenXP_OneTime == FALSE)
	{
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_01"); //¿Huevos de dragón? ¿Cómo te has hecho con ellos?
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_15_02"); //Se los quité a unos hombres lagarto.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_03"); //Déjame ver.
	};

	Npc_RemoveInvItems	(other,	ItAt_DragonEgg_MIS,	1);
	AI_PrintScreen (PRINT_ItemGegeben, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);	// "1 Gegenstand gegeben"	

	if (DRACHENEIER_angebotenXP_OneTime == FALSE)
	{
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_04"); //Mmm. Es un material resistente. Ideal para rematar una armadura... si es que consigues abrirlos, claro.
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_15_05"); //¿Y entonces, qué? ¿Te interesa?
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_06"); //¡Claro! Déjalo aquí.
	}
	else
	{
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_07"); //¿Cuántas veces me vas a enseñar esa maldita cosa? ¿Quieres que la compre o no?
	};

	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_08"); //Te pagaré, mmm, digamos que 300 monedas de oro, por cada huevo que me traigas.

	Info_ClearChoices	(DIA_Bennet_DRACHENEIER);
	Info_AddChoice	(DIA_Bennet_DRACHENEIER, "Quédate tu oro. Creo que me lo quedaré.", DIA_Bennet_DRACHENEIER_nein );
	Info_AddChoice	(DIA_Bennet_DRACHENEIER, "Estos son huevos de dragón, no miserables huevos de gallina.", DIA_Bennet_DRACHENEIER_mehr );
	Info_AddChoice	(DIA_Bennet_DRACHENEIER, "Trato hecho.", DIA_Bennet_DRACHENEIER_ok );

	IF (DRACHENEIER_angebotenXP_OneTime == FALSE)
	{
	B_LogEntry (TOPIC_DRACHENEIER,"Bennet está dispuesto a comprar a buen precio todos los huevos de dragón que pueda encontrar."); 
	B_GivePlayerXP (XP_DJG_BringDragonEgg);
	DRACHENEIER_angebotenXP_OneTime = TRUE;
	};
};
func void DIA_Bennet_DRACHENEIER_ok ()
{
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_ok_15_00"); //Trato hecho.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_01"); //Perfecto.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_02"); //Tráeme todos los que encuentres.

	if (BennetsDragonEggOffer != 350)
	{
		BennetsDragonEggOffer = 300;	
	};

	CreateInvItems (self, ItMi_Gold, BennetsDragonEggOffer);									
	B_GiveInvItems (self, other, ItMi_Gold,	BennetsDragonEggOffer);

	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_03"); //Emmm. ¿Dices que se los quitaste a unos hombres lagarto?
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_ok_15_04"); //Sí.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_05"); //La mayoría de los hombres lagarto viven en cuevas, por lo que sé.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_06"); //No me sorprendería que encontraras más en las cuevas que hay por aquí.
	B_LogEntry (TOPIC_DRACHENEIER,"Bennet cree que debería buscar huevos en la cavernas de Khorinis. Se supone que hay hombres lagarto en muchas de las cuevas."); 
	
	AI_Output (self, other, "DIA_Bennet_DRACHENEIER_ok_06_07"); //Toma este mapa. Te ayudará a encontrar las cuevas.
	CreateInvItems (self, ItWr_Map_Caves_MIS, 1);									
	B_GiveInvItems (self, other, ItWr_Map_Caves_MIS,1);
	B_LogEntry (TOPIC_DRACHENEIER,"Me ha dado un mapa de la cueva, me ayudará."); 
	
	if (1 == 2) //MH: Besser Karte direkt (war sowieso so - wegen Bug)
	{
		AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_08"); //Pero antes el cartógrafo de la ciudad te tendrá que proporcionar un mapa de las cuevas. Sería una pena que no los encontraras todos.
		B_LogEntry (TOPIC_DRACHENEIER,"Debería pedirle al cartógrafo de la ciudad un mapa de las cuevas, solo para asegurarme de que no me dejo ningún huevo."); 
	};
	
	Info_ClearChoices	(DIA_Bennet_DRACHENEIER);
};

func void DIA_Bennet_DRACHENEIER_mehr ()
{
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_mehr_15_00"); //Éstos son huevos de dragón, no miserables huevos de gallina.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_mehr_06_01"); //(Exasperado) De acuerdo, 350. Pero no te puedo dar más... no me compensaría.
	BennetsDragonEggOffer =	350;
};

func void DIA_Bennet_DRACHENEIER_nein ()
{
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_nein_15_00"); //Ahórrate tu oro. Creo que me lo quedaré.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_nein_06_01"); //Avísame si cambias de idea.

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

	description	 = 	"¿Te interesan más huevos de dragón?";
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
	AI_Output			(other, self, "DIA_Bennet_EierBringen_15_00"); //¿Te interesan más huevos de dragón?
	AI_Output			(self, other, "DIA_Bennet_EierBringen_06_01"); //Claro.

	var int DragonEggCount;
	var int XP_DJG_BringDragonEggs;
	var int DragonEggGeld;
	var string concatText;
	
	DragonEggCount = Npc_HasItems(other, ItAt_DragonEgg_MIS);


	if (DragonEggCount == 1)
		{
			AI_Output		(other, self, "DIA_Bennet_EierBringen_15_02"); //Toma. Tengo otro.
			B_GivePlayerXP (XP_DJG_BringDragonEgg);
			Npc_RemoveInvItems	(other,	ItAt_DragonEgg_MIS,	1);
			AI_PrintScreen (PRINT_ItemGegeben, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);	// "1 Gegenstand gegeben"	
			DragonEggCounter = DragonEggCounter + 1;
		}
		else
		{
			AI_Output		(other, self, "DIA_Bennet_EierBringen_15_03"); //Tengo algunos más.

			Npc_RemoveInvItems	(other,	ItAt_DragonEgg_MIS,	DragonEggCount);
			concatText = ConcatStrings(IntToString(DragonEggCount), PRINT_ItemsGegeben);		// "x Gegenstände gegeben"
			AI_PrintScreen (concatText, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);

			XP_DJG_BringDragonEggs = (DragonEggCount * XP_DJG_BringDragonEgg);
			DragonEggCounter = (DragonEggCounter + DragonEggCount); 

			B_GivePlayerXP (XP_DJG_BringDragonEggs);
		};

	if (DragonEggCounter <= 7)
	{
		AI_Output			(self, other, "DIA_Bennet_EierBringen_06_04"); //Estupendo. Trae. ¿Has buscado en todos lados? Seguro que hay más.
	}
	else if	(DragonEggCounter <= 11)
	{
		AI_Output			(self, other, "DIA_Bennet_EierBringen_06_05"); //¿Dónde has encontrado estas cosas? No creo que queden muchos más.
	}
	else
	{
		AI_Output			(self, other, "DIA_Bennet_EierBringen_06_06"); //No creo que encuentres muchos más. Y ya tengo tantos que casi no sé qué hacer con ellos.
		TOPIC_END_DRACHENEIER = TRUE;
	};

	AI_Output			(self, other, "DIA_Bennet_EierBringen_06_07"); //Oh, de acuerdo. Toma el dinero.

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
	description	 = 	"Tengo que ir a una isla. Me vendría bien un herrero.";
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
	AI_Output			(other, self, "DIA_Bennet_KnowWhereEnemy_15_00"); //Tengo que ir a una isla. Me vendría bien un herrero.
	AI_Output			(self, other, "DIA_Bennet_KnowWhereEnemy_06_01"); //¿Y has pensado en mí?
	AI_Output			(other, self, "DIA_Bennet_KnowWhereEnemy_15_02"); //Sí. ¿Qué dices? Por lo menos te serviría para salir de aquí.
	AI_Output			(self, other, "DIA_Bennet_KnowWhereEnemy_06_03"); //Mejor que la granja de Onar. Chico, hasta el infierno lo sería. Cuenta conmigo.
	
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);   
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 
	B_LogEntry (TOPIC_Crew,"Bennet pudo salir de una vez. Su habilidad como herrero no tiene parangón. Estoy seguro de que puedo aprender bastante de él.");
		
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Bennet_KnowWhereEnemy_15_04"); //Por el momento mi tripulación está completa.
		AI_Output			(self, other, "DIA_Bennet_KnowWhereEnemy_06_05"); //Entonces asegúrate de echar a uno.
	}
	else 
	{
		Info_ClearChoices (DIA_Bennet_KnowWhereEnemy);
		Info_AddChoice (DIA_Bennet_KnowWhereEnemy,"Te avisaré cuando te necesite.",DIA_Bennet_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Bennet_KnowWhereEnemy,"Sé mi herrero. Te veré en el puerto.",DIA_Bennet_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Bennet_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Bennet_KnowWhereEnemy_Yes_15_00"); //En ese caso, sé mi herrero. Te veré en el puerto.
	AI_Output (self ,other,"DIA_Bennet_KnowWhereEnemy_Yes_06_01"); //De acuerdo. Te veré más tarde.
	
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
	AI_Output (other,self ,"DIA_Bennet_KnowWhereEnemy_No_15_00"); //Te avisaré cuando te necesite.
	AI_Output (self ,other,"DIA_Bennet_KnowWhereEnemy_No_06_01"); //Estupendo. Aquí estaré.

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
	description	 = 	"Voy a buscarme otro herrero.";
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
	AI_Output			(other, self, "DIA_Bennet_LeaveMyShip_15_00"); //Voy a buscarme otro herrero.
	AI_Output			(self, other, "DIA_Bennet_LeaveMyShip_06_01"); //Hace un minuto esto, ahora aquello. Decídete, ¿vale? Cuando lo hayas hecho, me lo haces saber.
	
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
	description	 = 	"Vuelve. No puedo encontrar otro herrero.";
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
	AI_Output	(other, self, "DIA_Bennet_StillNeedYou_15_00"); //Vuelve. No puedo encontrar otro herrero.
	AI_Output	(self, other, "DIA_Bennet_StillNeedYou_06_01"); //(Irritado) ¡Ya, o sea, que no te queda más remedio que recurrir a mí! Te veo más tarde, en el muelle.
		
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


























