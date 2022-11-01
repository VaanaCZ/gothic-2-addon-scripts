///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Bilgot_EXIT   (C_INFO)
{
	npc         = VLK_4120_Bilgot;
	nr          = 999;
	condition   = DIA_Bilgot_EXIT_Condition;
	information = DIA_Bilgot_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Bilgot_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Bilgot_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_HALLO		(C_INFO)
{
	npc		 	 = 	VLK_4120_Bilgot;
	nr			 =  2;
	condition	 = 	DIA_Bilgot_HALLO_Condition;
	information	 = 	DIA_Bilgot_HALLO_Info;
	important	 = 	TRUE;
	permanent 	 =  FALSE;
};
func int DIA_Bilgot_HALLO_Condition ()
{
	return TRUE;
};
func void DIA_Bilgot_HALLO_Info ()
{
	AI_Output (self, other, "DIA_Bilgot_HALLO_05_00"); //Hej, odkud pâicházíš? Pâicházíš z hradu?

	Info_AddChoice	(DIA_Bilgot_HALLO, "Ano, pâicházím z hradu - proč?", DIA_Bilgot_HALLO_Burg );
	Info_AddChoice	(DIA_Bilgot_HALLO, "Zavedla mę sem cesta...", DIA_Bilgot_HALLO_Zufall );
};
func void DIA_Bilgot_HALLO_Zufall ()
{
	AI_Output (other, self, "DIA_Bilgot_HALLO_Zufall_15_00"); //Prostę mę sem cesta zavedla.
	AI_Output (self, other, "DIA_Bilgot_HALLO_Zufall_05_01"); //Chlapče, sem nikoho cesta JEN TAK nezavede. Jsme tady totálnę v háji - všude kolem jsou chŕapavci!
	AI_Output (self, other, "DIA_Bilgot_HALLO_Zufall_05_02"); //Není dne, aby jeden z nás nešel k čertu.
	AI_Output (self, other, "DIA_Bilgot_HALLO_Zufall_05_03"); //Nechceš mi âíct, odkud pâicházíš? Dobrá - aă si tę vezmou chŕapavci!
	
	AI_StopProcessInfos (self);
};

func void DIA_Bilgot_HALLO_Burg ()
{
	AI_Output (other, self, "DIA_Bilgot_HALLO_Burg_15_00"); //Ano, pâicházím z hradu - proč?
	AI_Output (self, other, "DIA_Bilgot_HALLO_Burg_05_01"); //Jak to tam vypadá?
	AI_Output (other, self, "DIA_Bilgot_HALLO_Burg_15_02"); //O nic líp než tady. Skâeti jsou tam poâád, pokud myslíš tohle.
	AI_Output (self, other, "DIA_Bilgot_HALLO_Burg_05_03"); //Zatracenę. Človęk není nikde v bezpečí.
	AI_Output (self, other, "DIA_Bilgot_HALLO_Burg_05_04"); //Nęco ti âeknu. Kdybych nebyl posraný strachy, prosekal bych se odtud.
	
	Info_ClearChoices	(DIA_Bilgot_HALLO);
};
///////////////////////////////////////////////////////////////////////
//	Info Job
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_Job		(C_INFO)
{
	npc			 = 	VLK_4120_Bilgot;
	nr			 =  3;
	condition	 = 	DIA_Bilgot_Job_Condition;
	information	 = 	DIA_Bilgot_Job_Info;
	permanent 	 =  FALSE;
	description	 = 	"A co tady vlastnę dęláš?";
};
func int DIA_Bilgot_Job_Condition ()
{
	return TRUE;
};
func void DIA_Bilgot_Job_Info ()
{
	AI_Output (other, self, "DIA_Bilgot_Job_15_00"); //A co tady vlastnę dęláš?
	AI_Output (self, other, "DIA_Bilgot_Job_05_01"); //Jsem tady dęvče pro všechno. Chodím okolo a sleduju chŕapavce, Bilgote sem, Bilgote tam.
	AI_Output (self, other, "DIA_Bilgot_Job_05_02"); //Męl jsem radši zůstat doma se svou starou. Nebylo to sice o moc lepší, ale aspoŕ tam bylo nęco poâádného k jídlu.
	AI_Output (self, other, "DIA_Bilgot_Job_05_03"); //A teë jsem všechno, co zbylo z Fajethových ozbrojenců.
	AI_Output (self, other, "DIA_Bilgot_Job_05_04"); //Jak jsem męl vędęt, že se tahle výprava nevrátí?
	AI_Output (self, other, "DIA_Bilgot_Job_05_05"); //Můj pâítel Olav se vypaâil. Možná mu to vyšlo.
};
///////////////////////////////////////////////////////////////////////
//	Info Hilfe
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_Hilfe		(C_INFO)
{
	npc			 = 	VLK_4120_Bilgot;
	nr 			 =  3;
	condition	 = 	DIA_Bilgot_Hilfe_Condition;
	information	 = 	DIA_Bilgot_Hilfe_Info;
	permanent 	 =  FALSE;
	description	 = 	"Co víš o chŕapavcích?";
};
func int DIA_Bilgot_Hilfe_Condition ()
{
	if	(MIS_Fajeth_Kill_Snapper == LOG_RUNNING)	
	{
		return TRUE;
	};
};
func void DIA_Bilgot_Hilfe_Info ()
{
	AI_Output (other, self, "DIA_Bilgot_Hilfe_15_00"); //Co víš o chŕapavcích?
	AI_Output (self, other, "DIA_Bilgot_Hilfe_05_01"); //Proč to chceš vędęt? A neâíkej mi, že jsi jenom zvędavý!
	AI_Output (other, self, "DIA_Bilgot_Hilfe_15_02"); //Chystám se na ty chŕapavce vyrazit.
	AI_Output (self, other, "DIA_Bilgot_Hilfe_05_03"); //To je bláznovství. Pozoroval jsem je - jsou to krvežíznivé bestie.
	AI_Output (other, self, "DIA_Bilgot_Hilfe_15_04"); //Âekni mi, co o nich víš.
	AI_Output (self, other, "DIA_Bilgot_Hilfe_05_05"); //Hm... mohl bych ti pomoci - ale jen pod jednou podmínkou!
	AI_Output (other, self, "DIA_Bilgot_Hilfe_15_06"); //Co chceš?
	AI_Output (self, other, "DIA_Bilgot_Hilfe_05_07"); //Když dokážeš zabít chŕapavce, musíš mę odsud dostat!
	
	if ((Npc_IsDead (Fed)) == FALSE)
	{
		AI_Output (self, other, "DIA_Bilgot_Hilfe_05_08"); //Nemůžu se tady déle zdržovat. Už jsi mluvil s Fedem? Ten chlap je troska - a já nechci dopadnout jako on!
	};
};

///////////////////////////////////////////////////////////////////////
//	Info KnowsLeadSnapper
///////////////////////////////////////////////////////////////////////

instance DIA_Bilgot_KNOWSLEADSNAPPER		(C_INFO)
{
	npc			 = 	VLK_4120_Bilgot;
	nr			 =  4;
	condition	 = 	DIA_Bilgot_KNOWSLEADSNAPPER_Condition;
	information	 = 	DIA_Bilgot_KNOWSLEADSNAPPER_Info;
	permanent 	 =  FALSE;
	description	 = 	"Âekni mi, co víš. Potom tę odtud dostanu!";
};

func int DIA_Bilgot_KNOWSLEADSNAPPER_Condition ()
{
	if ((Npc_KnowsInfo(other, DIA_Bilgot_Hilfe))
	&& (MIS_Fajeth_Kill_Snapper == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Bilgot_KNOWSLEADSNAPPER_Info ()
{
	AI_Output (other, self, "DIA_Bilgot_KNOWSLEADSNAPPER_15_00"); //Âekni mi, co víš. Potom tę odsud dostanu!
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_01"); //Vędęl jsem, že s tebou můžu počítat. Tak dávej pozor. Nęjakou dobu jsem ty chŕapavce pozoroval.
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_02"); //Jsou hodnę mazaní a nęjak se spolu... domlouvají. Nikdy nechodí sami a útočí pouze ve skupinę.
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_03"); //Ale je tu ještę nęco. Je mezi nimi ještęr, který je úplnę jiný. Ukazuje se jen zâídka, ale já ho vidęl.
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_04"); //Ostatní bestie se klaní, když je míjí - ale nikdy ho nespustí z očí.
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_05"); //Dokud se nepohne tenhle, tak ani žádný jiný.
	AI_Output (other, self, "DIA_Bilgot_KNOWSLEADSNAPPER_15_06"); //Kde najdu tuhle zatracenou bestii?
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_07"); //Vidęl jsem ji u schodů do staré strážní vęže.

	AI_Output (other, self, "DIA_Bilgot_KNOWSLEADSNAPPER_15_08"); //Dobrá. Myslím, že rozumím. Díky!
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_09"); //Pamatuj, dal jsi mi slovo!

	Wld_InsertNpc (NewMine_LeadSnapper,"OW_ORC_LOOKOUT_2_01"); //Der Rudelführer
	
	B_LogEntry (TOPIC_FajethKillSnapper,"Bilgot se domnívá, že vůdce chŕapavčí smečky nejspíš najdu na schodech staré strážní vęže."); 
	
	Log_CreateTopic (TOPIC_BilgotEscort,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BilgotEscort,LOG_RUNNING);
	B_LogEntry (TOPIC_BilgotEscort,"Bilgot chce, abych ho dostal z údolí.");
		
};
///////////////////////////////////////////////////////////////////////
//	Info TakeYouWithMe
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_TAKEYOUWITHME		(C_INFO)
{
	npc			 = 	VLK_4120_Bilgot;
	nr 			 =  2;
	condition	 = 	DIA_Bilgot_TAKEYOUWITHME_Condition;
	information	 = 	DIA_Bilgot_TAKEYOUWITHME_Info;
	permanent 	 =  FALSE;
	description	 = 	"(Dodržet slib.)";
};
func int DIA_Bilgot_TAKEYOUWITHME_Condition ()
{
	if (MIS_Fajeth_Kill_Snapper == LOG_SUCCESS)
 	&& Npc_KnowsInfo(other, DIA_Bilgot_KNOWSLEADSNAPPER)
 			{
				return TRUE;
 			};
};
func void DIA_Bilgot_TAKEYOUWITHME_Info ()
{
	AI_Output (other, self, "DIA_Bilgot_TAKEYOUWITHME_15_00"); //Je čas, Bilgote! Sbal si své vęci, odcházíme.
	//Joly: SC bringt den Typ bis zum Pass AI_Output (self, other, "DIA_Bilgot_TAKEYOUWITHME_05_01"); //Großartig! Es reicht mir schon, wenn du mich über die große Brücke am Fluss vor der belagerten Burg bringst. Den Rest schaff ich dann schon.
	//Joly: SC bringt den Typ bis zum Pass AI_Output (other, self, "DIA_Bilgot_TAKEYOUWITHME_15_02"); //Dann beeil dich!
	AI_Output (self, other, "DIA_Bilgot_TAKEYOUWITHME_05_03"); //Jsem pâipraven!

	Npc_ExchangeRoutine	(self, "FOLLOWTOOCBRIDGE");
	Bilgot.flags	= 0;	
	MIS_RescueBilgot = LOG_RUNNING;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info LaufSchneller
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_LAUFSCHNELLER		(C_INFO)
{
	npc			 = 	VLK_4120_Bilgot;
	nr			 =  5;
	condition	 = 	DIA_Bilgot_LAUFSCHNELLER_Condition;
	information	 = 	DIA_Bilgot_LAUFSCHNELLER_Info;
	permanent	 =  FALSE;
	description	 = 	"Nemůžeš jít trochu rychleji?!";
};

func int DIA_Bilgot_LAUFSCHNELLER_Condition ()
{
	if ((Npc_KnowsInfo(other, DIA_Bilgot_TAKEYOUWITHME))
	&& ((Npc_KnowsInfo(other, DIA_Bilgot_BEIBRUECKEANGEKOMMEN))==FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bilgot_LAUFSCHNELLER_Info ()
{
	AI_Output (other, self, "DIA_Bilgot_LAUFSCHNELLER_15_00"); //Nemůžeš jít trochu rychleji?!
	AI_Output (self, other, "DIA_Bilgot_LAUFSCHNELLER_05_01"); //Jdu tak rychle, jak jen můžu.
};
///////////////////////////////////////////////////////////////////////
//	Info BeiBrueckeAngekommen
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_BEIBRUECKEANGEKOMMEN		(C_INFO)
{
	npc			 = 	VLK_4120_Bilgot;
	nr			 =  2;
	condition	 = 	DIA_Bilgot_BEIBRUECKEANGEKOMMEN_Condition;
	information	 = 	DIA_Bilgot_BEIBRUECKEANGEKOMMEN_Info;
	important	 = 	TRUE;
	permanent	 =  FALSE;
};
func int DIA_Bilgot_BEIBRUECKEANGEKOMMEN_Condition ()
{
	if (Npc_GetDistToWP(self,"START")<8000) 				
	{
		return TRUE;
	};
};

func void DIA_Bilgot_BEIBRUECKEANGEKOMMEN_Info ()
{
	AI_Output (other, self, "DIA_Bilgot_BEIBRUECKEANGEKOMMEN_15_00"); //Tak, jsme tady. Teë natrefíme na cestu. Tahle oblast je nebezpečná!
	AI_Output (self, other, "DIA_Bilgot_BEIBRUECKEANGEKOMMEN_05_01"); //Díky!
	AI_Output (other, self, "DIA_Bilgot_BEIBRUECKEANGEKOMMEN_15_02"); //Nenech se sežrat. To by byla škoda.
	AI_Output (self, other, "DIA_Bilgot_BEIBRUECKEANGEKOMMEN_05_03"); //Sbohem!
	
	AI_StopProcessInfos (self);	
	TschuessBilgot = TRUE;
	MIS_RescueBilgot = LOG_SUCCESS;
	B_GivePlayerXP (XP_BilgotEscort);
	
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self, "FLEEOUTOFOW");
};
///////////////////////////////////////////////////////////////////////
//	Info LetztePause
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_LetztePause		(C_INFO)
{
	npc			 = 	VLK_4120_Bilgot;
	nr			 = 	3;
	condition	 = 	DIA_Bilgot_LetztePause_Condition;
	information	 = 	DIA_Bilgot_LetztePause_Info;
	permanent	 = 	TRUE;
	description	 = 	"Co tady dęláš? Myslel jsem, že jsi męl namíâeno pâes průsmyk?";
};

func int DIA_Bilgot_LetztePause_Condition ()
{
	if (Npc_GetDistToWP(self,"START")<1000) 				
	{
		return TRUE;
	};
};

func void DIA_Bilgot_LetztePause_Info ()
{
	AI_Output (other, self, "DIA_Bilgot_LetztePause_15_00"); //Co tady dęláš? Myslel jsem, že jsi męl namíâeno pâes průsmyk?
	AI_Output (self, other, "DIA_Bilgot_LetztePause_05_01"); //Už nemůžu dál. Nech mę na chvíli vydechnout. Já to zvládnu. Neboj se!
	AI_Output (other, self, "DIA_Bilgot_LetztePause_15_02"); //Když to âíkáš.
	AI_Output (self, other, "DIA_Bilgot_LetztePause_05_03"); //Jen malou pâestávku.
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Olav
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_Olav		(C_INFO)
{
	npc			 = 	VLK_4120_Bilgot;
	nr			 = 	3;
	condition	 = 	DIA_Bilgot_Olav_Condition;
	information	 = 	DIA_Bilgot_Olav_Info;
	permanent	 = 	FALSE;
	description	 = 	"Našel jsem Olava.";
};

func int DIA_Bilgot_Olav_Condition ()
{
	if (Npc_HasItems (Olav, ITSE_Olav) == 0)	
	&& (Npc_KnowsInfo (other,DIA_Bilgot_Job))
	{
		return TRUE;
	};
};

func void DIA_Bilgot_Olav_Info ()
{
	AI_Output (other, self, "DIA_Bilgot_Olav_15_00"); //Našel jsem Olava.
	AI_Output (self, other, "DIA_Bilgot_Olav_05_01"); //A jak se má?
	AI_Output (other, self, "DIA_Bilgot_Olav_15_02"); //Je mrtvý. Sežrali ho vlci.
	AI_Output (self, other, "DIA_Bilgot_Olav_05_03"); //Ale, zatracenę. Doufám, že se mi aspoŕ podaâí dostat se odtud.
	
	B_GivePlayerXP (XP_Ambient);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Bilgot_PICKPOCKET (C_INFO)
{
	npc			= VLK_4120_Bilgot;
	nr			= 900;
	condition	= DIA_Bilgot_PICKPOCKET_Condition;
	information	= DIA_Bilgot_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Bilgot_PICKPOCKET_Condition()
{
	C_Beklauen (20, 30);
};
 
FUNC VOID DIA_Bilgot_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Bilgot_PICKPOCKET);
	Info_AddChoice		(DIA_Bilgot_PICKPOCKET, DIALOG_BACK 		,DIA_Bilgot_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Bilgot_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Bilgot_PICKPOCKET_DoIt);
};

func void DIA_Bilgot_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Bilgot_PICKPOCKET);
};
	
func void DIA_Bilgot_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Bilgot_PICKPOCKET);
};



