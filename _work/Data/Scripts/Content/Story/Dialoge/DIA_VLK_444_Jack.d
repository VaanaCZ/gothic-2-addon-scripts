///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jack_EXIT   (C_INFO)
{
	npc         = VLK_444_Jack;
	nr          = 999;
	condition   = DIA_Jack_EXIT_Condition;
	information = DIA_Jack_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Jack_EXIT_Condition()
{
	if (Kapitel < 3)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Jack_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Jack_PICKPOCKET (C_INFO)
{
	npc			= VLK_444_Jack;
	nr			= 900;
	condition	= DIA_Jack_PICKPOCKET_Condition;
	information	= DIA_Jack_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Jack_PICKPOCKET_Condition()
{
	C_Beklauen (50, 100);
};
 
FUNC VOID DIA_Jack_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Jack_PICKPOCKET);
	Info_AddChoice		(DIA_Jack_PICKPOCKET, DIALOG_BACK 		,DIA_Jack_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Jack_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Jack_PICKPOCKET_DoIt);
};

func void DIA_Jack_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Jack_PICKPOCKET);
};
	
func void DIA_Jack_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Jack_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_GREET		(C_INFO)
{
	npc			 = 	VLK_444_Jack;
	nr			 = 	4;
	condition	 = 	DIA_Jack_GREET_Condition;
	information	 = 	DIA_Jack_GREET_Info;
	important 	 =  TRUE; 

};

func int DIA_Jack_GREET_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Jack_GREET_Info ()
{
	AI_Output			(self ,other, "DIA_Jack_GREET_14_00"); //Zdravím, ty suchozemská kryso, vypadá to, že zůstáváš tady.
	AI_Output			(self ,other, "DIA_Jack_GREET_14_01"); //Jsi nęjakej pobledlej kolem žaber.
	AI_Output			(self ,other, "DIA_Jack_GREET_14_02"); //Nic si z toho nedęlej, kámo. Všechno, co potâebuješ, je dobrý silný moâský vzduch.
};


///////////////////////////////////////////////////////////////////////
//	Was machst Du hier
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_Job		(C_INFO)
{
	npc			 = 	VLK_444_Jack;
	nr			 = 	5;
	condition	 = 	DIA_Jack_Job_Condition;
	information	 = 	DIA_Jack_Job_Info;

	description	 = 	"Co tady dęláš?";
};

func int DIA_Jack_Job_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Jack_GREET)
	{
		return TRUE;
	};
};
func void DIA_Jack_Job_Info ()
{
	AI_Output			(other, self, "DIA_Jack_Job_15_00"); //Co tady dęláš?
	AI_Output			(self, other, "DIA_Jack_Job_14_01"); //Dâív, když jsem byl ještę mladej, jsem hodnę času trávil na moâi a prožil spoustu bouâí.
	AI_Output			(self, other, "DIA_Jack_Job_14_02"); //Pâed mnoha lety jsem se tu usadil a už pęknou âádku let se starám o khorinidský maják.
	AI_Output			(self, other, "DIA_Jack_Job_14_03"); //Žádnej velkej kšeft. Vůbec ne. Ale ta stará vęž mi tak pâirostla k srdci, že už se v ní cítím jako doma.
	AI_Output			(self, other, "DIA_Jack_Job_14_04"); //Už jsem tam nahoâe nebyl celou vęčnost.
	AI_Output			(other, self, "DIA_Jack_Job_15_05"); //Proč ne?
	AI_Output			(self ,other, "DIA_Jack_Job_14_06"); //Od tý doby, co můj maják obsadili nęjací budižkničemové, jsem nemęl odvahu se tam dostat blíž než na dvacet stop. Vážnę hrozná chátra.
	AI_Output			(self ,other, "DIA_Jack_Job_14_07"); //Jsou to trestanci z Hornického údolí, však víš.
	AI_Output			(self ,other, "DIA_Jack_Job_14_08"); //Jednou to na druhý stranę hor poâádnę bouchlo a pak zamoâili celou zem jako kobylky. Teë se ukrývají úplnę všude, dokonce i v mym majáku.
	AI_Output			(self ,other, "DIA_Jack_Job_14_09"); //Mám dojem, že vyhlížej nęjakou loë, co by mohli vyrabovat.
	AI_Output			(self ,other, "DIA_Jack_Job_14_10"); //Ha! Aă to udęlaj. Alespoŕ vypadnou z mojí vęže.
	
	Log_CreateTopic (TOPIC_KillLighthouseBandits, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KillLighthouseBandits, LOG_RUNNING);
	B_LogEntry (TOPIC_KillLighthouseBandits,"Starý moâský vlk Jack se nemůže vrátit na svůj maják, neboă jej obsadili bandité."); 
	
	MIS_Jack_KillLighthouseBandits = LOG_RUNNING;
	
};

