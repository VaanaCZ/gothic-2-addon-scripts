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
	AI_Output			(self ,other, "DIA_Jack_GREET_14_00"); //Zdravím, ty suchozemská kryso, vypadá to, že zùstáváš tady.
	AI_Output			(self ,other, "DIA_Jack_GREET_14_01"); //Jsi nêjakej pobledlej kolem žaber.
	AI_Output			(self ,other, "DIA_Jack_GREET_14_02"); //Nic si z toho nedêlej, kámo. Všechno, co potâebuješ, je dobrý silný moâský vzduch.
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

	description	 = 	"Co tady dêláš?";
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
	AI_Output			(other, self, "DIA_Jack_Job_15_00"); //Co tady dêláš?
	AI_Output			(self, other, "DIA_Jack_Job_14_01"); //Dâív, když jsem byl ještê mladej, jsem hodnê èasu trávil na moâi a prožil spoustu bouâí.
	AI_Output			(self, other, "DIA_Jack_Job_14_02"); //Pâed mnoha lety jsem se tu usadil a už pêknou âádku let se starám o khorinidský maják.
	AI_Output			(self, other, "DIA_Jack_Job_14_03"); //Žádnej velkej kšeft. Vùbec ne. Ale ta stará vêž mi tak pâirostla k srdci, že už se v ní cítím jako doma.
	AI_Output			(self, other, "DIA_Jack_Job_14_04"); //Už jsem tam nahoâe nebyl celou vêènost.
	AI_Output			(other, self, "DIA_Jack_Job_15_05"); //Proè ne?
	AI_Output			(self ,other, "DIA_Jack_Job_14_06"); //Od tý doby, co mùj maják obsadili nêjací budižknièemové, jsem nemêl odvahu se tam dostat blíž než na dvacet stop. Vážnê hrozná chátra.
	AI_Output			(self ,other, "DIA_Jack_Job_14_07"); //Jsou to trestanci z Hornického údolí, však víš.
	AI_Output			(self ,other, "DIA_Jack_Job_14_08"); //Jednou to na druhý stranê hor poâádnê bouchlo a pak zamoâili celou zem jako kobylky. Teë se ukrývají úplnê všude, dokonce i v mym majáku.
	AI_Output			(self ,other, "DIA_Jack_Job_14_09"); //Mám dojem, že vyhlížej nêjakou loë, co by mohli vyrabovat.
	AI_Output			(self ,other, "DIA_Jack_Job_14_10"); //Ha! Aã to udêlaj. Alespoà vypadnou z mojí vêže.
	
	Log_CreateTopic (TOPIC_KillLighthouseBandits, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KillLighthouseBandits, LOG_RUNNING);
	B_LogEntry (TOPIC_KillLighthouseBandits,"Starý moâský vlk Jack se nemùže vrátit na svùj maják, neboã jej obsadili bandité."); 
	
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

	description	 = 	"Chodíš do mêsta èasto?";
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
	AI_Output			(other, self, "DIA_Jack_City_15_00"); //Pâicházíš do mêsta èasto?
	AI_Output			(self ,other, "DIA_Jack_City_14_01"); //Vždycky âíkám, že mêsto je tak dobrý, jak dobrej je jeho pâístav.
	AI_Output			(self ,other, "DIA_Jack_City_14_02"); //Pâístav je brána do svêta. Tady se všichni setkávají a tady všechno zaèíná.
	AI_Output			(self ,other, "DIA_Jack_City_14_03"); //Jakmile je pâístav v háji, zbytek mêsta dopadne brzo stejnê.
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

	description	 = 	"Povêz mi nêco o pâístavu.";
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
	AI_Output			(other, self, "DIA_Jack_Harbor_15_00"); //Âekni mi nêco o pâístavu.
	AI_Output			(self ,other, "DIA_Jack_Harbor_14_01"); //Khorinidský pâístav už není, co býval.
	AI_Output			(self ,other, "DIA_Jack_Harbor_14_02"); //Není tu nic než chátra, co se poflakuje kolem, už sem nepâiplouvají žádné lodê a obchod je mrtvej. Tenhle pâístav je odepsanej.
	
	Info_ClearChoices (DIA_Jack_Harbor);
	Info_AddChoice (DIA_Jack_Harbor,DIALOG_BACK,DIA_Jack_Harbor_Back);
	Info_AddChoice (DIA_Jack_Harbor,"Proè už sem nepâiplouvají žádné lodê?",DIA_Jack_Harbor_Ships);
	Info_AddChoice (DIA_Jack_Harbor,"Co myslíš tou chátrou?",DIA_Jack_Harbor_Rogue);
	Info_AddChoice (DIA_Jack_Harbor,"Tak proè neodejdeš?",DIA_Jack_Harbor_Leave);
};

