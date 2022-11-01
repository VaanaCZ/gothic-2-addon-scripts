///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Farim_EXIT   (C_INFO)
{
	npc         = VLK_4301_Addon_Farim;
	nr          = 999;
	condition   = DIA_Addon_Farim_EXIT_Condition;
	information = DIA_Addon_Farim_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Farim_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Farim_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Farim_PICKPOCKET (C_INFO)
{
	npc			= VLK_4301_Addon_Farim;
	nr			= 900;
	condition	= DIA_Addon_Farim_PICKPOCKET_Condition;
	information	= DIA_Addon_Farim_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Addon_Farim_PICKPOCKET_Condition()
{
	C_Beklauen (20, 11);
};
 
FUNC VOID DIA_Addon_Farim_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Farim_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Farim_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Farim_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Farim_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Farim_PICKPOCKET_DoIt);
};

func void DIA_Addon_Farim_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Farim_PICKPOCKET);
};
	
func void DIA_Addon_Farim_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Farim_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_Hallo		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Farim_Hallo_Condition;
	information	 = 	DIA_Addon_Farim_Hallo_Info;

	description	 = 	"Ty jsi rybáâ?";
};

func int DIA_Addon_Farim_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Farim_Hallo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Farim_Hallo_15_00"); //Ty jsi rybáâ?
	AI_Output	(self, other, "DIA_Addon_Farim_Hallo_11_01"); //(cynicky) Jak jsi na to pâišel?
	AI_Output	(self, other, "DIA_Addon_Farim_Hallo_11_02"); //Proč mę prostę nemůžeš nechat na pokoji?
	if (hero.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Addon_Farim_Landstreicher_Add_11_02"); //Neber si to osobnę, ale poslední dobou jsem s domobranou nemęl zrovna štęstí.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Farim_Landstreicher_Add_11_03"); //Neber si to osobnę, ale poslední dobou jsem nemęl moc štęstí. Může za to domobrana.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info MilizProbs
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_MilizProbs		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Farim_MilizProbs_Condition;
	information	 = 	DIA_Addon_Farim_MilizProbs_Info;

	description	 = 	"Problém s domobranou?";
};

func int DIA_Addon_Farim_MilizProbs_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Farim_Hallo))
		{
			return TRUE;
		};
};

