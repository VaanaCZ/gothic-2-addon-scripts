///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Balthasar_EXIT   (C_INFO)
{
	npc         = BAU_932_Balthasar;
	nr          = 999;
	condition   = DIA_Balthasar_EXIT_Condition;
	information = DIA_Balthasar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Balthasar_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Balthasar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Balthasar_HALLO		(C_INFO)
{
	npc		 = 	BAU_932_Balthasar;
	nr		 = 	3;
	condition	 = 	DIA_Balthasar_HALLO_Condition;
	information	 = 	DIA_Balthasar_HALLO_Info;

	description	 = 	"Jak se vede?";
};

func int DIA_Balthasar_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Balthasar_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Balthasar_HALLO_15_00"); //Jak se vede?
	AI_Output			(self, other, "DIA_Balthasar_HALLO_05_01"); //Ach, nová tváâ na farmę. Že by mi nakonec ta stará držgrešle pâece jen sehnala učedníka?
	AI_Output			(other, self, "DIA_Balthasar_HALLO_15_02"); //Nejsem žádný učedník.
	AI_Output			(self, other, "DIA_Balthasar_HALLO_05_03"); //Hm, to vidím. Nejsem už tak mladý jako dâív, však víš. A už léta čekám na nękoho, kdo by to po mnę pâevzal.
	AI_Output			(self, other, "DIA_Balthasar_HALLO_05_04"); //Ty tu asi nejseš kvůli tomu, že jsou naši sousedi naštvaní, co?
	

};

///////////////////////////////////////////////////////////////////////
//	Info wasmachstdu
///////////////////////////////////////////////////////////////////////
instance DIA_Balthasar_WASMACHSTDU		(C_INFO)
{
	npc		 = 	BAU_932_Balthasar;
	nr		 = 	4;
	condition	 = 	DIA_Balthasar_WASMACHSTDU_Condition;
	information	 = 	DIA_Balthasar_WASMACHSTDU_Info;

	description	 = 	"Co je tvoje práce?";
};

func int DIA_Balthasar_WASMACHSTDU_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Balthasar_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Balthasar_WASMACHSTDU_Info ()
{
	AI_Output			(other, self, "DIA_Balthasar_WASMACHSTDU_15_00"); //Co máš na práci?
	AI_Output			(self, other, "DIA_Balthasar_WASMACHSTDU_05_01"); //No, hlídám ovce a dęlám to tak dlouho, co si jen pamatuju.
	AI_Output			(self, other, "DIA_Balthasar_WASMACHSTDU_05_02"); //Ta zvíâata jsou velmi oddaná a chytrá, však víš. Když se o nę dobâe staráš, budou tę poslouchat až do konce života.

};

///////////////////////////////////////////////////////////////////////
//	Info Rangerbandits
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Balthasar_Rangerbandits		(C_INFO)
{
	npc		 = 	BAU_932_Balthasar;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Balthasar_Rangerbandits_Condition;
	information	 = 	DIA_Addon_Balthasar_Rangerbandits_Info;

	description	 = 	"Nevšiml sis, že by tudy procházeli nęjací bandité?";
};

func int DIA_Addon_Balthasar_Rangerbandits_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Balthasar_HALLO))
	&& (
		(MIS_Vatras_FindTheBanditTrader == LOG_RUNNING)		
		||(SC_KnowsLuciaCaughtByBandits == TRUE)
		)
		{
			return TRUE;
		};
};

func void DIA_Addon_Balthasar_Rangerbandits_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Balthasar_Rangerbandits_15_00"); //Nevidęls tudy procházet nęjaké bandity?
	AI_Output	(self, other, "DIA_Addon_Balthasar_Rangerbandits_05_01"); //Samozâejmę. Šli podél pole u Sekobova statku a na severu vstoupili do lesa.
	
	if (MIS_Vatras_FindTheBanditTrader == LOG_RUNNING)	
	{
		AI_Output	(self, other, "DIA_Addon_Balthasar_Rangerbandits_05_02"); //Męli s sebou spoustu zbraní. Vyzbrojili by tím i královu armádu.
	};
	
	if (SC_KnowsLuciaCaughtByBandits == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Balthasar_Rangerbandits_05_03"); //Jestli mę nešálil zrak, tak do lesa táhli i nęjakou mladou ženu.
		AI_Output	(self, other, "DIA_Addon_Balthasar_Rangerbandits_05_04"); //Fakt doufám, že ji nechali být.
	};
	B_GivePlayerXP (XP_Ambient);
	AI_Output	(self, other, "DIA_Addon_Balthasar_Rangerbandits_05_05"); //Ale jsem rád, že se vyhnuli mýmu statku.
};