FUNC VOID DIA_Jack_Harbor_Back ()
{
	Info_ClearChoices (DIA_Jack_Harbor);
};

FUNC VOID DIA_Jack_Harbor_Ships ()
{	
	AI_Output (other,self ,"DIA_Jack_Harbor_Ships_15_00"); //Proè už sem nepâiplouvají žádné lodê?
	AI_Output (self ,other,"DIA_Jack_Harbor_Ships_14_01"); //Všichni âíkají, že až válka skonèí, vrátí se všechno do starejch kolejí. Jsou to jenom kecy.
	AI_Output (self ,other,"DIA_Jack_Harbor_Ships_14_02"); //Âíkám ti, námoâník pozná, když to jde s mêstem z kopce.
	AI_Output (self ,other,"DIA_Jack_Harbor_Ships_14_03"); //Námoâník to cítí v krvi. A âeknu ti, zapomeà na pâístav, ten už to má spoèítaný.
};

FUNC VOID DIA_Jack_Harbor_Rogue ()
{
	AI_Output (other,self ,"DIA_Jack_Harbor_Rogue_15_00"); //Co myslíš tou chátrou?
	AI_Output (self ,other,"DIA_Jack_Harbor_Rogue_14_01"); //Koukni na nê, líná sebranka. Vêtšina z nich vùbec netuší, co je práce. Všechno, co svedou, je chlastat celej den a poslední prachy utratit v bordelu.
	AI_Output (self ,other,"DIA_Jack_Harbor_Rogue_14_02"); //Âíkám ti, drž se od nich dál.
};

FUNC VOID DIA_Jack_Harbor_Leave ()
{
	AI_Output (other,self ,"DIA_Jack_Harbor_Leave_15_00"); //Tak proè neodejdeš?
	AI_Output (self ,other,"DIA_Jack_Harbor_Leave_14_01"); //Nikdo si v tuhle dobu nevezme na palubu takovýho starýho moâskýho vlka, jako jsem já.
	AI_Output (self ,other,"DIA_Jack_Harbor_Leave_14_02"); //Vêtšina lidí si myslí, ze starej Jack má ve svejch prohnilejch kostech dnu.
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

	description	 = 	"Bandité, kteâí ti obsadili maják, už jsou pryè.";
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
	AI_Output			(other, self, "DIA_Jack_BANDITENWEG_15_00"); //Ti banditi, co zabrali tvùj maják, jsou pryè.
	AI_Output			(self, other, "DIA_Jack_BANDITENWEG_14_01"); //Je to vážnê pravda? Koneènê se mùžu vrátit ke svý práci.
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


	description	 = 	"Máš tady pêknej maják.";
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
	AI_Output			(other, self, "DIA_Jack_LIGHTHOUSEFREE_15_00"); //Máš tady pêknej maják.
	AI_Output			(self, other, "DIA_Jack_LIGHTHOUSEFREE_14_01"); //Díky. Prostê vyjdi po všech têch schodech nahoru a vychutnej si ten nádherný výhled, chlapèe. Jako doma.
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

	description	 = 	"Nechtêl by ses vrátit zpátky na moâe?";
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
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_15_00"); //Nechtêl by ses vrátit na moâe?
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_14_01"); //Dal bych pravou ruku za to, kdyby mê ještê jednou nêkdo najal na velkej škuner.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_14_02"); //Ale pro takovýho starýho moâskýho vlka to není tak snadný, hochu. A stejnê, kdo by se pak staral o maják?

	Info_ClearChoices	(DIA_Jack_BEMYCAPTAIN);
	Info_AddChoice	(DIA_Jack_BEMYCAPTAIN, "Nevadí. Byl to jen nápad.", DIA_Jack_BEMYCAPTAIN_no );
	Info_AddChoice	(DIA_Jack_BEMYCAPTAIN, "Potâebuju tvoje námoânický zkušenosti.", DIA_Jack_BEMYCAPTAIN_seaman );

};

