// ************************************************************
// 			  					EXIT
// ************************************************************
INSTANCE DIA_Bartok_EXIT   (C_INFO)
{
	npc         = VLK_440_Bartok;
	nr          = 999;
	condition   = DIA_Bartok_EXIT_Condition;
	information = DIA_Bartok_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Bartok_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Bartok_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Bartok_PICKPOCKET (C_INFO)
{
	npc			= VLK_440_Bartok;
	nr			= 900;
	condition	= DIA_Bartok_PICKPOCKET_Condition;
	information	= DIA_Bartok_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Ukrást tento toulec se šípy je tak snadné jako vzít dítęti bonbón.)";
};                       

FUNC INT DIA_Bartok_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems (self, ItRw_Arrow) >= 40)
	&& (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Bartok_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Bartok_PICKPOCKET);
	Info_AddChoice		(DIA_Bartok_PICKPOCKET, DIALOG_BACK 		,DIA_Bartok_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Bartok_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Bartok_PICKPOCKET_DoIt);
};

func void DIA_Bartok_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		
		B_GiveInvItems (self, other, ItRw_Arrow, 40);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Bartok_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel(); 
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Bartok_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Bartok_PICKPOCKET);
};

// *****************************************************
//						Hallo
// *****************************************************
INSTANCE DIA_Bartok_Hallo (C_INFO)
{
	npc			= VLK_440_Bartok;
	nr			= 1;
	condition	= DIA_Bartok_Hallo_Condition;
	information	= DIA_Bartok_Hallo_Info;
	permanent	= FALSE;
	description = "Jak to jde?";
};                       
FUNC INT DIA_Bartok_Hallo_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Bartok_Hallo_Info()
{	
	AI_Output (other ,self,"DIA_Bartok_Hello_15_00"); //Jak se vede?
	AI_Output (self ,other,"DIA_Bartok_Hello_04_01"); //Ty nejsi tady z okolí, co? Nevadí - ani já ne.
	AI_Output (other ,self,"DIA_Bartok_Hello_15_02"); //Kde ses toulal dâív?
	AI_Output (self ,other,"DIA_Bartok_Hello_04_03"); //V lesích, společnę s dalšími lovci jsme chytali mrchožrouty a vlky.
	AI_Output (self ,other,"DIA_Bartok_Hello_04_04"); //Ale nechal jsem toho. Teë jsou nebezpečný časy. Pohybuje se tu spousta různý chátry.
};
// *****************************************************
//						Jaeger
// *****************************************************
INSTANCE DIA_Bartok_Jaeger(C_INFO)
{
	npc			= VLK_440_Bartok;
	nr			= 2;
	condition	= DIA_Bartok_Jaeger_Condition;
	information	= DIA_Bartok_Jaeger_Info;
	permanent	= FALSE;
	description	= "Kde najdu ty ostatní lovce?";
};                       
FUNC INT DIA_Bartok_Jaeger_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Bartok_Hallo))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bartok_Jaeger_Info()
{	
	AI_Output (other ,self,"DIA_Bartok_Jager_15_00"); //Kde najdu ty ostatní lovce?
	AI_Output (self ,other,"DIA_Bartok_Jager_04_01"); //Męli jsme tábor venku, poblíž krčmy, napůl cesty k Onarovę farmę.
	AI_Output (self ,other,"DIA_Bartok_Jager_04_02"); //Ale nevím, jestli tam ještę nękdo zůstal.
	
	AI_Output (self ,other,"DIA_Addon_Bartok_Jager_04_00"); //Pâed pár dny jsme oba byli ve męstę.
	AI_Output (self ,other,"DIA_Addon_Bartok_Jager_04_01"); //Můj kamarád Trokar je skvęlý lovec.
};	

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Bartok_MissingPeople		(C_INFO)
{
	npc		 = 	VLK_440_Bartok;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Bartok_MissingPeople_Condition;
	information	 = 	DIA_Addon_Bartok_MissingPeople_Info;

	description	 = 	"A kde je ten tvůj kamarád Trokar teë?";
};

func int DIA_Addon_Bartok_MissingPeople_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Bartok_Jaeger))
		{
			return TRUE;
		};
};

