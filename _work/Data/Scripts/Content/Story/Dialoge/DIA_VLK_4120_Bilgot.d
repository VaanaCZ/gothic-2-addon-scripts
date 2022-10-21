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
	AI_Output (self, other, "DIA_Bilgot_HALLO_05_00"); //Hej, odkud p¯ich·zÌö? P¯ich·zÌö z hradu?

	Info_AddChoice	(DIA_Bilgot_HALLO, "Ano, p¯ich·zÌm z hradu - proË?", DIA_Bilgot_HALLO_Burg );
	Info_AddChoice	(DIA_Bilgot_HALLO, "Zavedla mÏ sem cesta...", DIA_Bilgot_HALLO_Zufall );
};
func void DIA_Bilgot_HALLO_Zufall ()
{
	AI_Output (other, self, "DIA_Bilgot_HALLO_Zufall_15_00"); //ProstÏ mÏ sem cesta zavedla.
	AI_Output (self, other, "DIA_Bilgot_HALLO_Zufall_05_01"); //ChlapËe, sem nikoho cesta JEN TAK nezavede. Jsme tady tot·lnÏ v h·ji - vöude kolem jsou chÚapavci!
	AI_Output (self, other, "DIA_Bilgot_HALLO_Zufall_05_02"); //NenÌ dne, aby jeden z n·s neöel k Ëertu.
	AI_Output (self, other, "DIA_Bilgot_HALLO_Zufall_05_03"); //Nechceö mi ¯Ìct, odkud p¯ich·zÌö? Dobr· - aù si tÏ vezmou chÚapavci!
	
	AI_StopProcessInfos (self);
};

