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
	AI_Output (self, other, "DIA_Bennet_HALLO_06_00"); //Ich verkaufe keine Waffen. Das macht Khaled. Er ist bei Onar im Haus.
	
	Log_CreateTopic (Topic_SoldierTrader,LOG_NOTE);
	B_LogEntry (Topic_SoldierTrader,"Khaled handelt mit Waffen.");
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
	description	= "Wie sieht's mit dem Zubehör zum Schmieden aus?";
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
	AI_Output (other, self, "DIA_Bennet_TRADE_15_00"); //Wie sieht's mit dem Zubehör zum Schmieden aus?
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

	AI_Output (self, other, "DIA_Bennet_TRADE_06_01"); //Was brauchst du?
	
	if (BennetLOG == FALSE)
	{
		Log_CreateTopic (Topic_SoldierTrader,LOG_NOTE);
		B_LogEntry (Topic_SoldierTrader,"Bennet verkauft Schmiedezubehör.");
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
	description	= "Was für Waffen stellst du her?";
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
	AI_Output (other, self, "DIA_Bennet_WhichWeapons_15_00"); //Was für Waffen stellst du her?
	AI_Output (self, other, "DIA_Bennet_WhichWeapons_06_01"); //Zurzeit größtenteils einfache Schwerter.
	AI_Output (self, other, "DIA_Bennet_WhichWeapons_06_02"); //Aber wenn ich magisches Erz hätte, könnte ich Waffen schmieden, die besser sind, als alle vergleichbaren Waffen aus normalem Stahl.
	AI_Output (self, other, "DIA_Bennet_WhichWeapons_06_03"); //Du weißt nicht zufällig, wo man hier in der Gegend welches findet? (lacht) Außer im Minental, meine ich.
	AI_Output (other, self, "DIA_Bennet_WhichWeapons_15_04"); //Nein.
	AI_Output (self, other, "DIA_Bennet_WhichWeapons_06_05"); //Natürlich nicht.
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
	description	= "Gehörst du zu den Bauern oder zu den Söldnern?";
};

func int DIA_Bennet_BauOrSld_Condition ()
{
	return TRUE;
};

