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
	AI_Output			(self ,other, "DIA_Jack_GREET_14_01"); //Jsi nìjakej pobledlej kolem žaber.
	AI_Output			(self ,other, "DIA_Jack_GREET_14_02"); //Nic si z toho nedìlej, kámo. Všechno, co potøebuješ, je dobrý silný moøský vzduch.
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

	description	 = 	"Co tady dìláš?";
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
	AI_Output			(other, self, "DIA_Jack_Job_15_00"); //Co tady dìláš?
	//AI_Output			(self, other, "DIA_Jack_Job_14_01"); //Døív, když jsem byl ještì mladej, jsem hodnì èasu trávil na moøi a prožil spoustu bouøí.
	//AI_Output			(self, other, "DIA_Jack_Job_14_02"); //Pøed mnoha lety jsem se tu usadil a už pìknou øádku let se starám o khorinidský maják.
	//AI_Output			(self, other, "DIA_Jack_Job_14_03"); //Žádnej velkej kšeft. Vùbec ne. Ale ta stará vìž mi tak pøirostla k srdci, že už se v ní cítím jako doma.
	//AI_Output			(self, other, "DIA_Jack_Job_14_04"); //Už jsem tam nahoøe nebyl celou vìènost.
	//AI_Output			(other, self, "DIA_Jack_Job_15_05"); //Proè ne?
	AI_Output			(self ,other, "DIA_Jack_Job_14_06"); //Od tý doby, co mùj maják obsadili nìjací budižknièemové, jsem nemìl odvahu se tam dostat blíž než na dvacet stop. Vážnì hrozná chátra.
	AI_Output			(self ,other, "DIA_Jack_Job_14_07"); //Jsou to trestanci z Hornického údolí, však víš.
	AI_Output			(self ,other, "DIA_Jack_Job_14_08"); //Jednou to na druhý stranì hor poøádnì bouchlo a pak zamoøili celou zem jako kobylky. Teï se ukrývají úplnì všude, dokonce i v mym majáku.
	AI_Output			(self ,other, "DIA_Jack_Job_14_09"); //Mám dojem, že vyhlížej nìjakou loï, co by mohli vyrabovat.
	AI_Output			(self ,other, "DIA_Jack_Job_14_10"); //Ha! A to udìlaj. Alespoò vypadnou z mojí vìže.
	
	Log_CreateTopic (TOPIC_KillLighthouseBandits, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KillLighthouseBandits, LOG_RUNNING);
	B_LogEntry (TOPIC_KillLighthouseBandits,"Starý moøský vlk Jack se nemùže vrátit na svùj maják, nebo jej obsadili bandité."); 
	
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

	description	 = 	"Chodíš do mìsta èasto?";
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
	AI_Output			(other, self, "DIA_Jack_City_15_00"); //Pøicházíš do mìsta èasto?
	AI_Output			(self ,other, "DIA_Jack_City_14_01"); //Vždycky øíkám, že mìsto je tak dobrý, jak dobrej je jeho pøístav.
	AI_Output			(self ,other, "DIA_Jack_City_14_02"); //Pøístav je brána do svìta. Tady se všichni setkávají a tady všechno zaèíná.
	AI_Output			(self ,other, "DIA_Jack_City_14_03"); //Jakmile je pøístav v háji, zbytek mìsta dopadne brzo stejnì.
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

	description	 = 	"Povìz mi nìco o pøístavu.";
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
	AI_Output			(other, self, "DIA_Jack_Harbor_15_00"); //Øekni mi nìco o pøístavu.
	AI_Output			(self ,other, "DIA_Jack_Harbor_14_01"); //Khorinidský pøístav už není, co býval.
	AI_Output			(self ,other, "DIA_Jack_Harbor_14_02"); //Není tu nic než chátra, co se poflakuje kolem, už sem nepøiplouvají žádné lodì a obchod je mrtvej. Tenhle pøístav je odepsanej.
	
	Info_ClearChoices (DIA_Jack_Harbor);
	Info_AddChoice (DIA_Jack_Harbor,DIALOG_BACK,DIA_Jack_Harbor_Back);
	Info_AddChoice (DIA_Jack_Harbor,"Proè už sem nepøiplouvají žádné lodì?",DIA_Jack_Harbor_Ships);
	Info_AddChoice (DIA_Jack_Harbor,"Co myslíš tou chátrou?",DIA_Jack_Harbor_Rogue);
	Info_AddChoice (DIA_Jack_Harbor,"Tak proè neodejdeš?",DIA_Jack_Harbor_Leave);
};