///////////////////////////////////////////////////////////////////////
//	Erzähl mir was über die Stadt
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_City		(C_INFO)
{
	npc			 = 	VLK_444_Jack;
	nr			 = 	6;
	condition	 = 	DIA_Jack_City_Condition;
	information	 = 	DIA_Jack_City_Info;

	description	 = 	"Chodíš do męsta často?";
};

func int DIA_Jack_City_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Jack_Job)
	{
		return TRUE;
	};
};
func void DIA_Jack_City_Info ()
{
	AI_Output			(other, self, "DIA_Jack_City_15_00"); //Pâicházíš do męsta často?
	AI_Output			(self ,other, "DIA_Jack_City_14_01"); //Vždycky âíkám, že męsto je tak dobrý, jak dobrej je jeho pâístav.
	AI_Output			(self ,other, "DIA_Jack_City_14_02"); //Pâístav je brána do svęta. Tady se všichni setkávají a tady všechno začíná.
	AI_Output			(self ,other, "DIA_Jack_City_14_03"); //Jakmile je pâístav v háji, zbytek męsta dopadne brzo stejnę.
};

///////////////////////////////////////////////////////////////////////
//	Erzähl mir was über den Hafen
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_Harbor		(C_INFO)
{
	npc			 = 	VLK_444_Jack;
	nr			 = 	70;
	condition	 = 	DIA_Jack_Harbor_Condition;
	information	 = 	DIA_Jack_Harbor_Info;
	permanent	 =  TRUE;

	description	 = 	"Povęz mi nęco o pâístavu.";
};