///////////////////////////////////////////////////////////////////////
//	Info aergermitnachbarn
///////////////////////////////////////////////////////////////////////
instance DIA_Balthasar_AERGERMITNACHBARN		(C_INFO)
{
	npc		 = 	BAU_932_Balthasar;
	nr		 = 	5;
	condition	 = 	DIA_Balthasar_AERGERMITNACHBARN_Condition;
	information	 = 	DIA_Balthasar_AERGERMITNACHBARN_Info;

	description	 = 	"Co máš za problémy se sousedy?";
};

func int DIA_Balthasar_AERGERMITNACHBARN_Condition ()
{
	if (
		(Npc_KnowsInfo(other, DIA_Balthasar_WASMACHSTDU))
		&& ((hero.guild == GIL_NONE)||(hero.guild == GIL_SLD)||(hero.guild == GIL_DJG))
		&& 	(
			((Npc_IsDead(BalthasarSheep1))== FALSE)
			|| ((Npc_IsDead(BalthasarSheep2))== FALSE)
			|| ((Npc_IsDead(BalthasarSheep3))== FALSE)
			)
		)
			{
					return TRUE;
			};
};

func void DIA_Balthasar_AERGERMITNACHBARN_Info ()
{
	AI_Output			(other, self, "DIA_Balthasar_AERGERMITNACHBARN_15_00"); //Co máš za problémy se sousedy?
	AI_Output			(self, other, "DIA_Balthasar_AERGERMITNACHBARN_05_01"); //Tráva na téhle stranę lánu je vždycky zakrslá a suchá. Tak vętšinou chodím na pastviny jiných farmáâů.
	AI_Output			(self, other, "DIA_Balthasar_AERGERMITNACHBARN_05_02"); //Velkostatkáâi to nevadí, ale Bengar, farmáâ z náhorních pastvin, dęlá hroznej virvál, když tam vezmu naše zvíâata.
	AI_Output			(self, other, "DIA_Balthasar_AERGERMITNACHBARN_05_03"); //Âíká, že by mu męl Sekob platit za to, že beru ovce na Bengarovy pastviny.
	AI_Output			(self, other, "DIA_Balthasar_AERGERMITNACHBARN_05_04"); //Ale Sekob na to nechce dát ani zlámanou grešli, takže už dál nemůžu nahoru chodit.
};

///////////////////////////////////////////////////////////////////////
//	Info woBengar
///////////////////////////////////////////////////////////////////////
instance DIA_Balthasar_WOBENGAR		(C_INFO)
{
	npc		 = 	BAU_932_Balthasar;
	nr		 = 	10;
	condition	 = 	DIA_Balthasar_WOBENGAR_Condition;
	information	 = 	DIA_Balthasar_WOBENGAR_Info;

	description	 = 	"Kde bych našel horní pastviny a Bengarovu farmu?";
};

func int DIA_Balthasar_WOBENGAR_Condition ()
{
	if 	(Npc_KnowsInfo(other, DIA_Balthasar_AERGERMITNACHBARN))
		&& ((hero.guild == GIL_NONE)||(hero.guild == GIL_SLD)||(hero.guild == GIL_DJG))
			{
				return TRUE;
			};
};

func void DIA_Balthasar_WOBENGAR_Info ()
{
	AI_Output			(other, self, "DIA_Balthasar_WOBENGAR_15_00"); //Jak se dostanu na horní pastviny a Bengarovu farmu?
	AI_Output			(self, other, "DIA_Balthasar_WOBENGAR_05_01"); //Jdi po téhle cestę, až narazíš na kâižovatku.
	AI_Output			(self, other, "DIA_Balthasar_WOBENGAR_05_02"); //Když se dáš napravo, uvidíš hromadu balvanů. Napravo za nimi jsou náhorní pastviny a průsmyk.
};