func void DIA_Jack_BEMYCAPTAIN_seaman ()
{
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_seaman_15_00"); //Potâebuju tvoje námoânický zkušenosti.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_14_01"); //U všech rozvrzanejch fošen. Co máš za lubem, chlapèe? Nehodláš si vyzkoušet palubu královský váleèný galéry, že ne?
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_seaman_15_02"); //Kdo ví?
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_14_03"); //(smích) To by mohlo nêco znamenat. No dobrá. Nemùžu tu ale nechat maják jen tak. Mmh. Co s tím udêláme?
	
	Log_CreateTopic (TOPIC_Captain, LOG_MISSION);                                                                                                                        
	Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);                                                                                                                      
	B_LogEntry (TOPIC_Captain,"Ze starého námoâníka Jacka z pâístavu mùže být dobrý kapitán - nejdâív ale musím sehnat nêkoho, kdo mu ohlídá maják."); 
	
	Info_ClearChoices	(DIA_Jack_BEMYCAPTAIN);
	Info_AddChoice	(DIA_Jack_BEMYCAPTAIN, "Nevadí. Byl to jen nápad.", DIA_Jack_BEMYCAPTAIN_no );
	Info_AddChoice	(DIA_Jack_BEMYCAPTAIN, "Co když ti nêkoho pâivedu...?", DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer );

};
func void DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer ()
{
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_15_00"); //Co když ti seženu nêkoho, kdo se zatím o maják postará?
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_01"); //To není špatnej nápad, hochu. A já takovýho èlovêka znám.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_02"); //Kováâ Harad má uèedníka jménem Brian. Už jsem s ním hodnêkrát mluvil.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_03"); //Chtêl bych svùj maják svêâit právê jemu. Myslim, že je pro to ten pravej.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_04"); //Bêž si s ním promluvit. Možná budeme mít štêstí a ten kluk nám pomùže.
	
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

	description	 = 	"Co se týèe Briana...";
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
			AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN2_14_01"); //Ach. Tohle jsou strašný èasy. A byli jsme tak dobrý kámoši.
			MIS_Jack_NewLighthouseOfficer = LOG_OBSOLETE;
	}
	else
	{
			AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN2_15_02"); //Brian se odteë bude starat o tvùj maják.
			AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN2_14_03"); //Doufal jsem, že to âekneš.
			B_GivePlayerXP (XP_Jack_NewLighthouseOfficer);
 
		
			if (SCGotCaptain == FALSE)
			{
			AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN2_14_04"); //Ještê poâád mê potâebuješ?
			}
			else
			{
			AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN2_14_05"); //Podíváme se, jestli je ten kluk k nêèemu dobrej.
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
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN3_14_01"); //Proplul jsem sedmero moâí, hochu, ale ještê nikdy jsem nebyl kapitánem lodi.
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN3_15_02"); //O navigaci nevím vùbec nic. Mêl by ses toho ujmout sám.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN3_14_03"); //Udêlám, co bude v mých silách.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN3_14_04"); //Tak mi ukaž svou loë i s posádkou. A víš ty vùbec, kam máme namíâeno? Myslim, jestli máš námoâní mapu?
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN3_15_05"); //Poèkej na mê v pâístavu. O zbytek se nestarej.
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
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_02"); //To bude pêknej výlet. Doufám, že se tam dostaneme v jednom kuse.
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_03"); //Máš opravdu všechno, co potâebuješ? Nebudeme se vracet jen proto, že jsi nêco zapomnêl.
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_04"); //Jestli si seš jistej, že máme opravdu všechno, bêž do kapitánský kajuty a dej si dvacet. Prospêje ti to.
		AI_StopProcessInfos (self);
		B_CaptainCallsAllOnBoard (self);
	}
	else
	{
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_05"); //Klídek, chlapèe. Ještê jsem ten škopek nevidêl. Takhle to nepude.
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_06"); //Nejdâív budeš potâebovat kompletní posádku s minimálnê pêti chlapama, volný pâístup na loë a námoâní mapu. Jinak na to zapomeà.
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
	AI_Output			(self, other, "DIA_Jack_PERM5_NOTCAPTAIN_14_01"); //Rozmyslel jsem si to. Zùstanu tady a budu radêj hlídat svùj maják.
	
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










































 





