func void DIA_Addon_Farim_MilizProbs_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Farim_MilizProbs_15_00"); //Problémy s domobranou?
	if (((hero.guild == GIL_MIL)||(hero.guild == GIL_PAL)) == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Farim_MilizProbs_11_01"); //Ti šmejdi sem poâád chodí a berou si, co chtęj.
	};
	AI_Output	(self, other, "DIA_Addon_Farim_MilizProbs_11_02"); //Minulý týden mi takhle sebrali všechen úlovek. Prej že 'je to pro dobrou vęc'.
	AI_Output	(self, other, "DIA_Addon_Farim_MilizProbs_11_03"); //Vím, že od tý doby, co sedláci pâestali obchodovat, se každej musí starat sám o sebe.
	AI_Output	(self, other, "DIA_Addon_Farim_MilizProbs_11_04"); //A samozâejmę že nękterý lidi mají hlad. Je zázrak, že mi ty ryby nekradou pâímo pod nosem.
	AI_Output	(self, other, "DIA_Addon_Farim_MilizProbs_11_05"); //Ale jestli to takhle půjde dál, nebudu už mít co jíst ani já sám.
	
	Info_ClearChoices	(DIA_Addon_Farim_MilizProbs);
	Info_AddChoice	(DIA_Addon_Farim_MilizProbs, "Dej mi všecky své ryby.", DIA_Addon_Farim_MilizProbs_klauen );
	Info_AddChoice	(DIA_Addon_Farim_MilizProbs, "Možná bych ti mohl pomoct.", DIA_Addon_Farim_MilizProbs_helfen );
	Info_AddChoice	(DIA_Addon_Farim_MilizProbs, "Mluvil jsi o tom s paladiny?", DIA_Addon_Farim_MilizProbs_paladine );
};
func void DIA_Addon_Farim_MilizProbs_paladine ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_MilizProbs_paladine_15_00"); //Mluvil jsi o tom s paladiny?
	AI_Output			(self, other, "DIA_Addon_Farim_MilizProbs_paladine_11_01"); //(smęje se) Dęláš si srandu? To si vážnę myslíš, že by je zajímaly problémy takovýho ubožáka, jako jsem já?
};
var int Farim_PissedOff;
func void DIA_Addon_Farim_MilizProbs_klauen ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_MilizProbs_klauen_15_00"); //Dej mi všecky svoje ryby.
	AI_Output			(self, other, "DIA_Addon_Farim_MilizProbs_klauen_11_01"); //(vztekle) Já to VĘDĘL! Další z tęch hajzlů!
	
	if (other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Addon_Farim_MilizProbs_klauen_11_02"); //Ale obávám se, že jdeš pozdę, tví kamarádíčkové už tu byli včera a sebrali mi úplnę všecko.
	};
	
	AI_Output			(self, other, "DIA_Addon_Farim_MilizProbs_klauen_11_04"); //No, a teë bys už myslím męl jít.
	Farim_PissedOff = TRUE;
	Info_ClearChoices	(DIA_Addon_Farim_MilizProbs);
};
func void DIA_Addon_Farim_MilizProbs_helfen ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_MilizProbs_helfen_15_00"); //Možná bych ti mohl pomoci.
	AI_Output			(self, other, "DIA_Addon_Farim_MilizProbs_helfen_11_02"); //Nevím. Snad bys mohl znát nękoho od domobrany, kdo má spojení na paladiny.
	AI_Output			(self, other, "DIA_Addon_Farim_MilizProbs_helfen_11_03"); //Paladini si ode mę tęžko budou kupovat ryby.
	AI_Output			(other, self, "DIA_Addon_Farim_MilizProbs_helfen_15_04"); //Uvidím, co se dá dęlat.
	Info_ClearChoices	(DIA_Addon_Farim_MilizProbs);
	
	Log_CreateTopic (TOPIC_Addon_FarimsFish, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_FarimsFish, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_FarimsFish,"Rybáâ Farim má problém s domobranou. Chtęjí po nęm tolik ryb, že už mu nezbývá nic pro vlastní obživu. Chtęlo by to najít nęjakého vlivného paladina, který by mu pomohl."); 
		
	MIS_Addon_Farim_PaladinFisch = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info MartinHelps
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_MartinHelps		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Farim_MartinHelps_Condition;
	information	 = 	DIA_Addon_Farim_MartinHelps_Info;

	description	 = 	"Vím, jak vyâešit ten tvůj problém s domobranou.";
};

func int DIA_Addon_Farim_MartinHelps_Condition ()
{
	if (MIS_Addon_Farim_PaladinFisch == LOG_RUNNING)
	&& (Martin_KnowsFarim == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Farim_MartinHelps_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Farim_MartinHelps_15_00"); //Vím, jak vyâešit ten tvůj problém s domobranou.
	AI_Output	(self, other, "DIA_Addon_Farim_MartinHelps_11_01"); //A jak by to męlo být?

	if (hero.guild == GIL_MIL)||(hero.guild == GIL_PAL)
	{
		AI_Output	(other, self, "DIA_Addon_Farim_MartinHelps_15_02"); //Nejsem tu tak často, abych ti každou noc hlídal ryby.
		AI_Output	(other, self, "DIA_Addon_Farim_MartinHelps_15_03"); //Ale znám nękoho, kdo to udęlat může.
	};
	
	AI_Output	(other, self, "DIA_Addon_Farim_MartinHelps_15_04"); //Paladinský skladník Martin chce, abys mu âekl o domobranę a o tvých rybách.
	AI_Output	(self, other, "DIA_Addon_Farim_MartinHelps_11_05"); //A myslíš, že mę pak domobrana nechá na pokoji?
	AI_Output	(other, self, "DIA_Addon_Farim_MartinHelps_15_06"); //Aspoŕ to tvrdí.
	AI_Output	(self, other, "DIA_Addon_Farim_MartinHelps_11_07"); //Skvęlý. Dękuju ti. Moc ti toho dát nemůžu, ale počkej...
	AI_Output	(self, other, "DIA_Addon_Farim_MartinHelps_11_08"); //Tenhle divnej modrej kámen jsem našel na jednom z ostrovů mimo pobâeží Khorinidu.
	AI_Output	(self, other, "DIA_Addon_Farim_MartinHelps_11_09"); //Myslím, že není nijak zvlášă cenný, ale určitę se najde nękdo, komu se bude hodit.
		
	B_GiveInvItems (self, other, ItMi_Aquamarine, 1);		
	
	MIS_Addon_Farim_PaladinFisch = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Farim_PaladinFisch);
};