FUNC VOID DIA_Jack_Harbor_Back ()
{
	Info_ClearChoices (DIA_Jack_Harbor);
};

FUNC VOID DIA_Jack_Harbor_Ships ()
{	
	AI_Output (other,self ,"DIA_Jack_Harbor_Ships_15_00"); //Proè už sem nepøiplouvají žádné lodì?
	AI_Output (self ,other,"DIA_Jack_Harbor_Ships_14_01"); //Všichni øíkají, že až válka skonèí, vrátí se všechno do starejch kolejí. Jsou to jenom kecy.
	AI_Output (self ,other,"DIA_Jack_Harbor_Ships_14_02"); //Øíkám ti, námoøník pozná, když to jde s mìstem z kopce.
	AI_Output (self ,other,"DIA_Jack_Harbor_Ships_14_03"); //Námoøník to cítí v krvi. A øeknu ti, zapomeò na pøístav, ten už to má spoèítaný.
};

FUNC VOID DIA_Jack_Harbor_Rogue ()
{
	AI_Output (other,self ,"DIA_Jack_Harbor_Rogue_15_00"); //Co myslíš tou chátrou?
	AI_Output (self ,other,"DIA_Jack_Harbor_Rogue_14_01"); //Koukni na nì, líná sebranka. Vìtšina z nich vùbec netuší, co je práce. Všechno, co svedou, je chlastat celej den a poslední prachy utratit v bordelu.
	AI_Output (self ,other,"DIA_Jack_Harbor_Rogue_14_02"); //Øíkám ti, drž se od nich dál.
};

FUNC VOID DIA_Jack_Harbor_Leave ()
{
	AI_Output (other,self ,"DIA_Jack_Harbor_Leave_15_00"); //Tak proè neodejdeš?
	AI_Output (self ,other,"DIA_Jack_Harbor_Leave_14_01"); //Nikdo si v tuhle dobu nevezme na palubu takovýho starýho moøskýho vlka, jako jsem já.
	AI_Output (self ,other,"DIA_Jack_Harbor_Leave_14_02"); //Vìtšina lidí si myslí, ze starej Jack má ve svejch prohnilejch kostech dnu.
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

	description	 = 	"Bandité, kteøí ti obsadili maják, už jsou pryè.";
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
	AI_Output			(self, other, "DIA_Jack_BANDITENWEG_14_01"); //Je to vážnì pravda? Koneènì se mùžu vrátit ke svý práci.
	AI_Output			(self, other, "DIA_Jack_BANDITENWEG_14_02"); //Pøijï za mnou na maják. Nahoøe je krásnej výhled na moøe.
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Lighthouse");
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


	description	 = 	"Máš tady pìknej maják.";
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
	AI_Output			(other, self, "DIA_Jack_LIGHTHOUSEFREE_15_00"); //Máš tady pìknej maják.
	AI_Output			(self, other, "DIA_Jack_LIGHTHOUSEFREE_14_01"); //Díky. Prostì vyjdi po všech tìch schodech nahoru a vychutnej si ten nádherný výhled, chlapèe. Jako doma.
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

	description	 = 	"Nechtìl by ses vrátit zpátky na moøe?";
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
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_15_00"); //Nechtìl by ses vrátit na moøe?
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_14_01"); //Dal bych pravou ruku za to, kdyby mì ještì jednou nìkdo najal na velkej škuner.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_14_02"); //Ale pro takovýho starýho moøskýho vlka to není tak snadný, hochu. A stejnì, kdo by se pak staral o maják?

	Info_ClearChoices	(DIA_Jack_BEMYCAPTAIN);
	Info_AddChoice	(DIA_Jack_BEMYCAPTAIN, "Nevadí. Byl to jen nápad.", DIA_Jack_BEMYCAPTAIN_no );
	Info_AddChoice	(DIA_Jack_BEMYCAPTAIN, "Potøebuju tvoje námoønický zkušenosti.", DIA_Jack_BEMYCAPTAIN_seaman );

};