func void DIA_Addon_Bartok_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bartok_MissingPeople_15_00"); //A kde je tvůj kamarád Trokar teë?
	AI_Output	(self, other, "DIA_Addon_Bartok_MissingPeople_04_01"); //No, je to všecko dost divné.
	AI_Output	(self, other, "DIA_Addon_Bartok_MissingPeople_04_02"); //Ještę pâed pár dny jsme spolu sedęli u baru v Coragonovę krčmę a bavili se o lovu.
	AI_Output	(self, other, "DIA_Addon_Bartok_MissingPeople_04_03"); //Co bylo pak, to se mę ale neptej. Už jsem męl beztak trochu upito.
	AI_Output	(self, other, "DIA_Addon_Bartok_MissingPeople_04_04"); //Matnę si pamatuju, že Trokar âíkal, že jde ven pro pár jointů z trávy z bažin. Ale už se nikdy nevrátil.

	MIS_Bartok_MissingTrokar = LOG_RUNNING;
	
	Info_ClearChoices	(DIA_Addon_Bartok_MissingPeople);
	Info_AddChoice	(DIA_Addon_Bartok_MissingPeople, "Copak jsi ho nehledal?", DIA_Addon_Bartok_MissingPeople_such );
	Info_AddChoice	(DIA_Addon_Bartok_MissingPeople, "A kde teda seženu nęjaké jointy z trávy z bažin?", DIA_Addon_Bartok_MissingPeople_wo );
};
func void DIA_Addon_Bartok_MissingPeople_wo ()
{
	AI_Output			(other, self, "DIA_Addon_Bartok_MissingPeople_wo_15_00"); //Kde se dají ty jointy sehnat?
	AI_Output			(self, other, "DIA_Addon_Bartok_MissingPeople_wo_04_01"); //Pokud vím, tak nękde v pâístavu.
};
func void DIA_Addon_Bartok_MissingPeople_such ()
{
	AI_Output			(other, self, "DIA_Addon_Bartok_MissingPeople_such_15_00"); //A to jsi ho nešel hledat?
	AI_Output			(self, other, "DIA_Addon_Bartok_MissingPeople_such_04_01"); //Ne, ale nahlásil jsem to domobranę.
	AI_Output			(self, other, "DIA_Addon_Bartok_MissingPeople_such_04_02"); //Ale ani ta ho ještę nenašla.
	AI_Output			(self, other, "DIA_Addon_Bartok_MissingPeople_such_04_03"); //Doufám, že ho nenapadl vlk nebo nęco horšího.
	AI_Output			(self, other, "DIA_Addon_Bartok_MissingPeople_such_04_04"); //Bojím se, že až jednou vyrazím na lov, najdu nękde ležet jeho mrtvolu.
	AI_Output			(self, other, "DIA_Addon_Bartok_MissingPeople_such_04_05"); //To bych asi nerozdýchal.
};

// *****************************************************
//						Bosper
// *****************************************************
INSTANCE DIA_Bartok_Bosper (C_INFO)
{
	npc			= VLK_440_Bartok;
	nr			= 3;
	condition	= DIA_Bartok_Bosper_Condition;
	information	= DIA_Bartok_Bosper_Info;
	permanent	= FALSE;
	description	= "Bosper âíkal, že jsi pro nęj pracoval...";
};                       
FUNC INT DIA_Bartok_Bosper_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Bosper_Bartok))
	&& (Npc_KnowsInfo (other, DIA_Bartok_Hallo))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bartok_Bosper_Info()
{	
	AI_Output (other ,self,"DIA_Bartok_Bosper_15_00"); //Bosper âíkal, že jsi pro nęj pracoval.
	AI_Output (self ,other,"DIA_Bartok_Bosper_04_01"); //Ano, pracoval. Ale on se zajímal jen o ty svý kůže.
	AI_Output (self ,other,"DIA_Bartok_Bosper_04_02"); //Âíkal jsem mu, jak je to venku nebezpečný. Ale vůbec mę neposlouchal.
	AI_Output (self ,other,"DIA_Bartok_Bosper_04_03"); //No, ale jinak platil dobâe - na to si nemůžu stęžovat.
	AI_Output (other ,self,"DIA_Bartok_Bosper_15_04"); //Můžeš mi o nęm nęco âíct?
	AI_Output (self ,other,"DIA_Bartok_Bosper_04_05"); //(smích) Bosperovi nękdo nedávno ukradl luk. Za bílého dne.
	AI_Output (self ,other,"DIA_Bartok_Bosper_04_06"); //Nęjakej chlap prostę nakráčel do jeho skladu, vzal ten luk a zmizel.
	AI_Output (self ,other,"DIA_Bartok_Bosper_04_07"); //Ti zlodęji jsou čím dál tím drzejší!
	
	if (MIS_Bosper_Bogen != LOG_SUCCESS) 
	{    
		MIS_Bosper_Bogen = LOG_RUNNING;
	};   
};
	