///////////////////////////////////////////////////////////////////////
//	Info talktoBengar
///////////////////////////////////////////////////////////////////////
instance DIA_Balthasar_TALKTOBENGAR		(C_INFO)
{
	npc		 = 	BAU_932_Balthasar;
	nr		 = 	6;
	condition	 = 	DIA_Balthasar_TALKTOBENGAR_Condition;
	information	 = 	DIA_Balthasar_TALKTOBENGAR_Info;

	description	 = 	"Možná bych si męl promluvit s Bengarem.";
};

func int DIA_Balthasar_TALKTOBENGAR_Condition ()
{
	if (
		(Npc_KnowsInfo(other, DIA_Balthasar_AERGERMITNACHBARN))
		&& ((hero.guild == GIL_NONE)||(hero.guild == GIL_SLD)||(hero.guild == GIL_DJG))
		&& 	(
			((Npc_IsDead(BalthasarSheep1))== FALSE)
			|| ((Npc_IsDead(BalthasarSheep2))== FALSE)
			|| ((Npc_IsDead(BalthasarSheep3))== FALSE)
			)
		)
			{
					return TRUE;
			};
};

func void DIA_Balthasar_TALKTOBENGAR_Info ()
{
	AI_Output			(other, self, "DIA_Balthasar_TALKTOBENGAR_15_00"); //Možná bych si męl promluvit s Bengarem.
	AI_Output			(self, other, "DIA_Balthasar_TALKTOBENGAR_05_01"); //Ty bys to pro mę udęlal? Co mu âekneš? Totiž, nechtęl bych žádný problémy, rozumíš?
	AI_Output			(other, self, "DIA_Balthasar_TALKTOBENGAR_15_02"); //Uvidíme.

	Log_CreateTopic (TOPIC_BalthasarsSchafe, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BalthasarsSchafe, LOG_RUNNING);
	B_LogEntry (TOPIC_BalthasarsSchafe,"Sedlák Bengar zakázal ovčáku Balthazarovi, aby své ovce vedl nahoru na pastviny."); 
	MIS_Balthasar_BengarsWeide = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info Bengarueberredet
///////////////////////////////////////////////////////////////////////
instance DIA_Balthasar_BENGARUEBERREDET		(C_INFO)
{
	npc		 = 	BAU_932_Balthasar;
	nr		 = 	8;
	condition	 = 	DIA_Balthasar_BENGARUEBERREDET_Condition;
	information	 = 	DIA_Balthasar_BENGARUEBERREDET_Info;

	description	 = 	"Můžeš své ovce opęt pâivést za Bengarovy pastviny.";
};

func int DIA_Balthasar_BENGARUEBERREDET_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_Balthasar_TALKTOBENGAR))
		&& (MIS_Balthasar_BengarsWeide == LOG_SUCCESS)
		&& ((hero.guild == GIL_NONE)||(hero.guild == GIL_SLD)||(hero.guild == GIL_DJG))
		&& 	(
			((Npc_IsDead(BalthasarSheep1))== FALSE)
			|| ((Npc_IsDead(BalthasarSheep2))== FALSE)
			|| ((Npc_IsDead(BalthasarSheep3))== FALSE)
			)
		)
			{
					return TRUE;
			};
};

func void DIA_Balthasar_BENGARUEBERREDET_Info ()
{
	AI_Output			(other, self, "DIA_Balthasar_BENGARUEBERREDET_15_00"); //Už zase můžeš svoje ovce brát na Bengarovy pastviny. Právę jsem s ním mluvil.
	AI_Output			(self, other, "DIA_Balthasar_BENGARUEBERREDET_05_01"); //Díky. Hned vyrazím na cestu.
	AI_Output			(self, other, "DIA_Balthasar_BENGARUEBERREDET_05_02"); //Tady, vezmi si na důkaz mé vdęčnosti tuhle ovčí kůži.

	B_GiveInvItems (self, other, ItAt_SheepFur, 10);  

	AI_StopProcessInfos (self);

	Npc_ExchangeRoutine	(self,"BengarsWeide"); 	

	B_GivePlayerXP (XP_Balthasar_BengarsWeide);

	//Joly: "NW_BIGMILL_FARM3_BALTHASAR"
	
	Wld_InsertNpc	(Sheep,"NW_BIGMILL_FARM3_BALTHASAR"); 
	Wld_InsertNpc	(Sheep,"NW_BIGMILL_FARM3_BALTHASAR"); 
	Wld_InsertNpc	(Hammel,"NW_BIGMILL_FARM3_BALTHASAR"); 

	BalthasarSheep1 = Hlp_GetNpc (Balthasar_Sheep1); 

	if (Hlp_IsValidNpc(BalthasarSheep1))
	&& (!Npc_IsDead(BalthasarSheep1))
		{
			AI_StartState (BalthasarSheep1, ZS_MM_Rtn_Follow_Sheep_Balthasar, 1, "");
		};
	BalthasarSheep2 = Hlp_GetNpc (Balthasar_Sheep2); 

	if (Hlp_IsValidNpc(BalthasarSheep2))
	&& (!Npc_IsDead(BalthasarSheep2))
		{
			AI_StartState (BalthasarSheep2, ZS_MM_Rtn_Follow_Sheep_Balthasar, 1, "");
		};	
	BalthasarSheep3 = Hlp_GetNpc (Balthasar_Sheep3); 

	if (Hlp_IsValidNpc(BalthasarSheep3))
	&& (!Npc_IsDead(BalthasarSheep3))
		{
			AI_StartState (BalthasarSheep3, ZS_MM_Rtn_Follow_Sheep_Balthasar, 1, "");
		};
};