func void DIA_Jack_BEMYCAPTAIN_seaman ()
{
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_seaman_15_00"); //Potøebuju tvoje námoønický zkušenosti.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_14_01"); //U všech rozvrzanejch fošen. Co máš za lubem, chlapèe? Nehodláš si vyzkoušet palubu královský váleèný galéry, že ne?
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_seaman_15_02"); //Kdo ví?
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_14_03"); //(smích) To by mohlo nìco znamenat. No dobrá. Nemùžu tu ale nechat maják jen tak. Mmh. Co s tím udìláme?
	
	Log_CreateTopic (TOPIC_Captain, LOG_MISSION);                                                                                                                        
	Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);                                                                                                                      
	B_LogEntry (TOPIC_Captain,"Ze starého námoøníka Jacka z pøístavu mùže být dobrý kapitán - nejdøív ale musím sehnat nìkoho, kdo mu ohlídá maják."); 
	
	Info_ClearChoices	(DIA_Jack_BEMYCAPTAIN);
	Info_AddChoice	(DIA_Jack_BEMYCAPTAIN, "Nevadí. Byl to jen nápad.", DIA_Jack_BEMYCAPTAIN_no );
	Info_AddChoice	(DIA_Jack_BEMYCAPTAIN, "Co když ti nìkoho pøivedu...?", DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer );

};
func void DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer ()
{
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_15_00"); //Co když ti seženu nìkoho, kdo se zatím o maják postará?
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_01"); //To není špatnej nápad, hochu. A já takovýho èlovìka znám.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_02"); //Kováø Harad má uèedníka jménem Brian. Už jsem s ním hodnìkrát mluvil.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_03"); //Chtìl bych svùj maják svìøit právì jemu. Myslim, že je pro to ten pravej.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_04"); //Bìž si s ním promluvit. Možná budeme mít štìstí a ten kluk nám pomùže.
	
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
			AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN2_15_02"); //Brian se odteï bude starat o tvùj maják.
			AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN2_14_03"); //Doufal jsem, že to øekneš.
			B_GivePlayerXP (XP_Jack_NewLighthouseOfficer);
 
		
			if (SCGotCaptain == FALSE)
			{
			AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN2_14_04"); //Ještì poøád mì potøebuješ?
			}
			else
			{
			AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN2_14_05"); //Podíváme se, jestli je ten kluk k nìèemu dobrej.
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

	description	 = 	"Buï mým kapitánem.";
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
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN3_15_00"); //Buï mým kapitánem.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN3_14_01"); //Proplul jsem sedmero moøí, hochu, ale ještì nikdy jsem nebyl kapitánem lodi.
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN3_15_02"); //O navigaci nevím vùbec nic. Mìl by ses toho ujmout sám.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN3_14_03"); //Udìlám, co bude v mých silách.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN3_14_04"); //Tak mi ukaž svou loï i s posádkou. A víš ty vùbec, kam máme namíøeno? Myslim, jestli máš námoøní mapu?
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN3_15_05"); //Poèkej na mì v pøístavu. O zbytek se nestarej.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN3_14_06"); //Když to øíkáš.
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
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_01"); //Všechno je v poøádku. Tak mi ukaž tu námoøní mapu.
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_02"); //To bude pìknej výlet. Doufám, že se tam dostaneme v jednom kuse.
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_03"); //Máš opravdu všechno, co potøebuješ? Nebudeme se vracet jen proto, že jsi nìco zapomnìl.
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_04"); //Jestli si seš jistej, že máme opravdu všechno, bìž do kapitánský kajuty a dej si dvacet. Prospìje ti to.
		AI_StopProcessInfos (self);
		B_CaptainCallsAllOnBoard (self);
	}
	else
	{
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_05"); //Klídek, chlapèe. Ještì jsem ten škopek nevidìl. Takhle to nepude.
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_06"); //Nejdøív budeš potøebovat kompletní posádku s minimálnì pìti chlapama, volný pøístup na loï a námoøní mapu. Jinak na to zapomeò.
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
	AI_Output			(self, other, "DIA_Jack_PERM5_NOTCAPTAIN_14_01"); //Rozmyslel jsem si to. Zùstanu tady a budu radìj hlídat svùj maják.
	
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










































 





