// *****************************************************
//						WannaLearn
// *****************************************************
INSTANCE DIA_Bartok_WannaLearn (C_INFO)
{
	npc			= VLK_440_Bartok;
	nr			= 4;
	condition	= DIA_Bartok_WannaLearn_Condition;
	information	= DIA_Bartok_WannaLearn_Info;
	permanent	= FALSE;
	description	= "Můžeš mę naučit nęco o lovu?";
};                       
FUNC INT DIA_Bartok_WannaLearn_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Bartok_Hallo))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bartok_WannaLearn_Info()
{	
	AI_Output (other ,self,"DIA_Bartok_WannaLearn_15_00"); //Můžeš mę naučit nęco o lovu?
	AI_Output (self ,other,"DIA_Bartok_WannaLearn_04_01"); //Můžu tę naučit, jak se poâádnę plížit a jak zacházet s lukem.
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		AI_Output (self ,other,"DIA_Bartok_WannaLearn_04_02"); //Jestli se chceš naučit stahovat zvíâata, zajdi za Bosperem. On už bude vędęt, co a jak.
	};
	
	Bartok_TeachPlayer = TRUE;
	
	Log_CreateTopic (Topic_CityTeacher, LOG_NOTE);
	B_LogEntry (Topic_CityTeacher, "Bartok mę naučí lukostâelbę a umęní plížit se.");
};

// *****************************************************
//						TeachSneak
// *****************************************************
INSTANCE DIA_Bartok_TeachSneak (C_INFO)
{
	npc			= VLK_440_Bartok;
	nr			= 4;
	condition	= DIA_Bartok_TeachSneak_Condition;
	information	= DIA_Bartok_TeachSneak_Info;
	permanent	= TRUE;
	description	= B_BuildLearnString ("Nauč mę, prosím, jak se plížit!", B_GetLearnCostTalent(other, NPC_TALENT_SNEAK, 1));
};                       
FUNC INT DIA_Bartok_TeachSneak_Condition()
{
	if (Bartok_TeachPlayer == TRUE)
	&& (Npc_GetTalentSkill(other, NPC_TALENT_SNEAK) == 0)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bartok_TeachSneak_Info()
{	
	AI_Output (other ,self,"DIA_Bartok_TeachSneak_15_00"); //Nauč mę, jak se plížit!
	
	if (B_TeachThiefTalent (self, other, NPC_TALENT_SNEAK))
	{
		AI_Output (self ,other,"DIA_Bartok_TeachSneak_04_01"); //Dobrá - tak nejdâív se musíš ujistit, že správnę pâesouváš své tęžištę.
		AI_Output (self ,other,"DIA_Bartok_TeachSneak_04_02"); //Na to musíš ohnout kolena a došlapovat na paty.
		AI_Output (self ,other,"DIA_Bartok_TeachSneak_04_03"); //Musíš mít vždycky váhu svýho tęla na noze, na který stojíš, až do tý doby, než tou druhou jistę došlápneš.
		AI_Output (self ,other,"DIA_Bartok_TeachSneak_04_04"); //Kolem vętšiny zvíâat se nemůžeš proplížit, pokud nespí. Ty potvory tę prostę vycítí.
		AI_Output (self ,other,"DIA_Bartok_TeachSneak_04_05"); //Takže vždycky, když jsi venku, dávej dobrej pozor.
	};
};

// *****************************************************
//						TEACH
// *****************************************************
var int Bosper_MerkeBow;
// ---------------------

INSTANCE DIA_Bartok_Teach (C_INFO)
{
	npc			= VLK_440_Bartok;
	nr			= 4;
	condition	= DIA_Bartok_Teach_Condition;
	information	= DIA_Bartok_Teach_Info;
	permanent	= TRUE;
	Description = "Chci se naučit líp zacházet s lukem!";
};                       
FUNC INT DIA_Bartok_Teach_Condition()
{
	if (Bartok_TeachPlayer == TRUE)
	{
		return TRUE;
	};
};
func VOID DIA_Bartok_Teach_Info()
{	
	AI_Output (other,self ,"DIA_Bartok_TeachBow_15_00"); //Chci se naučit líp zacházet s lukem!
	AI_Output (self ,other,"DIA_Bartok_TeachBow_04_01"); //Fajn, tak se podíváme, jestli s tím můžu nęco dęlat.
	
	Bosper_MerkeBow = other.HitChance[NPC_TALENT_BOW];
	
	Info_ClearChoices (DIA_Bartok_Teach);
	
	Info_AddChoice		(DIA_Bartok_Teach,DIALOG_BACK,DIA_Bartok_Teach_Back);
	Info_AddChoice		(DIA_Bartok_Teach, B_BuildLearnString(PRINT_LearnBow1, 	B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)),DIA_Bartok_Teach_BOW_1);
	Info_AddChoice		(DIA_Bartok_Teach, B_BuildLearnString(PRINT_LearnBow5, 	B_GetLearnCostTalent(other, NPC_TALENT_BOW, 5)),DIA_Bartok_Teach_BOW_5);
};