///////////////////////////////////////////////////////////////////////
//	Info permKap1
///////////////////////////////////////////////////////////////////////
instance DIA_Balthasar_PERMKAP1		(C_INFO)
{
	npc		 = 	BAU_932_Balthasar;
	nr		 = 	70;
	condition	 = 	DIA_Balthasar_PERMKAP1_Condition;
	information	 = 	DIA_Balthasar_PERMKAP1_Info;
	permanent	 = 	TRUE;

	description	 = 	"A co jinak. Všechno v poâádku?";
};

func int DIA_Balthasar_PERMKAP1_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Balthasar_WASMACHSTDU)) 
		{
				return TRUE;
		};
};

func void DIA_Balthasar_PERMKAP1_Info ()
{
	AI_Output			(other, self, "DIA_Balthasar_PERMKAP1_15_00"); //A co jinak. Všechno v poâádku?
	
	Npc_PerceiveAll(self);
	if 	(
				(
					( Wld_DetectNpc(self,Balthasar_Sheep1,NOFUNC,-1) && (Npc_GetDistToNpc(self, other)<2000) )
					||( Wld_DetectNpc(self,Balthasar_Sheep2,NOFUNC,-1) && (Npc_GetDistToNpc(self, other)<2000) )
					||( Wld_DetectNpc(self,Balthasar_Sheep3,NOFUNC,-1) && (Npc_GetDistToNpc(self, other)<2000) )
					||( Wld_DetectNpc(self,Sheep,NOFUNC,-1) && (Npc_GetDistToNpc(self, other)<2000) )
					||( Wld_DetectNpc(self,Hammel,NOFUNC,-1) && (Npc_GetDistToNpc(self, other)<2000) )
				)
		)
			
				{
					AI_Output			(self, hero, "DIA_Balthasar_PERMKAP1_05_01"); //Nemůžu si stęžovat. Díky za optání.
					AI_StopProcessInfos (self);
				}
	else
			{
				AI_Output			(self, hero, "DIA_Balthasar_PERMKAP1_05_02"); //Jsou to teë tęžké časy. Nemůžu najít své ovce!
				if (Npc_IsDead(Sekob)== FALSE)
				{
					AI_Output			(self, hero, "DIA_Balthasar_PERMKAP1_05_03"); //Hádám, že bych o tom męl âíct Sekobovi.
				};
				AI_StopProcessInfos (self);
				Npc_ExchangeRoutine	(self,"Začít"); //Joly: falls er auf der 2. Weide bei Bengar ist.
			};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Balthasar_PICKPOCKET (C_INFO)
{
	npc			= BAU_932_Balthasar;
	nr			= 900;
	condition	= DIA_Balthasar_PICKPOCKET_Condition;
	information	= DIA_Balthasar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Balthasar_PICKPOCKET_Condition()
{
	C_Beklauen (10, 10);
};
 
FUNC VOID DIA_Balthasar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Balthasar_PICKPOCKET);
	Info_AddChoice		(DIA_Balthasar_PICKPOCKET, DIALOG_BACK 		,DIA_Balthasar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Balthasar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Balthasar_PICKPOCKET_DoIt);
};

func void DIA_Balthasar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Balthasar_PICKPOCKET);
};
	
func void DIA_Balthasar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Balthasar_PICKPOCKET);
};
