func void DIA_Bilgot_HALLO_Burg ()
{
	AI_Output (other, self, "DIA_Bilgot_HALLO_Burg_15_00"); //Ano, p¯ich·zÌm z hradu - proË?
	AI_Output (self, other, "DIA_Bilgot_HALLO_Burg_05_01"); //Jak to tam vypad·?
	AI_Output (other, self, "DIA_Bilgot_HALLO_Burg_15_02"); //O nic lÌp neû tady. Sk¯eti jsou tam po¯·d, pokud myslÌö tohle.
	AI_Output (self, other, "DIA_Bilgot_HALLO_Burg_05_03"); //ZatracenÏ. »lovÏk nenÌ nikde v bezpeËÌ.
	AI_Output (self, other, "DIA_Bilgot_HALLO_Burg_05_04"); //NÏco ti ¯eknu. Kdybych nebyl posran˝ strachy, prosekal bych se odtud.
	
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
	description	 = 	"A co tady vlastnÏ dÏl·ö?";
};
func int DIA_Bilgot_Job_Condition ()
{
	return TRUE;
};
func void DIA_Bilgot_Job_Info ()
{
	AI_Output (other, self, "DIA_Bilgot_Job_15_00"); //A co tady vlastnÏ dÏl·ö?
	AI_Output (self, other, "DIA_Bilgot_Job_05_01"); //Jsem tady dÏvËe pro vöechno. ChodÌm okolo a sleduju chÚapavce, Bilgote sem, Bilgote tam.
	AI_Output (self, other, "DIA_Bilgot_Job_05_02"); //MÏl jsem radöi z˘stat doma se svou starou. Nebylo to sice o moc lepöÌ, ale aspoÚ tam bylo nÏco po¯·dnÈho k jÌdlu.
	AI_Output (self, other, "DIA_Bilgot_Job_05_03"); //A teÔ jsem vöechno, co zbylo z Fajethov˝ch ozbrojenc˘.
	AI_Output (self, other, "DIA_Bilgot_Job_05_04"); //Jak jsem mÏl vÏdÏt, ûe se tahle v˝prava nevr·tÌ?
	AI_Output (self, other, "DIA_Bilgot_Job_05_05"); //M˘j p¯Ìtel Olav se vypa¯il. Moûn· mu to vyölo.
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
	description	 = 	"Co vÌö o chÚapavcÌch?";
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
	AI_Output (other, self, "DIA_Bilgot_Hilfe_15_00"); //Co vÌö o chÚapavcÌch?
	AI_Output (self, other, "DIA_Bilgot_Hilfe_05_01"); //ProË to chceö vÏdÏt? A ne¯Ìkej mi, ûe jsi jenom zvÏdav˝!
	AI_Output (other, self, "DIA_Bilgot_Hilfe_15_02"); //Chyst·m se na ty chÚapavce vyrazit.
	AI_Output (self, other, "DIA_Bilgot_Hilfe_05_03"); //To je bl·znovstvÌ. Pozoroval jsem je - jsou to krveûÌznivÈ bestie.
	AI_Output (other, self, "DIA_Bilgot_Hilfe_15_04"); //ÿekni mi, co o nich vÌö.
	AI_Output (self, other, "DIA_Bilgot_Hilfe_05_05"); //Hm... mohl bych ti pomoci - ale jen pod jednou podmÌnkou!
	AI_Output (other, self, "DIA_Bilgot_Hilfe_15_06"); //Co chceö?
	AI_Output (self, other, "DIA_Bilgot_Hilfe_05_07"); //Kdyû dok·ûeö zabÌt chÚapavce, musÌö mÏ odsud dostat!
	
	if ((Npc_IsDead (Fed)) == FALSE)
	{
		AI_Output (self, other, "DIA_Bilgot_Hilfe_05_08"); //Nem˘ûu se tady dÈle zdrûovat. Uû jsi mluvil s Fedem? Ten chlap je troska - a j· nechci dopadnout jako on!
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
	description	 = 	"ÿekni mi, co vÌö. Potom tÏ odtud dostanu!";
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
	AI_Output (other, self, "DIA_Bilgot_KNOWSLEADSNAPPER_15_00"); //ÿekni mi, co vÌö. Potom tÏ odsud dostanu!
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_01"); //VÏdÏl jsem, ûe s tebou m˘ûu poËÌtat. Tak d·vej pozor. NÏjakou dobu jsem ty chÚapavce pozoroval.
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_02"); //Jsou hodnÏ mazanÌ a nÏjak se spolu... domlouvajÌ. Nikdy nechodÌ sami a ˙toËÌ pouze ve skupinÏ.
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_03"); //Ale je tu jeötÏ nÏco. Je mezi nimi jeötÏr, kter˝ je ˙plnÏ jin˝. Ukazuje se jen z¯Ìdka, ale j· ho vidÏl.
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_04"); //OstatnÌ bestie se klanÌ, kdyû je mÌjÌ - ale nikdy ho nespustÌ z oËÌ.
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_05"); //Dokud se nepohne tenhle, tak ani û·dn˝ jin˝.
	AI_Output (other, self, "DIA_Bilgot_KNOWSLEADSNAPPER_15_06"); //Kde najdu tuhle zatracenou bestii?
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_07"); //VidÏl jsem ji u schod˘ do starÈ str·ûnÌ vÏûe.

	AI_Output (other, self, "DIA_Bilgot_KNOWSLEADSNAPPER_15_08"); //Dobr·. MyslÌm, ûe rozumÌm. DÌky!
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_09"); //Pamatuj, dal jsi mi slovo!

	Wld_InsertNpc (NewMine_LeadSnapper,"OW_ORC_LOOKOUT_2_01"); //Der Rudelf¸hrer
	
	B_LogEntry (TOPIC_FajethKillSnapper,"Bilgot se domnÌv·, ûe v˘dce chÚapavËÌ smeËky nejspÌö najdu na schodech starÈ str·ûnÌ vÏûe."); 
	
	Log_CreateTopic (TOPIC_BilgotEscort,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BilgotEscort,LOG_RUNNING);
	B_LogEntry (TOPIC_BilgotEscort,"Bilgot chce, abych ho dostal z ˙dolÌ.");
		
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
	description	 = 	"(Dodrûet slib.)";
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
	AI_Output (other, self, "DIA_Bilgot_TAKEYOUWITHME_15_00"); //Je Ëas, Bilgote! Sbal si svÈ vÏci, odch·zÌme.
	//Joly: SC bringt den Typ bis zum Pass AI_Output (self, other, "DIA_Bilgot_TAKEYOUWITHME_05_01"); //Groﬂartig! Es reicht mir schon, wenn du mich ¸ber die groﬂe Br¸cke am Fluss vor der belagerten Burg bringst. Den Rest schaff ich dann schon.
	//Joly: SC bringt den Typ bis zum Pass AI_Output (other, self, "DIA_Bilgot_TAKEYOUWITHME_15_02"); //Dann beeil dich!
	AI_Output (self, other, "DIA_Bilgot_TAKEYOUWITHME_05_03"); //Jsem p¯ipraven!

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
	description	 = 	"Nem˘ûeö jÌt trochu rychleji?!";
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
	AI_Output (other, self, "DIA_Bilgot_LAUFSCHNELLER_15_00"); //Nem˘ûeö jÌt trochu rychleji?!
	AI_Output (self, other, "DIA_Bilgot_LAUFSCHNELLER_05_01"); //Jdu tak rychle, jak jen m˘ûu.
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
	AI_Output (other, self, "DIA_Bilgot_BEIBRUECKEANGEKOMMEN_15_00"); //Tak, jsme tady. TeÔ natrefÌme na cestu. Tahle oblast je nebezpeËn·!
	AI_Output (self, other, "DIA_Bilgot_BEIBRUECKEANGEKOMMEN_05_01"); //DÌky!
	AI_Output (other, self, "DIA_Bilgot_BEIBRUECKEANGEKOMMEN_15_02"); //Nenech se seûrat. To by byla ökoda.
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
	description	 = 	"Co tady dÏl·ö? Myslel jsem, ûe jsi mÏl namÌ¯eno p¯es pr˘smyk?";
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
	AI_Output (other, self, "DIA_Bilgot_LetztePause_15_00"); //Co tady dÏl·ö? Myslel jsem, ûe jsi mÏl namÌ¯eno p¯es pr˘smyk?
	AI_Output (self, other, "DIA_Bilgot_LetztePause_05_01"); //Uû nem˘ûu d·l. Nech mÏ na chvÌli vydechnout. J· to zvl·dnu. Neboj se!
	AI_Output (other, self, "DIA_Bilgot_LetztePause_15_02"); //Kdyû to ¯Ìk·ö.
	AI_Output (self, other, "DIA_Bilgot_LetztePause_05_03"); //Jen malou p¯est·vku.
	
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
	description	 = 	"Naöel jsem Olava.";
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
	AI_Output (other, self, "DIA_Bilgot_Olav_15_00"); //Naöel jsem Olava.
	AI_Output (self, other, "DIA_Bilgot_Olav_05_01"); //A jak se m·?
	AI_Output (other, self, "DIA_Bilgot_Olav_15_02"); //Je mrtv˝. Seûrali ho vlci.
	AI_Output (self, other, "DIA_Bilgot_Olav_05_03"); //Ale, zatracenÏ. Douf·m, ûe se mi aspoÚ poda¯Ì dostat se odtud.
	
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