FUNC VOID DIA_Bartok_Teach_BACK()
{
	if (other.HitChance[NPC_TALENT_BOW] >= 60)
	{
		AI_Output(self,other,"DIA_Bartok_TeachBow_BACK_04_00"); //Męl by ses podívat po nękom, kdo o tom ví víc než já.
	}
	else if (Bosper_MerkeBow < other.HitChance[NPC_TALENT_BOW])
	{
		AI_Output(self,other,"DIA_Bartok_TeachBow_BACK_04_01"); //Dobrá, už jsi dosáhl vętší pâesnosti.
	};
	
	Info_ClearChoices (DIA_Bartok_Teach);
};

FUNC VOID DIA_Bartok_Teach_Bow_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_BOW, 1, 60);
	
	Info_ClearChoices (DIA_Bartok_Teach);
	Info_AddChoice	  (DIA_Bartok_Teach,DIALOG_BACK,DIA_Bartok_Teach_Back);
	Info_AddChoice	  (DIA_Bartok_Teach, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)),DIA_Bartok_Teach_Bow_1);
	Info_AddChoice	  (DIA_Bartok_Teach, B_BuildLearnString(PRINT_LearnBow5, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 5)),DIA_Bartok_Teach_BOW_5);
};
FUNC VOID DIA_Bartok_Teach_Bow_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_BOW, 5, 60);

	Info_ClearChoices (DIA_Bartok_Teach);
	Info_AddChoice	  (DIA_Bartok_Teach,DIALOG_BACK,DIA_Bartok_Teach_Back);
	Info_AddChoice	  (DIA_Bartok_Teach, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)),DIA_Bartok_Teach_Bow_1);
	Info_AddChoice	  (DIA_Bartok_Teach, B_BuildLearnString(PRINT_LearnBow5, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 5)),DIA_Bartok_Teach_BOW_5);	
};

// *****************************************************
//						Zusammen
// *****************************************************
var int Bartok_Bereit; 
var int Bartok_Later;
// ---------------------------

