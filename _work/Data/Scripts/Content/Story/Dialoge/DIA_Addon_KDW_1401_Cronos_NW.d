///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Cronos_EXIT   (C_INFO)
{
	npc         = KDW_1401_Addon_Cronos_NW;
	nr          = 999;
	condition   = DIA_Addon_Cronos_EXIT_Condition;
	information = DIA_Addon_Cronos_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Addon_Cronos_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Cronos_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cronos_Hallo		(C_INFO)
{
	npc		 = 	KDW_1401_Addon_Cronos_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cronos_Hallo_Condition;
	information	 = 	DIA_Addon_Cronos_Hallo_Info;

	description	 = 	"Pouvez-vous me consacrer quelques instants ?";
};

func int DIA_Addon_Cronos_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Cronos_Hallo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cronos_Hallo_15_00"); //Pouvez-vous me consacrer quelques instants ?
	AI_Output	(self, other, "DIA_Addon_Cronos_Hallo_04_01"); //(surpris) C'est VOUS ?! Jamais je n'aurais cru revoir votre visage.
	AI_Output	(self, other, "DIA_Addon_Cronos_Hallo_04_02"); //Vous êtes très courageux de vous montrer ici. Fut un temps où nous vous aurions écorché vif...
	AI_Output	(self, other, "DIA_Addon_Cronos_Hallo_04_03"); //Vous pouvez vous estimer heureux que les semaines aient passé, et qu'avec elles le temps ait calmé les esprits.
};

///////////////////////////////////////////////////////////////////////
//	Info WasMachstdu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cronos_WasMachstdu		(C_INFO)
{
	npc		 = 	KDW_1401_Addon_Cronos_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cronos_WasMachstdu_Condition;
	information	 = 	DIA_Addon_Cronos_WasMachstdu_Info;

	description	 = 	"Que faites-vous ici ?";
};

func int DIA_Addon_Cronos_WasMachstdu_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Cronos_Hallo))
		{
			return TRUE;
		};
};

func void DIA_Addon_Cronos_WasMachstdu_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cronos_WasMachstdu_15_00"); //Que faites-vous ici ?
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_01"); //(incertain) Ma mission est de m'informer sur les veilleurs du temple.
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_02"); //Ce n'est guère une tâche aisée, laissez-moi vous le dire. Ces sentinelles de pierre possèdent une caractéristique qui m'est totalement étrangère.
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_03"); //Par moments, ils sont complètement inertes. Puis, le temps d'un battement de cils, ils vous attaquent comme s'ils étaient possédés par quelque démon.
	AI_Output	(self, other, "DIA_Addon_Cronos_WasMachstdu_04_04"); //Je n'ai pas encore pu déterminer quelle force les anime, mais une chose est certaine : elle est d'origine magique.
};
///////////////////////////////////////////////////////////////////////
//	Info Waechter
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cronos_Waechter		(C_INFO)
{
	npc		 = 	KDW_1401_Addon_Cronos_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cronos_Waechter_Condition;
	information	 = 	DIA_Addon_Cronos_Waechter_Info;

	description	 = 	"Dites-m'en davantage sur ces sentinelles de pierre.";
};

func int DIA_Addon_Cronos_Waechter_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Cronos_WasMachstdu))
		{
			return TRUE;
		};
};

func void DIA_Addon_Cronos_Waechter_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cronos_Waechter_15_00"); //Dites-m'en davantage sur ces sentinelles de pierre.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_01"); //(incertain) Je ne peux guère vous en dire davantage, pour l'instant. Malheureusement, nous avons dû les anéantir. Désormais, elles ne constituent plus un danger.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_02"); //Lorsque nous nous sommes rendus ici, elles nous ont attaqués.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_03"); //Nous n'avons pu les vaincre qu'en unissant nos forces, et je crains que bien d'autres sentinelles nous attendent par-delà le portail.
	AI_Output	(self, other, "DIA_Addon_Cronos_Waechter_04_04"); //Il doit exister un moyen de bannir la force qui les anime, afin qu'elles redeviennent de simples statues.
	
};
///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cronos_NW_Trade		(C_INFO)
{
	npc		 = 	KDW_1401_Addon_Cronos_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cronos_NW_Trade_Condition;
	information	 = 	DIA_Addon_Cronos_NW_Trade_Info;
	Trade 		 = 	TRUE;
	permanent	 = 	TRUE;
	description	 = 	"Pouvez-vous me vendre du matériel ?";
};

func int DIA_Addon_Cronos_NW_Trade_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Cronos_WasMachstdu))
		{
			return TRUE;
		};
};

var int DIA_Addon_Cronos_NW_Trade_OneTime;

func void DIA_Addon_Cronos_NW_Trade_Info ()
{
	B_GiveTradeInv (self);
	AI_Output	(other, self, "DIA_Addon_Cronos_NW_Trade_15_00"); //Pouvez-vous me vendre du matériel ?

	if (DIA_Addon_Cronos_NW_Trade_OneTime==FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Cronos_NW_Trade_04_01"); //Pourquoi pas ? Si je me souviens bien, nous avons déjà fait affaires.
		
		DIA_Addon_Cronos_NW_Trade_OneTime = TRUE;
	};

	AI_Output	(self, other, "DIA_Addon_Cronos_NW_Trade_04_02"); //Dites-moi ce dont vous avez besoin.

	Log_CreateTopic (Topic_OutTrader,LOG_NOTE);
	B_LogEntry (Topic_OutTrader, LogText_Addon_CronosTrade);

};