///////////////////////////////////////////////////////////////////////
//	Info Landstreicher
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_Landstreicher		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Farim_Landstreicher_Condition;
	information	 = 	DIA_Addon_Farim_Landstreicher_Info;

	description	 = 	"Můžeš mi âíci nęco o tęch pohâešovaných lidech?";
};

func int DIA_Addon_Farim_Landstreicher_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Farim_Hallo))
	&& (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_RUNNING) 
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_Landstreicher_Info ()
{
	AI_Output (other, self, "DIA_Addon_Farim_Landstreicher_15_01"); //Můžeš mi âíct nęco o tęch pohâešovaných lidech?
	AI_Output (self, other, "DIA_Addon_Farim_Landstreicher_11_02"); //Můj kámoš William se začal scházet s bandou divnejch individuí. A kam až ho to dostalo?
	AI_Output (self, other, "DIA_Addon_Farim_Landstreicher_11_03"); //Jednoho krásnýho dne prostę nepâišel do práce a už jsem ho víckrát nevidęl.
	SCKnowsFarimAsWilliamsFriend = TRUE;
};


///////////////////////////////////////////////////////////////////////
//	Info William
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_William		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Farim_William_Condition;
	information	 = 	DIA_Addon_Farim_William_Info;

	description	 = 	"Zmizel i tvůj kamarád William?";
};

func int DIA_Addon_Farim_William_Condition ()
{
	if (SCKnowsFarimAsWilliamsFriend == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Farim_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_William_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Farim_William_15_00"); //Tvůj kamarád William zmizel?
	AI_Output	(self, other, "DIA_Addon_Farim_William_11_01"); //Pâesnę tak. Je to rybáâ, ale poâád si hraje na důležitýho, na to tę musím upozornit.
	AI_Output	(self, other, "DIA_Addon_Farim_William_11_02"); //Męl se vod tý bandy držet dál.

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_MissingPeople, LogText_Addon_WilliamMissing); 
	
	Info_ClearChoices	(DIA_Addon_Farim_William);	
	Info_AddChoice	(DIA_Addon_Farim_William, "Co to může bejt za šmejdy?", DIA_Addon_Farim_William_typen );
	Info_AddChoice	(DIA_Addon_Farim_William, "Určitę se brzy objeví.", DIA_Addon_Farim_William_auftauchen );
	Info_AddChoice	(DIA_Addon_Farim_William, "Co má za lubem?", DIA_Addon_Farim_William_WasGemacht );
	Info_AddChoice	(DIA_Addon_Farim_William, "Kdy jsi ho vidęl naposledy?", DIA_Addon_Farim_William_WannWeg );
};
func void DIA_Addon_Farim_William_WasGemacht ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_WasGemacht_15_00"); //Co męl v plánu?
	AI_Output			(self, other, "DIA_Addon_Farim_William_WasGemacht_11_01"); //William męl s tęma darebákama nęjaký pokoutní techtle mechtle.
	AI_Output			(self, other, "DIA_Addon_Farim_William_WasGemacht_11_02"); //Myslím, že se to všecko točilo kolem pašovanýho zboží, který tęm parchantům prodával.
	//AI_Output			(self, other, "DIA_Addon_Farim_William_WasGemacht_11_03"); //Aber seit die Handelschiffe nicht mehr hier in Khorinis anlegen, weiß ich nicht, was er stattdessen für sie gemacht hat.
};
func void DIA_Addon_Farim_William_typen ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_typen_15_00"); //A co to bylo za parchanty?
	AI_Output			(self, other, "DIA_Addon_Farim_William_typen_11_01"); //Nemám tucha, kdo to moh bejt, ani co dęlal tady v Khorinidu.
	AI_Output			(self, other, "DIA_Addon_Farim_William_typen_11_02"); //Vím jenom, kde se s Williamem scházeli.
	AI_Output			(self, other, "DIA_Addon_Farim_William_typen_11_03"); //Jednou jsem tam Williama vidęl, když jsem rybaâil v zátoce.
	
	Info_AddChoice	(DIA_Addon_Farim_William, "Kde pâesnę se scházeli?", DIA_Addon_Farim_William_Wo );
};
func void DIA_Addon_Farim_William_Wo ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_Wo_15_00"); //Kde pâesnę je to místo, kde se scházeli?
	AI_Output			(self, other, "DIA_Addon_Farim_William_Wo_11_01"); //Je to v zátoce naproti pâístavu, severnę odsud.
	AI_Output			(self, other, "DIA_Addon_Farim_William_Wo_11_02"); //Dá se tam dostat jenom lodí nebo doplavat.
	AI_Output			(self, other, "DIA_Addon_Farim_William_Wo_11_03"); //Je tam pláž a malej rybáâskej tábor. A tam jsem ho vidęl.
	self.flags = 0;	//Joly: hat seine Pflicht getan

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Rybáâ Farim oplakává ztrátu svého pâítele Williama, který se prý často stýkal s nęjakým hrdloâezy. Scházeli se v zátoce severnę od pâístavu."); 

	Info_AddChoice	(DIA_Addon_Farim_William, "To už mi myslím stačí.", DIA_Addon_Farim_William_Tschau );
};
func void DIA_Addon_Farim_William_WannWeg ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_WannWeg_15_00"); //Kdy jsi ho vidęl naposledy?
	AI_Output			(self, other, "DIA_Addon_Farim_William_WannWeg_11_01"); //Jen pâed pár dny.

	Info_AddChoice	(DIA_Addon_Farim_William, "Nevyjel prostę na moâe rybaâit?", DIA_Addon_Farim_William_Fischen );
};
func void DIA_Addon_Farim_William_Fischen ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_Fischen_15_00"); //Nevyjel tâeba jen na moâe rybaâit?
	AI_Output			(self, other, "DIA_Addon_Farim_William_Fischen_11_01"); //To není moc pravdępodobný, jeho loë furt kotví v pâístavu.
};
func void DIA_Addon_Farim_William_auftauchen ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_auftauchen_15_00"); //Však on se objeví.
	AI_Output			(self, other, "DIA_Addon_Farim_William_auftauchen_11_01"); //To si nemyslím, už je pryč moc dlouho.
	AI_Output			(self, other, "DIA_Addon_Farim_William_auftauchen_11_02"); //Obávám se, že jednoho krásnýho dne z moâe vytáhnu jeho mrtvolu.
};
func void DIA_Addon_Farim_William_Tschau ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_Tschau_15_00"); //Myslím, že už jsem slyšel dost.
	AI_Output			(self, other, "DIA_Addon_Farim_William_Tschau_11_01"); //Ani se nenamáhej, stejnę nevęâím, že ho najdeš.
	Info_ClearChoices	(DIA_Addon_Farim_William);	
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_Perm		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	99;
	condition	 = 	DIA_Addon_Farim_Perm_Condition;
	information	 = 	DIA_Addon_Farim_Perm_Info;
	permanent	 = 	TRUE;

	description	 = 	"Tak co, berou, berou?";
};