INSTANCE DIA_Bartok_Zusammen (C_INFO)
{
	npc			= VLK_440_Bartok;
	nr			= 5;
	condition	= DIA_Bartok_Zusammen_Condition;
	information	= DIA_Bartok_Zusammen_Info;
	permanent	= TRUE;
	description	= "Co takhle jít lovit společnę?";
};                       
FUNC INT DIA_Bartok_Zusammen_Condition()
{
	if (Bartok_Bereit == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Bartok_Hallo))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bartok_Zusammen_Info()
{	
	if (Bartok_Later == FALSE)
	{
		AI_Output (other ,self,"DIA_Bartok_Zusammen_15_00"); //Co takhle jít lovit společnę?
		AI_Output (self ,other,"DIA_Bartok_Zusammen_04_01"); //Hmm. Ve dvou to nebude tak nebezpečné, to je pravda.
		AI_Output (self ,other,"DIA_Bartok_Zusammen_04_02"); //Víš aspoŕ nęco o lovu?
		AI_Output (self ,other,"DIA_Bartok_Zusammen_04_03"); //Myslím, jak stahovat zvíâata?
	};
	
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == TRUE)
	{
		if (Bartok_Later == TRUE)
		{
			AI_Output (self ,other,"DIA_Bartok_HuntNOW_04_01"); //Máš 50 zlaăáků?
		}
		else
		{
			AI_Output (other ,self,"DIA_Bartok_Zusammen_15_04"); //Ano.
			AI_Output (self ,other,"DIA_Bartok_Zusammen_04_05"); //Dobrá, ale chci nejdâív vidęt 50 zlatých. Za to si můžeš nechat všechny kůže a prodat je Bosperovi.
			AI_Output (self ,other,"DIA_Bartok_Zusammen_04_06"); //To je férová nabídka, ne?
		};
		
		Info_ClearChoices (DIA_Bartok_Zusammen);
		Info_AddChoice	  (DIA_Bartok_Zusammen, "Pozdęji...", DIA_Bartok_Zusammen_Later);
		Info_AddChoice	  (DIA_Bartok_Zusammen, "Jak chceš...", DIA_Bartok_Zusammen_Pay);
	}
	else
	{
		AI_Output (other ,self,"DIA_Bartok_Zusammen_15_07"); //Ne.
		AI_Output (self ,other,"DIA_Bartok_Zusammen_04_08"); //V tom pâípadę to za to nestojí.
		AI_Output (self ,other,"DIA_Bartok_Zusammen_04_09"); //Vraă se, až se nęco naučíš.
	};
};

func void DIA_Bartok_Zusammen_Later()
{
	AI_Output (other ,self,"DIA_Bartok_HuntNOW_Later_15_00"); //Pozdęji...
	Bartok_Later = TRUE;
	Info_ClearChoices (DIA_Bartok_Zusammen);
};

func void DIA_Bartok_Zusammen_Pay()
{
	Info_ClearChoices (DIA_Bartok_Zusammen);
	
	if (B_GiveInvItems (other, self, itmi_gold, 50))
	{
		AI_Output (other ,self,"DIA_Bartok_HuntNOW_GO_15_00"); //Tady jsou.
		Bartok_Bereit = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Bartok_HuntNOW_GO_04_03"); //A kde? Nemáš zlato.
	};
};


// *****************************************************
//						HuntNOW
// *****************************************************
var int Bartok_Los;
// ----------------------