func void DIA_Bennet_BauOrSld_Info ()
{
	AI_Output (other, self, "DIA_Bennet_BauOrSld_15_00"); //Gehörst du zu den Bauern oder zu den Söldnern?
	AI_Output (self, other, "DIA_Bennet_BauOrSld_06_01"); //Du willst mich doch verarschen, oder nicht?
	AI_Output (other, self, "DIA_Bennet_BauOrSld_15_02"); //Ich war nur neugierig.
	AI_Output (self, other, "DIA_Bennet_BauOrSld_06_03"); //Schon mal 'nen Bauern gesehen, der Waffenschmied ist?
	AI_Output (other, self, "DIA_Bennet_BauOrSld_15_04"); //Nein.
	AI_Output (self, other, "DIA_Bennet_BauOrSld_06_05"); //Was fragst du dann so dämlich?
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
	description	= "Ich will mich den Söldnern anschließen!";
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
	AI_Output (other, self, "DIA_Bennet_WannaJoin_15_00"); //Ich will mich den Söldnern anschließen!
	AI_Output (self, other, "DIA_Bennet_WannaJoin_06_01"); //Dann quatsch nicht, sondern geh zu Torlof und lass dich auf die Probe stellen.
	if (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
	|| (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
	{
		AI_Output (other, self, "DIA_Bennet_WannaJoin_15_02"); //Ich habe die Probe bestanden.
		AI_Output (self, other, "DIA_Bennet_WannaJoin_06_03"); //Gut, dann werde ich für dich stimmen.
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
	description	= "Kannst du mir beibringen, ein Schwert zu schmieden?";
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
	AI_Output (other, self, "DIA_Bennet_WannaSmith_15_00"); //Kannst du mir beibringen, ein Schwert zu schmieden?
	AI_Output (self, other, "DIA_Bennet_WannaSmith_06_01"); //Klar.
	AI_Output (self, other, "DIA_Bennet_WannaSmith_06_02"); //Das kostet aber 'ne Kleinigkeit. Sagen wir 30 Goldstücke.
	
	Info_ClearChoices (DIA_Bennet_WannaSmith);
	Info_AddChoice (DIA_Bennet_WannaSmith, "Später vielleicht.", DIA_Bennet_WannaSmith_Later);
	Info_AddChoice (DIA_Bennet_WannaSmith, "Gut - hier hast du 30.", DIA_Bennet_WannaSmith_Pay);
};

func void DIA_Bennet_WannaSmith_Pay()
{
	AI_Output (other, self, "DIA_Bennet_WannaSmith_Pay_15_00"); //Gut - hier hast du 30.
	
	if (B_GiveInvItems (other, self, itmi_gold, 30))
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmith_Pay_06_01"); //Und das war noch verdammt günstig! Wir können anfangen, sobald du so weit bist.
		
		Bennet_TeachCommon = TRUE;
		Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
		B_LogEntry (Topic_SoldierTeacher,"Bennet kann mich im Schmieden unterrichten.");
	}
	else
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmith_Pay_06_02"); //Verarsch mich nicht. 30 und keine Münze weniger.
	};
	Info_ClearChoices (DIA_Bennet_WannaSmith);
};

func void DIA_Bennet_WannaSmith_Later()
{
	AI_Output (other, self, "DIA_Bennet_WannaSmith_Later_15_00"); //Später vielleicht.
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
	description	= B_BuildLearnString("Schmieden lernen", B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_Common));
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
	AI_Output (other, self, "DIA_Bennet_TeachCOMMON_15_00"); //Bring mir bei, wie man ein Schwert schmiedet!
	
	if (B_TeachPlayerTalentSmith (self, other, WEAPON_Common))
	{
		AI_Output (self, other, "DIA_Bennet_TeachCOMMON_06_01"); //Ganz einfach: Besorge dir ein Stück Rohstahl, halte es ins Feuer, bis es glüht.
		AI_Output (self, other, "DIA_Bennet_TeachCOMMON_06_02"); //Dann schlägst du am Amboss die Klinge zurecht.
		AI_Output (self, other, "DIA_Bennet_TeachCOMMON_06_03"); //Achte vor allem darauf, dass die Klinge nicht zu kalt wird. Du hast immer nur wenige Minuten Zeit, an deiner Waffe zu arbeiten ...
		AI_Output (self, other, "DIA_Bennet_TeachCOMMON_06_04"); //Den Rest findest du schon raus - reine Übungssache.
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
	description	= "Bring mir bei, wie man magische Erzwaffen schmiedet!";
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
	AI_Output (other, self, "DIA_Bennet_WannaSmithORE_15_00"); //Bring mir bei, wie man magische Erzwaffen schmiedet!
		
	if (PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_01"); //Du kennst dich doch nicht mal mit den Grundlagen aus.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_02"); //Lerne erstmal, ein ordentliches Schwert zu schmieden. Dann sehen wir weiter.
	}
	else if (other.guild != GIL_SLD)
	&& 		(other.guild != GIL_DJG)
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_03"); //Solange du keiner von uns bist, werd ich den Teufel tun, dir das Geheimnis der Erzwaffen zu verraten.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_04"); //Es gibt nur sehr wenige Schmiede, die es kennen, und ich glaube, nicht mal die Schmiede in der Stadt kennen es.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_05"); //Und das ist auch gut so. Sonst rennen demnächst die versoffenen Stadtwachen alle mit Erzschwertern rum.
		if (other.guild == GIL_MIL)
		{	
			AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_06"); //Ging nicht gegen dich. (grinst) Du scheinst okay zu sein.
		};
	}
	else if (MIS_Bennet_BringOre != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_07"); //Wenn ich magisches Erz hätte, würde ich das vielleicht sogar tun.
		AI_Output (other, self, "DIA_Bennet_WannaSmithORE_15_08");//Ach komm - ich gehöre zu den Söldnern und ich kann schmieden - was denn noch?
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_09"); //Kannst du mir mal verraten, wie du eine magische Erzwaffe ohne magisches Erz schmieden willst?
		AI_Output (other, self, "DIA_Bennet_WannaSmithORE_15_10");//Tja ...
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_11"); //Dachte ich mir. Ich brauche mindestens 5 Brocken Erz - sonst kannst du's vergessen.
		if (MIS_Bennet_BringOre == FALSE)
		{
			MIS_Bennet_BringOre = LOG_RUNNING;
		};
	}
	else //alles OK
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_12"); //Gut, du hast mir das Erz gebracht und ein ordentliches Schwert schmieden kannst du auch.
		AI_Output (other, self, "DIA_Bennet_WannaSmithORE_15_13");//Na dann leg mal los ...
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_14"); //Also, das Wichtigste ist: Es ist völlig egal, ob deine Waffe aus reinem Erz ist oder ob du eine einfache Stahlklinge mit einer Schicht aus Erz überziehst. Es kommt nur auf die Oberfläche an.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_15"); //Und weil das verdammte Zeug so teuer ist, nimmst du dir einen Stahlrohling und ein paar Brocken Erz.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_16"); //Es reicht natürlich nicht, einfach ein fertiges Schwert mit Erz zu überziehen. Du musst die Waffe schon selber schmieden.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_17"); //Alles weitere hängt von der Waffe ab, die du herstellen willst.
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
	description	= "Wo bekomme ich magisches Erz her?";
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
	AI_Output (other, self, "DIA_Bennet_WhereOre_15_00"); //Wo bekomme ich magisches Erz her?
	AI_Output (self, other, "DIA_Bennet_WhereOre_06_01"); //Tja, wenn ich das wüsste. Es gibt sicher was in der Minenkolonie.
	AI_Output (self, other, "DIA_Bennet_WhereOre_06_02"); //Aber vielleicht hast du Glück und es gibt hier noch irgendwo ein paar Brocken, die du zusammenkratzen kannst.
	AI_Output (self, other, "DIA_Bennet_WhereOre_06_03"); //Ich glaube, in den Bergen südlich von hier gibt es Minenstollen. Vielleicht hast du da Glück.
	AI_Output (self, other, "DIA_Bennet_WhereOre_06_04"); //Aber pass auf, ich hab gehört, da oben wimmelt es von Banditen.
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
	description	= "Hier sind die 5 Erzbrocken.";
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
	AI_Output (other, self, "DIA_Bennet_BringOre_15_00"); //Hier sind die 5 Erzbrocken.
	AI_Output (self, other, "DIA_Bennet_BringOre_06_01"); //(lacht) Zeig her!
	B_GiveInvItems (other, self, itmi_nugget, 5);
	AI_Output (self, other, "DIA_Bennet_BringOre_06_02"); //Tatsächlich! Ich werd verrückt!
	AI_Output (self, other, "DIA_Bennet_BringOre_06_03"); //Zwei von den Dingern kannst du behalten. Du wirst sie brauchen, wenn du dir deine eigene Waffe schmieden willst.
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
	AI_Output	(self, other, "DIA_Bennet_GetInnosEye_06_04"); //Nein, noch nicht. Komm später wieder.
};
instance DIA_Bennet_TeachSmith		(C_INFO)
{
	npc		 	= SLD_809_Bennet;
	nr		 	= 30;
	condition	= DIA_Bennet_TeachSmith_Condition;
	information	= DIA_Bennet_TeachSmith_Info;
	permanent	= TRUE;
	description	= "Ich will mehr über das Schmieden von magischen Erzwaffen wissen.";
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
	AI_Output (other, self, "DIA_Bennet_TeachSmith_15_00"); //Ich will mehr über das Schmieden von magischen Erzwaffen wissen.
	
	if (Kapitel == 1)//HACK Mattes  
	{
		B_SayBennetLATER();
	}
	else if (Kapitel == 2)
	&& (Bennet_Kap2Smith == FALSE)
	{
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_01"); //Ich kann dir beibringen, wie man Erzschwerter oder sogar Zweihänder schmiedet.
		Bennet_Kap2Smith = TRUE;
	}
	else if (Kapitel == 3)
	&& (MIS_ReadyForChapter4 == FALSE)
	&& (Bennet_Kap3Smith == FALSE)
	{
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_02"); //Ich habe meine Technik verbessert. Ich kann dir jetzt beibringen, wie du Bastardschwerter oder schwere Zweihänder mit Erz herstellst.
		Bennet_Kap3Smith = TRUE;
	}
	else if (MIS_ReadyForChapter4 == TRUE)
	&& (Kapitel < 5)
	&& (Bennet_Kap4Smith == FALSE)
	{
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_03"); //Ich glaube, jetzt habe ich mich selbst übertroffen. Ich habe zwei Schlachtklingen entworfen. Das ist das Beste, was ich bisher gesehen habe.
		Bennet_Kap4Smith = TRUE;
	}
	else if (Kapitel >= 5)
	&& (Bennet_Kap5Smith == FALSE)
	{
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_04"); //Hör zu. Ich glaube ich hatte gerade eine geniale Idee. Erzwaffen mit Drachenblut überzogen. Ich weiß auch schon genau, wie ich's mache!
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_05"); //(grinst) Willst du's wissen?
		Bennet_Kap5Smith = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_06"); //Welche Waffe willst du herstellen?
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
	description	 = 	"Was machst du hier im Knast?";
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
	AI_Output	(other, self ,"DIA_Bennet_WhyPrison_15_00"); //Was machst du hier im Knast?
	AI_Output	(self , other,"DIA_Bennet_WhyPrison_06_01"); //Die Schweine haben mich eingelocht. Ich soll einen Paladin ermordet haben.
	AI_Output 	(self ,other ,"DIA_Bennet_WhyPrison_06_02"); //Aber ich war es nicht, die wollen mir das in die Schuhe schieben.
	AI_Output	(other, self ,"DIA_Bennet_WhyPrison_15_03"); //Wieso sollten sie das tun?
	AI_Output 	(self ,other ,"DIA_Bennet_WhyPrison_06_04"); //Das weiß ich doch nicht. Du musst mich hier raus holen.
	AI_Output 	(self ,other ,"DIA_Bennet_WhyPrison_06_05"); //Rede mit Lord Hagen, reiß die Wand ein, egal, mach irgendwas.
	
	MIS_RescueBennet = LOG_RUNNING; 
	Log_CreateTopic (TOPIC_RESCUEBENNET, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RESCUEBENNET, LOG_RUNNING);
	B_LogEntry (TOPIC_RESCUEBENNET,"Bennet geht es gar nicht gut. Er würde alles dafür tun aus dem Knast zu entkommen."); 
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
	description	 = 	"Was ist passiert?";
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
	AI_Output	(other, self ,"DIA_Bennet_WhatHappened_15_00"); //Was ist passiert?
	AI_Output	(self , other,"DIA_Bennet_WhatHappened_06_01"); //Ich war mit Hodges zusammen in der Stadt, um Vorräte für unsere Jungs einzukaufen.
	AI_Output 	(self ,other ,"DIA_Bennet_WhatHappened_06_02"); //Plötzlich hören wir einen lauten Schrei und Fußgetrappel.
	AI_Output	(other, self ,"DIA_Bennet_WhatHappened_15_03"); //Komm zum Punkt.
	AI_Output 	(self ,other ,"DIA_Bennet_WhatHappened_06_04"); //Jaja, also wir wussten sofort, da ist was passiert und wenn die uns hier sehen, werden wir sofort eingelocht.
	AI_Output 	(self ,other ,"DIA_Bennet_WhatHappened_06_05"); //Wir sind gerannt wie die Teufel. Und kurz vor dem Stadttor bin ich umgeknickt und habe mir den Knöchel verstaucht.
	AI_Output 	(self ,other ,"DIA_Bennet_WhatHappened_06_06"); //Der Rest ist schnell erzählt. Die Miliz war sofort da und hat mich direkt in dieses Loch gesteckt.
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
	description	 = 	"Wer ist ermordet worden?";
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
	AI_Output	(other, self ,"DIA_Bennet_Victim_15_00"); //Wer ist ermordet worden?
	AI_Output	(self , other,"DIA_Bennet_Victim_06_01"); //Was weiß ich, einer der Paladine, ich kenne die nicht.
	AI_Output	(other, self ,"DIA_Bennet_Victim_15_02"); //Hast du einen Namen?
	AI_Output 	(self ,other ,"DIA_Bennet_Victim_06_03"); //Lothar, oder so. Keine Ahnung, ich bin mir aber auch nicht sicher.
	AI_Output 	(self ,other ,"DIA_Bennet_Victim_06_04"); //Frag am besten Lord Hagen, der kennt alle Einzelheiten.

	B_LogEntry (TOPIC_RESCUEBENNET,"Einer der Paladine, Lothar, ist ermordet worden. Lord Hagen kann mir anscheinend mehr erzählen, er leitet die Untersuchung.");
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
	description	 = 	"Haben sie Beweise gegen dich?";
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
	AI_Output	(other, self ,"DIA_Bennet_Evidence_15_00"); //Haben sie Beweise gegen dich?
	AI_Output	(self , other,"DIA_Bennet_Evidence_06_01"); //Sie sagen, sie haben einen Zeugen, der mich erkannt hat.
	AI_Output	(other, self ,"DIA_Bennet_Evidence_15_02"); //Weißt du, wer der Zeuge ist?
	AI_Output 	(self ,other ,"DIA_Bennet_Evidence_06_03"); //Nein. Ich weiß nur, dass er lügt.
	
	B_LogEntry (TOPIC_RESCUEBENNET,"Es gibt einen einen Zeugen, der Bennet gesehen haben will. Ich werde ihn wohl finden müssen, um die Wahrheit ans Licht zu bringen.");
	
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
	description	 = 	"Wer führt die Untersuchungen durch?";
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
	AI_Output	(other, self ,"DIA_Bennet_Investigation_15_00"); //Wer führt die Untersuchungen durch?
	AI_Output	(self , other,"DIA_Bennet_Investigation_06_01"); //Lord Hagen selbst. Da der Ermordete ein Paladin ist, fällt der Fall unter das Kriegsrecht.
	AI_Output	(other, self ,"DIA_Bennet_Investigation_15_02"); //Was heißt das?
	AI_Output 	(self ,other ,"DIA_Bennet_Investigation_06_03"); //Ganz einfach, wenn ich nicht rauskomme, werden die mich ohne viel Federlesens aufknüpfen.
	AI_Output 	(self ,other ,"DIA_Bennet_Investigation_06_04"); //Du musst mir helfen, sonst wird es einen Krieg geben. Lee wird das nicht auf sich beruhen lassen.
	AI_Output 	(self ,other ,"DIA_Bennet_Investigation_06_05"); //Was das heißt, kannst du dir ja denken.
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

	AI_Output	(self ,other,"DIA_Bennet_ThankYou_06_00"); //Mann, ich hatte echt schon geglaubt, dass die mich hängen!
	AI_Output	(other,self ,"DIA_Bennet_ThankYou_15_01"); //Ist ja noch mal gut gegangen.
	AI_Output 	(self ,other,"DIA_Bennet_ThankYou_06_02"); //Das kannste wissen. Du hättest mal das Gesicht von dem Soldaten sehen soll, als der mich rausgelassen hat.
	AI_Output 	(self ,other,"DIA_Bennet_ThankYou_06_03"); //(lacht) Der hatte sich vor Angst fast in die Hose gemacht.
	AI_Output 	(self ,other,"DIA_Bennet_ThankYou_06_04"); //Da fällt mir ein, ich hab was für dich!
	AI_Output	(other,self ,"DIA_Bennet_ThankYou_15_05"); //Was meinst du?
	AI_Output 	(self ,other,"DIA_Bennet_ThankYou_06_06"); //(grinst) Ein Geschenk.
	
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
	description	 =	"Was für ein Geschenk?";
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
	AI_Output	(other,self ,"DIA_Bennet_Present_15_00"); //Was für ein Geschenk?
	
	AI_Output 	(self ,other,"DIA_Bennet_Present_06_01"); //Wir haben von den Drachen gehört, die im Tal sein sollen.
	AI_Output	(other,self ,"DIA_Bennet_Present_15_02"); //Sie sind da!
	AI_Output 	(self ,other,"DIA_Bennet_Present_06_03"); //Schon gut, ich glaub dir ja.
	
	if (hero.guild == GIL_DJG)
	{
			
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_04"); //Jedenfalls haben ein paar von den Jungs beschlossen, auch ins Tal zu gehen.
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_05"); //(grinst) Die wollen da mal so richtig aufräumen.
		AI_Output	(other,self ,"DIA_Bennet_Present_15_06"); //Was hat das mit mir zu tun?
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_07"); //(stolz) Ich habe eine neue Rüstung entwickelt. Eine Drachenjägerrüstung!
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_08"); //Sie ist stabiler und leichter als herkömmliche Rüstungen.
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_09"); //Da du mich gerettet hast, sollst du das erste Exemplar haben. Ich schenke sie dir!
			
		CreateInvItems (self,ITAR_DJG_L,1);
		B_GiveInvItems (self,other,ITAR_DJG_L,1);
			
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_10"); //Ich hab mir gedacht, du willst dir den Spaß nicht entgehen lassen. Du solltest angemessen gerüstet sein, wenn du ins Tal gehst.
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_11"); //Des weiteren bin ich Drachenschuppen interessiert. Echte Drachenschuppen. Ich werde dir einen guten Preis dafür machen.
		AI_Output	(other,self ,"DIA_Bennet_Present_15_12"); //Wie viel bekomme ich pro Schuppe?
		B_Say_Gold (self,other,Value_DragonScale); 
	}
	else
	{
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_13"); //Jedenfalls hab ich mir gedacht, dass du dich sicherlich bei der anstehenden Drachenjagd beteiligst.
		AI_Output	(other,self ,"DIA_Bennet_Present_15_14"); //Und?
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_15"); //Ich hab hier ein Amulett, ich denke, du hast dafür eine bessere Verwendung als ich.
	
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
	description	 =	"Ich habe ein paar Drachenschuppen für dich.";
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
	AI_Output	(other,self ,"DIA_Bennet_DragonScale_15_00"); //Ich habe ein paar Drachenschuppen für dich.
	AI_Output 	(self ,other,"DIA_Bennet_DragonScale_06_01"); //Echte Drachenschuppen!
	AI_Output 	(self ,other,"DIA_Bennet_DragonScale_06_02"); //Hier ist dein Gold!
	
	Bennet_DragonScale_Counter = (Bennet_DragonScale_Counter +(Npc_HasItems (other,ItAT_Dragonscale)));
	
	B_GiveInvItems (self ,other,ItMi_Gold,(Npc_HasItems(other,ItAT_Dragonscale) * Value_DragonScale) ); 
	B_GiveInvItems (other,self ,ItAt_Dragonscale,(Npc_HasItems (other,ItAT_Dragonscale)));
	
	
	if (Bennet_DragonScale_Counter >= 20)
	&& (Show_DJG_Armor_M == FALSE)
	{
		AI_Output 	(self ,other,"DIA_Bennet_DragonScale_06_03"); //So, das dürfte jetzt ausreichend sein. Wenn du willst, kann ich dir eine neue, verbesserte Rüstung verkaufen.
		
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
	description	 =	"Mittlere Drachenjägerrüstung: Schutz: Waffen 120, Pfeile 120. (12000 Gold)"; //Wenn ändern, dann bitte auch in der Info-Instanz. s.u.
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
	AI_Output	(other,self ,"DIA_Bennet_DJG_ARMOR_M_15_00"); //Ich will die Rüstung kaufen.
	
	if (Npc_HasItems (other,itmi_Gold) >= 12000)
	{
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_M_06_01"); //Sehr gut. Du wirst an ihr deine helle Freude haben.
		AI_Output	(other,self ,"DIA_Bennet_DJG_ARMOR_M_15_02"); //Kann man bei dem Preis wohl auch erwarten.
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_M_06_03"); //Du wirst merken, sie ist jedes einzelne Goldstück wert.
		
		B_GiveInvItems (other,self,ItMi_Gold,12000);
		CreateInvItems (self,ITAR_DJG_M,1);
		B_GiveInvItems (self,other,ITAR_DJG_M,1);
		
		Bennet_DIA_Bennet_DJG_ARMOR_M_permanent = TRUE;
	}
	else
	{
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_M_06_04"); //Du hast nicht genug Gold.
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
	description	 =	"Ich weiß, wie man die Rüstung noch verbessern kann. ";
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
	AI_Output	(other,self ,"DIA_Bennet_BetterArmor_15_00"); //Ich weiß, wie man die Rüstung noch verbessern kann.
	AI_Output 	(self ,other,"DIA_Bennet_BetterArmor_06_01"); //(schmunzelt) Dann erzähl mal.
	AI_Output	(other,self ,"DIA_Bennet_BetterArmor_15_02"); //Du kannst die Drachenschuppen mit magischem Erz überziehen.
	AI_Output 	(self ,other,"DIA_Bennet_BetterArmor_06_03"); //(lacht) Da bin ich selber auch schon drauf gekommen. Und du hast Recht.
	AI_Output 	(self ,other,"DIA_Bennet_BetterArmor_06_04"); //Meine neuste Rüstung übertrifft alles bisher da gewesene. Sie ist leicht und stabil.
	AI_Output 	(self ,other,"DIA_Bennet_BetterArmor_06_05"); //Sie ist PERFEKT.
	AI_Output 	(self ,other,"DIA_Bennet_BetterArmor_06_06"); //Wenn du willst, kannst du sie kaufen. Das Angebot mache ich nicht jedem, und der Preis deckt auch nur die Herstellungskosten.
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
	description	 =	"Schwere Drachenjägerrüstung: Schutz: Waffen 150, Pfeile 150. (20000 Gold)"; //Wenn ändern, dann bitte auch in der Info-Instanz. s.u.
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
	AI_Output	(other,self ,"DIA_Bennet_DJG_ARMOR_H_15_00"); //Gib mir die Rüstung
	
	if (Npc_HasItems (other,itmi_Gold) >= 20000)
	{
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_H_06_01"); //Das ist die beste Rüstung, die ich je gemacht habe.
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_H_06_02"); //Ein wahres Meisterstück.
		
		B_GiveInvItems (other,self,ItMi_Gold,20000);
		CreateInvItems (self,ITAR_DJG_H,1);
		B_GiveInvItems (self,other,ITAR_DJG_H,1);
		
		Bennet_DIA_Bennet_DJG_ARMOR_H_permanent = TRUE;
	}
	else
	{
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_H_06_03"); //Du hast nicht genug Gold.
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
	description	 = 	"Kannst du Schmuckstücke reparieren?";
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
	AI_Output			(other, self, "DIA_Bennet_RepairNecklace_15_00"); //Kannst du Schmuckstücke reparieren?
	AI_Output			(self, other, "DIA_Bennet_RepairNecklace_06_01"); //Kommt drauf an, ich müsste das Schmuckstück zunächst mal sehen.
	
	if (MIS_RescueBennet != LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Bennet_RepairNecklace_06_02"); //Außerdem muss ich erstmal hier raus.
		AI_Output (self ,other,"DIA_Bennet_RepairNecklace_06_03"); //Bevor das nicht der Fall ist, kann ich überhaupt nichts machen.
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
	description	 = 	"Kannst du dir dieses Amulett mal angucken?";
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
	AI_Output			(other, self, "DIA_Bennet_ShowInnosEye_15_00"); //Kannst du dir dieses Amulett mal angucken?
	AI_Output			(self, other, "DIA_Bennet_ShowInnosEye_06_01"); //Klar, lass mal sehen.
	AI_Output			(self, other, "DIA_Bennet_ShowInnosEye_06_02"); //Hmm, das ist eine sehr schöne Arbeit, die Fassung ist hinüber. Ich glaube, ich kann es wieder hinkriegen.
	AI_Output			(other, self, "DIA_Bennet_ShowInnosEye_15_03"); //Wie lange brauchst du dafür?
	if (MIS_REscueBennet != LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Bennet_ShowInnosEye_06_04"); //Zunächst einmal sitze ich hier fest. Oder siehst du hier 'ne Schmiede?
		AI_Output (self ,other,"DIA_Bennet_ShowInnosEye_06_05"); //Wenn ich in meiner Schmiede bin, könnte ich das Ganze an einem Tag schaffen. Aber dafür muss ich erstmal hier raus.
	}
	else
	{
	AI_Output			(self, other, "DIA_Bennet_ShowInnosEye_06_06"); //Wenn du es hierlässt und morgen wiederkommst, wird es fertig sein.
	AI_Output			(self, other, "DIA_Bennet_ShowInnosEye_06_07"); //Ich werde dir noch nicht mal was dafür abknöpfen. Schließlich hast du mich aus dem Bau geholt.
	};
	
	B_LogEntry (TOPIC_INNOSEYE, "Bennet ist der Schmied, den ich suche um das Amulett zu reparieren.");

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
	description	 = 	"Hier ist das Amulett, reparier es für mich.";
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
	AI_Output			(other, self, "DIA_Bennet_GiveInnosEye_15_00"); //Hier ist das Amulett, reparier es für mich.
	AI_Output			(self, other, "DIA_Bennet_GiveInnosEye_06_01"); //Alles klar. Bis morgen werde ich die neue Fassung angepasst haben.
	AI_Output			(self, other, "DIA_Bennet_GiveInnosEye_06_02"); //Du kannst es dir dann bei mir abholen.
	
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
	description	 = 	"Ist das Amulett fertig?";
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
	AI_Output			(other, self, "DIA_Bennet_GetInnosEye_15_00"); //Ist das Amulett fertig?
	
	if (Bennet_RepairDay < Wld_GetDay())
	{
		AI_Output			(self, other, "DIA_Bennet_GetInnosEye_06_01"); //Ja hier.
	
		TEXT_Innoseye_Setting = TEXT_Innoseye_Setting_Repaired;
		CreateInvItems (other,ItMi_InnosEye_Broken_Mis,1);
		AI_PrintScreen (Print_InnoseyeGet, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);
	
		AI_Output			(self, other, "DIA_Bennet_GetInnosEye_06_02"); //Ich musste eine neue Fassung für den Stein fertigen.
		AI_Output			(self, other, "DIA_Bennet_GetInnosEye_06_03"); //Ich hab die ganze Nacht daran gearbeitet und es ist wie neu.
		
		B_LogEntry (TOPIC_INNOSEYE, "Die Fassung des Amuletts ist wieder intakt. Bennet hat ganze Arbeit geleistet.");
		
		MIS_Bennet_InnosEyeRepairedSetting   = LOG_SUCCESS;
		
		B_GivePlayerXP (XP_InnosEyeIsRepaired);
	}
	else
	{	//Hack Mattes
		B_SayBennetLATER();
		//AI_Output			(self, other, "DIA_Bennet_GetInnosEye_06_04"); //Nein, noch nicht. Komm später wieder.
		AI_Output			(self, other, "DIA_Bennet_GetInnosEye_06_05"); //Wenn du mich noch weiter von der Arbeit abhältst, wird es noch länger dauern.
		
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

	description	 = 	"Kannst du mit Dracheneiern etwas anfangen?";
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
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_15_00"); //Kannst du mit Dracheneiern etwas anfangen?
	if (DRACHENEIER_angebotenXP_OneTime == FALSE)
	{
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_01"); //Dracheneier? Wie zum Kuckuck bist du denn da dran gekommen?
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_15_02"); //Ich hab sie einigen Echsenmenschen abgenommen.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_03"); //Lass mal sehen.
	};

	Npc_RemoveInvItems	(other,	ItAt_DragonEgg_MIS,	1);
	AI_PrintScreen (PRINT_ItemGegeben, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);	// "1 Gegenstand gegeben"	

	if (DRACHENEIER_angebotenXP_OneTime == FALSE)
	{
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_04"); //Mmh. Sehr robustes Material. Ideal zur Verarbeitung von Rüstungen. Das heißt, wenn man die Dinger aufkriegt.
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_15_05"); //Was ist nun? Willst du es haben?
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_06"); //Klar! Her damit.
	}
	else
	{
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_07"); //Wie oft willst du mir das blöde Ding denn noch in die Hand drücken. Soll ich es jetzt kaufen oder nicht?
	};

	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_08"); //Ich zahl dir dafür, mmh, sagen wir, 300 Goldmünzen, für jedes Ei, das du mir bringen kannst.

	Info_ClearChoices	(DIA_Bennet_DRACHENEIER);
	Info_AddChoice	(DIA_Bennet_DRACHENEIER, "Spar dir dein Geld. Ich denke, ich werd´s behalten.", DIA_Bennet_DRACHENEIER_nein );
	Info_AddChoice	(DIA_Bennet_DRACHENEIER, "Das sind Dracheneier und nicht jämmeliche Hühnereier.", DIA_Bennet_DRACHENEIER_mehr );
	Info_AddChoice	(DIA_Bennet_DRACHENEIER, "Abgemacht.", DIA_Bennet_DRACHENEIER_ok );

	IF (DRACHENEIER_angebotenXP_OneTime == FALSE)
	{
	B_LogEntry (TOPIC_DRACHENEIER,"Bennet will mir alle Dracheneier, die ich finden kann, für einen guten Preis abkaufen."); 
	B_GivePlayerXP (XP_DJG_BringDragonEgg);
	DRACHENEIER_angebotenXP_OneTime = TRUE;
	};
};
func void DIA_Bennet_DRACHENEIER_ok ()
{
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_ok_15_00"); //Abgemacht.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_01"); //Alles klar.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_02"); //Dann mal immer her mit den Dingern, wenn du welche hast.

	if (BennetsDragonEggOffer != 350)
	{
		BennetsDragonEggOffer = 300;	
	};

	CreateInvItems (self, ItMi_Gold, BennetsDragonEggOffer);									
	B_GiveInvItems (self, other, ItMi_Gold,	BennetsDragonEggOffer);

	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_03"); //Ähm. Du hast es Echsenmenschen abgenommen, sagst du?
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_ok_15_04"); //Genau.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_05"); //Echsenmenschen hausen vornehmlich in Höhlen, soviel ich weiß.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_06"); //Würde mich nicht wundern, wenn du in den Höhlen der Umgebung hier noch mehr von den Dingern findest.
	B_LogEntry (TOPIC_DRACHENEIER,"Bennet ist der Meinung, dass ich nach den Eiern in den Höhlen von Khorinis suchen sollte. Echsenmenschen seien häufig in Höhlen anzutreffen."); 
	
	AI_Output (self, other, "DIA_Bennet_DRACHENEIER_ok_06_07"); //Hier. Ich gebe dir noch 'ne Karte mit. Damit du die Höhlen besser finden kannst.
	CreateInvItems (self, ItWr_Map_Caves_MIS, 1);									
	B_GiveInvItems (self, other, ItWr_Map_Caves_MIS,1);
	B_LogEntry (TOPIC_DRACHENEIER,"Er gab mir zu diesem Zweck eine Höhlenkarte."); 
	
	if (1 == 2) //MH: Besser Karte direkt (war sowieso so - wegen Bug)
	{
		AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_08"); //Besorg dir aber vorher noch eine Höhlenkarte von einem Kartenzeichner in der Stadt. Wäre doch schade, wenn du eine übersiehst.
		B_LogEntry (TOPIC_DRACHENEIER,"Ich sollte mir eine Höhlenkarte bei Kartenzeichner in der Stadt besorgen, damit ich kein Ei übersehe."); 
	};
	
	Info_ClearChoices	(DIA_Bennet_DRACHENEIER);
};

func void DIA_Bennet_DRACHENEIER_mehr ()
{
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_mehr_15_00"); //Das sind Dracheneier und nicht jämmerliche Hühnereier.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_mehr_06_01"); //(genervt) Na schön. Dann eben 350. Aber mehr kann ich dir nicht geben. Dann lohnt es sich für mich nicht mehr.
	BennetsDragonEggOffer =	350;
};

func void DIA_Bennet_DRACHENEIER_nein ()
{
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_nein_15_00"); //Spar dir dein Gold. Ich denke, ich werd's behalten.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_nein_06_01"); //Kannst es dir ja noch mal überlegen.

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

	description	 = 	"Interesse an weiteren Dracheneiern?";
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
	AI_Output			(other, self, "DIA_Bennet_EierBringen_15_00"); //Interesse an weiteren Dracheneiern?
	AI_Output			(self, other, "DIA_Bennet_EierBringen_06_01"); //Klar!

	var int DragonEggCount;
	var int XP_DJG_BringDragonEggs;
	var int DragonEggGeld;
	var string concatText;
	
	DragonEggCount = Npc_HasItems(other, ItAt_DragonEgg_MIS);


	if (DragonEggCount == 1)
		{
			AI_Output		(other, self, "DIA_Bennet_EierBringen_15_02"); //Hier. Ich hab noch eins.
			B_GivePlayerXP (XP_DJG_BringDragonEgg);
			Npc_RemoveInvItems	(other,	ItAt_DragonEgg_MIS,	1);
			AI_PrintScreen (PRINT_ItemGegeben, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);	// "1 Gegenstand gegeben"	
			DragonEggCounter = DragonEggCounter + 1;
		}
		else
		{
			AI_Output		(other, self, "DIA_Bennet_EierBringen_15_03"); //Ich hab hier noch welche.

			Npc_RemoveInvItems	(other,	ItAt_DragonEgg_MIS,	DragonEggCount);
			concatText = ConcatStrings(IntToString(DragonEggCount), PRINT_ItemsGegeben);		// "x Gegenstände gegeben"
			AI_PrintScreen (concatText, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);

			XP_DJG_BringDragonEggs = (DragonEggCount * XP_DJG_BringDragonEgg);
			DragonEggCounter = (DragonEggCounter + DragonEggCount); 

			B_GivePlayerXP (XP_DJG_BringDragonEggs);
		};

	if (DragonEggCounter <= 7)
	{
		AI_Output			(self, other, "DIA_Bennet_EierBringen_06_04"); //Klasse. Her damit. Hast du denn schon überall nachgesehen? Sicher sind da noch mehr.
	}
	else if	(DragonEggCounter <= 11)
	{
		AI_Output			(self, other, "DIA_Bennet_EierBringen_06_05"); //Wo gräbst du die Dinger bloß aus? Viele dürften es nicht mehr sein.
	}
	else
	{
		AI_Output			(self, other, "DIA_Bennet_EierBringen_06_06"); //Ich denke, du wirst jetzt nicht mehr viele finden. Ich weiß ja auch schon bald gar nicht mehr, wohin mit den Dingern.
		TOPIC_END_DRACHENEIER = TRUE;
	};

	AI_Output			(self, other, "DIA_Bennet_EierBringen_06_07"); //Ach ja. Hier, dein Geld.

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
	description	 = 	"Ich muss zu einer Insel. Ich könnte einen Schmied gebrauchen.";
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
	AI_Output			(other, self, "DIA_Bennet_KnowWhereEnemy_15_00"); //Ich muss zu einer Insel. Ich könnte einen Schmied gebrauchen.
	AI_Output			(self, other, "DIA_Bennet_KnowWhereEnemy_06_01"); //Und da hast du an mich gedacht?
	AI_Output			(other, self, "DIA_Bennet_KnowWhereEnemy_15_02"); //Ja. Was sagst du? Dann wärst du auf jeden Fall weg von hier.
	AI_Output			(self, other, "DIA_Bennet_KnowWhereEnemy_06_03"); //Besser als der Onars Hof. Junge, selbst die Hölle kann nicht so schlimm sein. Ich bin dabei.
	
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);   
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 
	B_LogEntry (TOPIC_Crew,"Bennet könnte sofort aufbrechen. Sein Talent als Schmied ist unbestritten. Ich kann bestimmt bei ihm noch was lernen.");
		
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Bennet_KnowWhereEnemy_15_04"); //Im Moment habe ich meine Crew schon komplett.
		AI_Output			(self, other, "DIA_Bennet_KnowWhereEnemy_06_05"); //Dann sieh zu, dass du wieder einen von ihnen weg schickst.
	}
	else 
	{
		Info_ClearChoices (DIA_Bennet_KnowWhereEnemy);
		Info_AddChoice (DIA_Bennet_KnowWhereEnemy,"Ich werde dich benachrichtigen, wenn ich dich brauche.",DIA_Bennet_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Bennet_KnowWhereEnemy,"Sei mein Schmied. Wir sehen uns am Hafen.",DIA_Bennet_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Bennet_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Bennet_KnowWhereEnemy_Yes_15_00"); //Sei mein Schmied. Wir sehen uns am Hafen.
	AI_Output (self ,other,"DIA_Bennet_KnowWhereEnemy_Yes_06_01"); //Alles klar. Bis nachher.
	
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
	AI_Output (other,self ,"DIA_Bennet_KnowWhereEnemy_No_15_00"); //Ich werde dich benachrichtigen, wenn ich dich brauche.
	AI_Output (self ,other,"DIA_Bennet_KnowWhereEnemy_No_06_01"); //Gut. Ich bin hier.

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
	description	 = 	"Ich werde mich nach einem anderen Schmied umsehen.";
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
	AI_Output			(other, self, "DIA_Bennet_LeaveMyShip_15_00"); //Ich werde mich nach einem anderen Schmied umsehen.
	AI_Output			(self, other, "DIA_Bennet_LeaveMyShip_06_01"); //Rein in die heißen Kohlen, raus aus den heißen Kohlen. Was denn nun? Sag Bescheid, wenn du weißt, was du willst.
	
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
	description	 = 	"Komm zurück. Ich finde keinen anderen Schmied.";
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
	AI_Output	(other, self, "DIA_Bennet_StillNeedYou_15_00"); //Komm zurück. Ich finde keinen anderen Schmied.
	AI_Output	(self, other, "DIA_Bennet_StillNeedYou_06_01"); //(verärgert) Tja! Mit mir kannst du's ja machen. Bis später am Hafen.
		
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


