func int DIA_Addon_Farim_Perm_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Farim_Hallo))
		{
			return TRUE;
		};
};

func void DIA_Addon_Farim_Perm_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Farim_Perm_15_00"); //Tak co, berou, berou?

	if (Farim_PissedOff == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Farim_Perm_11_01"); //Pâestaŕ pâedstírat, že tę to zajímá.
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Farim_Perm_11_02"); //Už jsem zažil lepší časy. Jen málokdo pâežil a spousta lidí umâela.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info William
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_WilliamReport (C_INFO)
{
	npc		 	= VLK_4301_Addon_Farim;
	nr		 	= 1;
	condition	= DIA_Addon_Farim_WilliamReport_Condition;
	information	= DIA_Addon_Farim_WilliamReport_Info;

	important 	= TRUE;
};

func int DIA_Addon_Farim_WilliamReport_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Farim_William))
	{
		if (Npc_HasItems (other, ITWr_Addon_William_01) > 0)
		|| (Saturas_AboutWilliam == TRUE)
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Farim_WilliamReport_Info ()
{
	AI_Output (self, other, "DIA_Addon_Farim_Add_11_01"); //Tak už jsi tu zas?
	AI_Output (self, other, "DIA_Addon_Farim_Add_11_02"); //Doslechl ses nęco o mým kámoši Williamovi?
	AI_Output (other, self, "DIA_Addon_Farim_Add_15_02"); //Je mrtvý.
	AI_Output (self, other, "DIA_Addon_Farim_Add_11_03"); //(povzdychne si) Jo, pâesnę to jsem čekal.
	AI_Output (self, other, "DIA_Addon_Farim_Add_11_04"); //Díky, že ses vrátil, abys mi to âek.
	AI_Output (self, other, "DIA_Addon_Farim_Add_11_05"); //Půjdu do hospody a propiju jeho podíl z našeho posledního úlovku – pâesnę tak by si to pâál.
};