INSTANCE DIA_Bartok_HuntNOW (C_INFO)
{
	npc			= VLK_440_Bartok;
	nr			= 5;
	condition	= DIA_Bartok_HuntNOW_Condition;
	information	= DIA_Bartok_HuntNOW_Info;
	permanent	= FALSE;
	description	= "Jdeme na lov!";
};                       
FUNC INT DIA_Bartok_HuntNOW_Condition()
{
	if (Bartok_Bereit == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bartok_HuntNOW_Info()
{	
	AI_Output (other ,self,"DIA_Bartok_HuntNOW_15_00"); //Jdeme na lov!
	AI_Output (self ,other,"DIA_Bartok_HuntNOW_GO_04_01"); //Dobrá, pojë za mnou. Venku za jižní bránou je les, kde se dá tý havęti najít víc než dost.
	AI_Output (self ,other,"DIA_Bartok_HuntNOW_GO_04_02"); //(pro sebe) Možná víc, než by nám mohlo líbit.
	Bartok_Los = TRUE;
		
	AI_StopProcessInfos (self);
	
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (self, "GUIDEMITTE");
	
	Wld_InsertNpc		(Wolf, 		"NW_FARM1_CITYWALL_FOREST_02"); 
	Wld_InsertNpc		(Wolf, 		"NW_FARM1_CITYWALL_FOREST_02");
	Wld_InsertNpc		(Wolf, 		"NW_FARM1_CITYWALL_FOREST_02");
};

// *****************************************************
//						Im Wald
// *****************************************************
var int Bartok_OrkStillThere;
// ---------------------

INSTANCE DIA_Bartok_ImWald (C_INFO)
{
	npc			= VLK_440_Bartok;
	nr			= 1;
	condition	= DIA_Bartok_ImWald_Condition;
	information	= DIA_Bartok_ImWald_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Bartok_ImWald_Condition()
{
	if (Bartok_Los == TRUE)
	&& (Npc_GetDistToWP (self, "NW_FARM1_CITYWALL_FOREST_03") < 500)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bartok_ImWald_Info()
{	
	AI_Output (self ,other,"DIA_Bartok_ImWald_04_00"); //Tak co myslíš, půjdeme dál do lesa, nebo ne?
	
	Info_ClearChoices (DIA_Bartok_ImWald);
	Info_AddChoice	  (DIA_Bartok_ImWald, "Vraăme se!", DIA_Bartok_ImWald_NachHause);
	Info_AddChoice	  (DIA_Bartok_ImWald, "Pokračujem.", DIA_Bartok_ImWald_Weiter);
};

func void DIA_Bartok_ImWald_NachHause()
{
	AI_Output (other ,self,"DIA_Bartok_ImWald_NachHause_15_00"); //Vraăme se!
	AI_Output (self ,other,"DIA_Bartok_ImWald_NachHause_04_01"); //Taky bych se radęj vrátil. Nejspíš by se nám podaâilo vbęhnout pâímo do náručí nęjakýmu skâetovi.
	
	Info_ClearChoices (DIA_Bartok_ImWald);
	AI_StopProcessInfos (self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine (self, "START");
};

func void DIA_Bartok_ImWald_Weiter()
{
	AI_Output (other ,self,"DIA_Bartok_ImWald_Weiter_15_00"); //Pokračujem.
	AI_Output (self ,other,"DIA_Bartok_ImWald_Weiter_04_01"); //Dobrá. (pro sebe) Doufejme, že se to nęjak vyâeší.
	
	if (!Npc_IsDead(CityOrc))
	{
		Bartok_OrkStillThere = TRUE;
	};
	
	Info_ClearChoices (DIA_Bartok_ImWald);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "GUIDEENDE");
};

// *****************************************************
//						Angekommen
// *****************************************************
var int Bartok_Ende;
// -------------------

INSTANCE DIA_Bartok_Angekommen (C_INFO)
{
	npc			= VLK_440_Bartok;
	nr			= 1;
	condition	= DIA_Bartok_Angekommen_Condition;
	information	= DIA_Bartok_Angekommen_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Bartok_Angekommen_Condition()
{
	if (Bartok_Los == TRUE)
	&& (Npc_GetDistToWP (self, "NW_FARM1_CITYWALL_FOREST_07") < 500)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bartok_Angekommen_Info()
{	
	AI_Output (self ,other,"DIA_Bartok_Angekommen_04_00"); //Tak! Myslím, že se vrátím do męsta.
	AI_Output (self ,other,"DIA_Bartok_Angekommen_04_01"); //Tady venku je to pro mę prostę pâíliš nebezpečný - dokonce pro nás oba.
	
	if (Bartok_OrkStillThere == TRUE)
	//&& (Npc_IsDead (CityOrc))
	{
		B_Bartok_ShitAnOrc();
		
		Bartok_OrkGesagt = TRUE;
	};
	
	AI_Output (self ,other,"DIA_Bartok_Angekommen_04_03"); //Tak nashle!
	AI_Output (self ,other,"DIA_Bartok_Angekommen_04_04"); //Můžeš ty kůže prodat Bosperovi.
	
	Bartok_Ende = TRUE;
	AI_StopProcessInfos (self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine (self, "START");
	
};

// *****************************************************
//							PERM
// *****************************************************
INSTANCE DIA_Bartok_PERM (C_INFO)
{
	npc			= VLK_440_Bartok;
	nr			= 1;
	condition	= DIA_Bartok_PERM_Condition;
	information	= DIA_Bartok_PERM_Info;
	permanent	= TRUE;
	description = "Je všechno v poâádku?";
};                       
FUNC INT DIA_Bartok_PERM_Condition()
{
	if (Bartok_Los == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bartok_PERM_Info()
{	
	AI_Output (other ,self,"DIA_Bartok_PERM_15_00"); //V pohodę?
	
	if (Bartok_Ende == TRUE)
	{		
		AI_Output (self ,other,"DIA_Bartok_PERM_04_01"); //Ano. Ale za brány męsta už mę nikdy nikdo nedostane - alespoŕ ne v dohledný dobę.
		if (Bartok_OrkGesagt == TRUE)
		{
			AI_Output (self ,other,"DIA_Bartok_PERM_04_02"); //Poâád se mi klepou strachy kolena, že nás dostane do spárů nęjakej skâet.
		};
	}
	else
	{
		AI_Output (self ,other,"DIA_Bartok_PERM_04_03"); //Jasnę. Jen ulovíme pár bestií!
	};
};