func int DIA_Jack_Harbor_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Jack_City)
		&&	((Npc_GetDistToWP(self,"LIGHTHOUSE")< 3000) == FALSE)
		&& 	(JackIsCaptain == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Jack_Harbor_Info ()
{
	AI_Output			(other, self, "DIA_Jack_Harbor_15_00"); //Âekni mi nęco o pâístavu.
	AI_Output			(self ,other, "DIA_Jack_Harbor_14_01"); //Khorinidský pâístav už není, co býval.
	AI_Output			(self ,other, "DIA_Jack_Harbor_14_02"); //Není tu nic než chátra, co se poflakuje kolem, už sem nepâiplouvají žádné lodę a obchod je mrtvej. Tenhle pâístav je odepsanej.
	
	Info_ClearChoices (DIA_Jack_Harbor);
	Info_AddChoice (DIA_Jack_Harbor,DIALOG_BACK,DIA_Jack_Harbor_Back);
	Info_AddChoice (DIA_Jack_Harbor,"Proč už sem nepâiplouvají žádné lodę?",DIA_Jack_Harbor_Ships);
	Info_AddChoice (DIA_Jack_Harbor,"Co myslíš tou chátrou?",DIA_Jack_Harbor_Rogue);
	Info_AddChoice (DIA_Jack_Harbor,"Tak proč neodejdeš?",DIA_Jack_Harbor_Leave);
};

FUNC VOID DIA_Jack_Harbor_Back ()
{
	Info_ClearChoices (DIA_Jack_Harbor);
};

FUNC VOID DIA_Jack_Harbor_Ships ()
{	
	AI_Output (other,self ,"DIA_Jack_Harbor_Ships_15_00"); //Proč už sem nepâiplouvají žádné lodę?
	AI_Output (self ,other,"DIA_Jack_Harbor_Ships_14_01"); //Všichni âíkají, že až válka skončí, vrátí se všechno do starejch kolejí. Jsou to jenom kecy.
	AI_Output (self ,other,"DIA_Jack_Harbor_Ships_14_02"); //Âíkám ti, námoâník pozná, když to jde s męstem z kopce.
	AI_Output (self ,other,"DIA_Jack_Harbor_Ships_14_03"); //Námoâník to cítí v krvi. A âeknu ti, zapomeŕ na pâístav, ten už to má spočítaný.
};

FUNC VOID DIA_Jack_Harbor_Rogue ()
{
	AI_Output (other,self ,"DIA_Jack_Harbor_Rogue_15_00"); //Co myslíš tou chátrou?
	AI_Output (self ,other,"DIA_Jack_Harbor_Rogue_14_01"); //Koukni na nę, líná sebranka. Vętšina z nich vůbec netuší, co je práce. Všechno, co svedou, je chlastat celej den a poslední prachy utratit v bordelu.
	AI_Output (self ,other,"DIA_Jack_Harbor_Rogue_14_02"); //Âíkám ti, drž se od nich dál.
};

FUNC VOID DIA_Jack_Harbor_Leave ()
{
	AI_Output (other,self ,"DIA_Jack_Harbor_Leave_15_00"); //Tak proč neodejdeš?
	AI_Output (self ,other,"DIA_Jack_Harbor_Leave_14_01"); //Nikdo si v tuhle dobu nevezme na palubu takovýho starýho moâskýho vlka, jako jsem já.
	AI_Output (self ,other,"DIA_Jack_Harbor_Leave_14_02"); //Vętšina lidí si myslí, ze starej Jack má ve svejch prohnilejch kostech dnu.
	AI_Output (other,self ,"DIA_Jack_Harbor_Leave_15_03"); //A? Je to pravda?
	AI_Output (self ,other,"DIA_Jack_Harbor_Leave_14_04"); //Nesmysl. Jakmile mám palubu pod nohama, cítím se jako mladej jura.
};

///////////////////////////////////////////////////////////////////////
//	Info BanditenWeg
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_BANDITENWEG		(C_INFO)
{
	npc		 = 	VLK_444_Jack;
	nr		 = 	7;
	condition	 = 	DIA_Jack_BANDITENWEG_Condition;
	information	 = 	DIA_Jack_BANDITENWEG_Info;

	description	 = 	"Bandité, kteâí ti obsadili maják, už jsou pryč.";
};

func int DIA_Jack_BANDITENWEG_Condition ()
{
	if (Npc_IsDead(LeuchtturmBandit_1021))
		&& (Npc_IsDead(LeuchtturmBandit_1022))
		&& (Npc_IsDead(LeuchtturmBandit_1023))
		&& (MIS_Jack_KillLighthouseBandits == LOG_RUNNING)
		{
			return TRUE;
		};
};

func void DIA_Jack_BANDITENWEG_Info ()
{
	AI_Output			(other, self, "DIA_Jack_BANDITENWEG_15_00"); //Ti banditi, co zabrali tvůj maják, jsou pryč.
	AI_Output			(self, other, "DIA_Jack_BANDITENWEG_14_01"); //Je to vážnę pravda? Konečnę se můžu vrátit ke svý práci.
	AI_Output			(self, other, "DIA_Jack_BANDITENWEG_14_02"); //Pâijë za mnou na maják. Nahoâe je krásnej výhled na moâe.
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Maják");
	MIS_Jack_KillLighthouseBandits = LOG_SUCCESS;
	B_GivePlayerXP (XP_KillLighthouseBandits);
};

///////////////////////////////////////////////////////////////////////
//	Info LighthouseFree
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_LIGHTHOUSEFREE		(C_INFO)
{
	npc		 = 	VLK_444_Jack;
	nr		 = 	8;
	condition	 = 	DIA_Jack_LIGHTHOUSEFREE_Condition;
	information	 = 	DIA_Jack_LIGHTHOUSEFREE_Info;
	permanent	 = 	TRUE;


	description	 = 	"Máš tady pęknej maják.";
};

func int DIA_Jack_LIGHTHOUSEFREE_Condition ()
{
	if (MIS_Jack_KillLighthouseBandits == LOG_SUCCESS)
		&&	(Npc_GetDistToWP(self,"LIGHTHOUSE")<3000) 
		&& (MIS_SCKnowsWayToIrdorath == FALSE) 
		{
				return TRUE;
		};
};

func void DIA_Jack_LIGHTHOUSEFREE_Info ()
{
	AI_Output			(other, self, "DIA_Jack_LIGHTHOUSEFREE_15_00"); //Máš tady pęknej maják.
	AI_Output			(self, other, "DIA_Jack_LIGHTHOUSEFREE_14_01"); //Díky. Prostę vyjdi po všech tęch schodech nahoru a vychutnej si ten nádherný výhled, chlapče. Jako doma.
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

INSTANCE DIA_Jack_KAP3_EXIT(C_INFO)
{
	npc			= VLK_444_Jack;
	nr			= 999;
	condition	= DIA_Jack_KAP3_EXIT_Condition;
	information	= DIA_Jack_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Jack_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jack_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
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

INSTANCE DIA_Jack_KAP4_EXIT(C_INFO)
{
	npc			= VLK_444_Jack;
	nr			= 999;
	condition	= DIA_Jack_KAP4_EXIT_Condition;
	information	= DIA_Jack_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Jack_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jack_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
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

INSTANCE DIA_Jack_KAP5_EXIT(C_INFO)
{
	npc			= VLK_444_Jack;
	nr			= 999;
	condition	= DIA_Jack_KAP5_EXIT_Condition;
	information	= DIA_Jack_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Jack_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jack_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


///////////////////////////////////////////////////////////////////////
//	Info BeMyCaptain
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_BEMYCAPTAIN		(C_INFO)
{
	npc		 = 	VLK_444_Jack;
	nr		 = 	51;
	condition	 = 	DIA_Jack_BEMYCAPTAIN_Condition;
	information	 = 	DIA_Jack_BEMYCAPTAIN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Nechtęl by ses vrátit zpátky na moâe?";
};

func int DIA_Jack_BEMYCAPTAIN_Condition ()
{
	if (Kapitel == 5)
		&& (MIS_SCKnowsWayToIrdorath == TRUE)
		&& (MIS_Jack_KillLighthouseBandits == LOG_SUCCESS)
		&& (MIS_Jack_NewLighthouseOfficer == 0)
		{
				return TRUE;
		};
};

func void DIA_Jack_BEMYCAPTAIN_Info ()
{
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_15_00"); //Nechtęl by ses vrátit na moâe?
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_14_01"); //Dal bych pravou ruku za to, kdyby mę ještę jednou nękdo najal na velkej škuner.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_14_02"); //Ale pro takovýho starýho moâskýho vlka to není tak snadný, hochu. A stejnę, kdo by se pak staral o maják?

	Info_ClearChoices	(DIA_Jack_BEMYCAPTAIN);
	Info_AddChoice	(DIA_Jack_BEMYCAPTAIN, "Nevadí. Byl to jen nápad.", DIA_Jack_BEMYCAPTAIN_no );
	Info_AddChoice	(DIA_Jack_BEMYCAPTAIN, "Potâebuju tvoje námoânický zkušenosti.", DIA_Jack_BEMYCAPTAIN_seaman );

};

func void DIA_Jack_BEMYCAPTAIN_seaman ()
{
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_seaman_15_00"); //Potâebuju tvoje námoânický zkušenosti.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_14_01"); //U všech rozvrzanejch fošen. Co máš za lubem, chlapče? Nehodláš si vyzkoušet palubu královský válečný galéry, že ne?
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_seaman_15_02"); //Kdo ví?
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_14_03"); //(smích) To by mohlo nęco znamenat. No dobrá. Nemůžu tu ale nechat maják jen tak. Mmh. Co s tím udęláme?
	
	Log_CreateTopic (TOPIC_Captain, LOG_MISSION);                                                                                                                        
	Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);                                                                                                                      
	B_LogEntry (TOPIC_Captain,"Ze starého námoâníka Jacka z pâístavu může být dobrý kapitán - nejdâív ale musím sehnat nękoho, kdo mu ohlídá maják."); 
	
	Info_ClearChoices	(DIA_Jack_BEMYCAPTAIN);
	Info_AddChoice	(DIA_Jack_BEMYCAPTAIN, "Nevadí. Byl to jen nápad.", DIA_Jack_BEMYCAPTAIN_no );
	Info_AddChoice	(DIA_Jack_BEMYCAPTAIN, "Co když ti nękoho pâivedu...?", DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer );

};
func void DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer ()
{
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_15_00"); //Co když ti seženu nękoho, kdo se zatím o maják postará?
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_01"); //To není špatnej nápad, hochu. A já takovýho človęka znám.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_02"); //Kováâ Harad má učedníka jménem Brian. Už jsem s ním hodnękrát mluvil.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_03"); //Chtęl bych svůj maják svęâit právę jemu. Myslim, že je pro to ten pravej.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_04"); //Bęž si s ním promluvit. Možná budeme mít štęstí a ten kluk nám pomůže.
	
	Info_ClearChoices	(DIA_Jack_BEMYCAPTAIN);
	MIS_Jack_NewLighthouseOfficer = LOG_RUNNING;
};


func void DIA_Jack_BEMYCAPTAIN_no ()
{
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_no_15_00"); //Nevadí. Byl to jen nápad.
	Info_ClearChoices	(DIA_Jack_BEMYCAPTAIN);
};

///////////////////////////////////////////////////////////////////////
//	Info BeMyCaptain2
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_BEMYCAPTAIN2		(C_INFO)
{
	npc		 = 	VLK_444_Jack;
	nr		 = 	52;
	condition	 = 	DIA_Jack_BEMYCAPTAIN2_Condition;
	information	 = 	DIA_Jack_BEMYCAPTAIN2_Info;

	description	 = 	"Co se týče Briana...";
};

func int DIA_Jack_BEMYCAPTAIN2_Condition ()
{
	if 	((MIS_Jack_NewLighthouseOfficer == LOG_SUCCESS)
		|| 	((MIS_Jack_NewLighthouseOfficer == LOG_RUNNING)	&& 	(Npc_IsDead(Brian))))
		{
				return TRUE;
		};
};

func void DIA_Jack_BEMYCAPTAIN2_Info ()
{
	if (Npc_IsDead(Brian))
	{
			AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN2_15_00"); //Brian je mrtvý.
			AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN2_14_01"); //Ach. Tohle jsou strašný časy. A byli jsme tak dobrý kámoši.
			MIS_Jack_NewLighthouseOfficer = LOG_OBSOLETE;
	}
	else
	{
			AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN2_15_02"); //Brian se odteë bude starat o tvůj maják.
			AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN2_14_03"); //Doufal jsem, že to âekneš.
			B_GivePlayerXP (XP_Jack_NewLighthouseOfficer);
 
		
			if (SCGotCaptain == FALSE)
			{
			AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN2_14_04"); //Ještę poâád mę potâebuješ?
			}
			else
			{
			AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN2_14_05"); //Podíváme se, jestli je ten kluk k nęčemu dobrej.
			AI_StopProcessInfos (self);
			};
	};
};

///////////////////////////////////////////////////////////////////////
//	Info BeMyCaptain3
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_BEMYCAPTAIN3		(C_INFO)
{
	npc		 = 	VLK_444_Jack;
	nr		 = 	53;
	condition	 = 	DIA_Jack_BEMYCAPTAIN3_Condition;
	information	 = 	DIA_Jack_BEMYCAPTAIN3_Info;

	description	 = 	"Buë mým kapitánem.";
};

func int DIA_Jack_BEMYCAPTAIN3_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Jack_BEMYCAPTAIN2))
		&& (SCGotCaptain == FALSE)
		&& (MIS_Jack_NewLighthouseOfficer == LOG_SUCCESS)
		{
				return TRUE;
		};
};

func void DIA_Jack_BEMYCAPTAIN3_Info ()
{
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN3_15_00"); //Buë mým kapitánem.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN3_14_01"); //Proplul jsem sedmero moâí, hochu, ale ještę nikdy jsem nebyl kapitánem lodi.
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN3_15_02"); //O navigaci nevím vůbec nic. Męl by ses toho ujmout sám.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN3_14_03"); //Udęlám, co bude v mých silách.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN3_14_04"); //Tak mi ukaž svou loë i s posádkou. A víš ty vůbec, kam máme namíâeno? Myslim, jestli máš námoâní mapu?
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN3_15_05"); //Počkej na mę v pâístavu. O zbytek se nestarej.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN3_14_06"); //Když to âíkáš.
	AI_StopProcessInfos (self);
	SCGotCaptain = TRUE;
	JackIsCaptain = TRUE;
	self.flags = NPC_FLAG_IMMORTAL;
	Npc_ExchangeRoutine	(self,"WaitForShipCaptain");
	
	B_GivePlayerXP (XP_Captain_Success);        
};

///////////////////////////////////////////////////////////////////////
//	Info Losfahren
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_LOSFAHREN		(C_INFO)
{
	npc		 = 	VLK_444_Jack;
	nr		 = 	59;
	condition	 = 	DIA_Jack_LOSFAHREN_Condition;
	information	 = 	DIA_Jack_LOSFAHREN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Dobrá, starochu. Tak vyplouváme.";
};

func int DIA_Jack_LOSFAHREN_Condition ()
{
	if (JackIsCaptain == TRUE)
		&& (MIS_ReadyforChapter6 ==	FALSE)
		{
				return TRUE;
		};
};

func void DIA_Jack_LOSFAHREN_Info ()
{
	AI_Output			(other, self, "DIA_Jack_LOSFAHREN_15_00"); //Dobrá, starochu. Tak vyplouváme.

	if ((B_CaptainConditions (self)) == TRUE)
	{
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_01"); //Všechno je v poâádku. Tak mi ukaž tu námoâní mapu.
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_02"); //To bude pęknej výlet. Doufám, že se tam dostaneme v jednom kuse.
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_03"); //Máš opravdu všechno, co potâebuješ? Nebudeme se vracet jen proto, že jsi nęco zapomnęl.
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_04"); //Jestli si seš jistej, že máme opravdu všechno, bęž do kapitánský kajuty a dej si dvacet. Prospęje ti to.
		AI_StopProcessInfos (self);
		B_CaptainCallsAllOnBoard (self);
	}
	else
	{
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_05"); //Klídek, chlapče. Ještę jsem ten škopek nevidęl. Takhle to nepude.
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_06"); //Nejdâív budeš potâebovat kompletní posádku s minimálnę pęti chlapama, volný pâístup na loë a námoâní mapu. Jinak na to zapomeŕ.
		AI_StopProcessInfos (self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info perm5_NotCaptain
///////////////////////////////////////////////////////////////////////

instance DIA_Jack_PERM5_NOTCAPTAIN		(C_INFO)
{
	npc		 = 	VLK_444_Jack;
	nr		 = 	59;
	condition	 = 	DIA_Jack_PERM5_NOTCAPTAIN_Condition;
	information	 = 	DIA_Jack_PERM5_NOTCAPTAIN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Co bude pak?";
};

func int DIA_Jack_PERM5_NOTCAPTAIN_Condition ()
{
		if	((Npc_KnowsInfo(other, DIA_Jack_BEMYCAPTAIN2))
		&& 	(SCGotCaptain == TRUE)
		&&	(JackIsCaptain == FALSE))
		|| 	(MIS_Jack_NewLighthouseOfficer == LOG_OBSOLETE)
		{
				return TRUE;
		};
};

func void DIA_Jack_PERM5_NOTCAPTAIN_Info ()
{
	AI_Output			(other, self, "DIA_Jack_PERM5_NOTCAPTAIN_15_00"); //Co bude pak?
	AI_Output			(self, other, "DIA_Jack_PERM5_NOTCAPTAIN_14_01"); //Rozmyslel jsem si to. Zůstanu tady a budu radęj hlídat svůj maják.
	
	AI_StopProcessInfos (self);
};

//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Jack_KAP6_EXIT(C_INFO)
{
	npc			= VLK_444_Jack;
	nr			= 999;
	condition	= DIA_Jack_KAP6_EXIT_Condition;
	information	= DIA_Jack_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Jack_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jack_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};










































 





















