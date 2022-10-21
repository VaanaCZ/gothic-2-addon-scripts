// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Gritta_EXIT(C_INFO)
{
	npc			= VLK_418_Gritta;
	nr			= 999;
	condition	= DIA_Gritta_EXIT_Condition;
	information	= DIA_Gritta_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Gritta_EXIT_Condition()
{
	if (Kapitel <= 2)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Gritta_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Gritta_PICKPOCKET (C_INFO)
{
	npc			= VLK_418_Gritta;
	nr			= 900;
	condition	= DIA_Gritta_PICKPOCKET_Condition;
	information	= DIA_Gritta_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20_Female;
};                       

FUNC INT DIA_Gritta_PICKPOCKET_Condition()
{
	C_Beklauen (20, 20);
};
 
FUNC VOID DIA_Gritta_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Gritta_PICKPOCKET);
	Info_AddChoice		(DIA_Gritta_PICKPOCKET, DIALOG_BACK 		,DIA_Gritta_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Gritta_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Gritta_PICKPOCKET_DoIt);
};

func void DIA_Gritta_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Gritta_PICKPOCKET);
};
	
func void DIA_Gritta_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Gritta_PICKPOCKET);
};
// ************************************************************
// 			  				   Hello 
// ************************************************************
INSTANCE DIA_Gritta_Hello(C_INFO)
{
	npc			= VLK_418_Gritta;
	nr			= 10;
	condition	= DIA_Gritta_Hello_Condition;
	information	= DIA_Gritta_Hello_Info;
	permanent	= FALSE;
	Important   = TRUE;
};                       
FUNC INT DIA_Gritta_Hello_Condition()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Gritta_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Gritta_Hello_16_00"); //Co chceš, cizinèe? Jestli jsi pøišel ebrat, pak tì musím zklamat - jsem jenom chudá vdova.
	AI_Output (self ,other,"DIA_Gritta_Hello_16_01"); //Jmenuji se Gritta. Od té doby, co mi zemøel manel, vedu domácnost svému strıci Thorbenovi.
};
//*************************************************************
//			Matteo will sein Geld
//*************************************************************
INSTANCE DIA_Gritta_WantsMoney(C_INFO)
{
	npc			= VLK_418_Gritta;
	nr			= 2;
	condition	= DIA_Gritta_WantsMoney_Condition;
	information	= DIA_Gritta_WantsMoney_Info;
	permanent	= FALSE;
	description = "Posílá mì Matteo, prı mu stále dluíš nìjaké peníze.";
};                       
FUNC INT DIA_Gritta_WantsMoney_Condition()
{
	if (MIS_Matteo_Gold == LOG_RUNNING)
	{
		return TRUE;
	};	
};
//------------------------------------
var int Gritta_WantPay;
var int Gritta_Threatened;
//------------------------------------
FUNC VOID DIA_Gritta_WantsMoney_Info()
{	
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_15_00"); //Posílá mì Matteo, prı mu stále dluíš nìjaké peníze.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_16_01"); //On chce své peníze? A proè? Zboí, které mi dodal, bylo vadné, špatnì utkané a ještì hùøe sešité.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_16_02"); //A vidìl jsi ty barvy? Vùbec se nepodobaly tìm, jaké jsem si objednala! Je to podvod, nic jiného!
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_16_03"); //Øeknu ti, e kdyby byl naivu mùj mu, Matteo by si nikdy nic takového nedovolil. Ach, mùj ubohı manel...

	Info_ClearChoices (DIA_Gritta_WantsMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Nech toho. Kde jsou ty prachy?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Pokraèovat...",DIA_Gritta_WantsMoney_Continue01);
};
FUNC VOID DIA_Gritta_WantsMoney_Continue01 ()
{
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_continue01_16_00"); //...byl to takovı dobrák. Pohlednı, pracovitı a dentlmen ze staré školy. Nic nám nechybìlo - byli jsme bohatí a šastní...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue01_16_01"); //...obèas nás dokonce zvali i do lepší spoleènosti. Samé slavnosti, krásné šaty a úèesy...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue01_16_02"); //...vybraná jídla a zdvoøilá konverzace. Všechno bylo tenkrát lepší. Tehdy by si nikdo nedovolil uráet nebohou vdovu takovımi...
	
	Info_ClearChoices (DIA_Gritta_WantsMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Nech toho. Kde jsou ty prachy?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Pokraèovat...",DIA_Gritta_WantsMoney_Continue02);
};
FUNC VOID DIA_Gritta_WantsMoney_Continue02 ()
{
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_continue02_16_00"); //...smìšnımi tvrzeními. Co si jen poènu? Moje renta staèí jen taktak na pøeití a èasy jsou èím dál horší. Je to vidìt všude...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue02_16_01"); //...lidé musí šetøit, škudlit a utahovat opasky. U celé tıdny do mìsta nedorazila ádná loï. Mùj mu bıval kapitánem obchodní lodi - vlastnì ji zároveò i vlastnil...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue02_16_02"); //...ze svıch cest mi vdycky vozil dárky - nádherné látky z pevniny, vzácné koøení z jiních zemí...
	
	Info_ClearChoices (DIA_Gritta_WantsMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Nech toho. Kde jsou ty prachy?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Pokraèovat...",DIA_Gritta_WantsMoney_Continue03);
};
FUNC VOID DIA_Gritta_WantsMoney_Continue03 ()
{
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_continue03_16_00"); //...vìtšina lidí o podobnıch vìcech nikdy neslyšela. Ale jednoho dne jsem dostala zprávu, e Gritta se potopila - ano, naše loï nesla toto jméno, mùj mu tím dával najevo...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue03_16_01"); //...lásku, jakou ke mnì choval. Plakala jsem a modlila se, aby mùj drahı to neštìstí pøeil, kadı den jsem doufala, e o nìm tøeba uslyším, ale má touha byla marná...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue04_16_02"); //...ké se Innos smiluje nad jeho duší. A odpoèívá v pokoji. Od té doby tu pøebıvám v tìchto skromnıch podmínkách, a teï mì ten bezcitnı, bezohlednı Matteo...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue04_16_03"); //...chce pøipravit o poslední zbyteèek mıch celoivotních úspor. Prosím, smiluj se nad ubohou enou. Kdyby byl naivu mùj mu, nikdy by si nic takového nedovolil. Ach, mùj ubohı manel...
	
	Info_ClearChoices (DIA_Gritta_WantsMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Pøestaò s tím. Kde je to zlato?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Pokraèovat...",DIA_Gritta_WantsMoney_Continue01);
};
FUNC VOID DIA_Gritta_WantsMoney_WhereMoney ()
{
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_WhereMoney_15_00"); //Pøestaò s tím. Kde je to zlato?
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_WhereMoney_16_01"); //(vzdorovitì) Ale já to zlato nemám, jsem jenom chudá vdova!
	
	Info_ClearChoices (DIA_Gritta_WantsMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Naval prachy, nebo ti jednu vlepím!",DIA_Gritta_WantsMoney_BeatUp);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Tak to asi budeme muset prodat nìjakı tvùj majetek...",DIA_Gritta_WantsMoney_EnoughStuff);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Tak já tu sumu zaplatím za tebe.",DIA_Gritta_WantsMoney_IWillPay);
};
FUNC VOID DIA_Gritta_WantsMoney_EnoughStuff ()
{
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_EnoughStuff_15_00"); //Tak prostì prodej pár tìch svıch hadøíkù. Urèitì jich máš ve skøíni celou hromadu.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_EnoughStuff_16_01"); //Jak se opovauješ, ty nevychovanèe! No tak dobøe, tady máš to zlato.
	B_GiveInvItems (self,other,ItMi_Gold, 100); 
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_EnoughStuff_15_02"); //(úšklebek) Vida, ani to nebolelo.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_EnoughStuff_16_03"); //(jedovatì) A teï prosím odejdi z mého domu.
	
	Gritta_GoldGiven = TRUE;
	
	AI_StopProcessInfos (self); 
};
func VOID DIA_Gritta_WantsMoney_IWillPay ()
{
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_IWillPay_15_00"); //Tak já tu sumu zaplatím za tebe.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_IWillPay_16_01"); //Opravdu bys to pro mì udìlal? Ach, já vìdìla, e nejsi takovı nenaranı hajzl jako Matteo!
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_IWillPay_15_02"); //No jo, to nic.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_IWillPay_16_03"); //Vra se, a to zaøídíš - chci se ti nìjak odvdìèit.
	Info_ClearChoices (DIA_Gritta_WantsMoney);
	
	Gritta_WantPay = TRUE;
};
FUNC VOID DIA_Gritta_WantsMoney_BeatUp ()
{
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_BeatUp_15_00"); //(hrozivì) Naval prachy, nebo ti jednu vlepím!
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_BeatUp_16_01"); //(vyzıvavì) Jsi jenom prachsprostı lump. Jen pojï, vytas zbraò a já zavolám stráe!
	
	Gritta_Threatened = TRUE;
	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info WINE
///////////////////////////////////////////////////////////////////////
instance DIA_Gritta_WINE		(C_INFO)
{
	npc			 = 	VLK_418_Gritta;
	nr			 = 	2;
	condition	 = 	DIA_Gritta_WINE_Condition;
	information	 = 	DIA_Gritta_WINE_Info;
	permanent    =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Gritta_WINE_Condition ()
{	
	if (Npc_IsInState (self, ZS_Talk))
	&& (Gritta_WantPay == TRUE)
	&& (MIS_Matteo_Gold == LOG_SUCCESS)
	&& (Npc_HasItems (self, itmi_gold) >= 100)
	{
		return TRUE;
	};
};
func void DIA_Gritta_WINE_Info ()
{
	AI_Output (self, other, "DIA_Gritta_WINE_16_00"); //To od tebe bylo opravdu šlechetné, es to za mì zaplatil. Chtìla bych se ti nìjak odmìnit.
	AI_Output (self, other, "DIA_Gritta_WINE_16_01"); //Tuhle láhev vína mi manel - nech Innos dopøeje pokoj jeho duši - pøivezl z jiních ostrovù.
	AI_Output (self, other, "DIA_Gritta_WINE_16_02"); //Také jsem to všude rozhlásila. Aspoò nìkdo tu má v tìle kouska cti.
	AI_Output (other, self, "DIA_Gritta_WINE_15_03"); //No jo, to nic.

	B_GivePlayerXP 		(XP_PayForGritta);
	B_GiveInvItems 		(self, other, Itfo_Wine, 1);
	
	AI_StopProcessInfos (self); 
};
// *************************************************************
//							PERM (1u2)
// *************************************************************
instance DIA_Gritta_PERM (C_INFO)
{
	npc			= VLK_418_Gritta;
	nr		 	= 3;
	condition	= DIA_Gritta_PERM_Condition;
	information	= DIA_Gritta_PERM_Info;
	permanent	= TRUE;
	important 	= TRUE;
};
func int DIA_Gritta_PERM_Condition ()
{	
	if (Npc_IsInState (self, ZS_Talk))
	&& (Npc_KnowsInfo (other, DIA_Gritta_WantsMoney))
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Gritta_PERM_Info ()
{
	if (Npc_KnowsInfo (other, DIA_Gritta_WINE))
	&& (Npc_HasItems (self, itmi_gold) >= 100)
	{
		AI_Output (self, other, "DIA_Gritta_PERM_16_00"); //Dokud jsou ve mìstì mui jako ty, stále mohu v srdci chovat nadìji, e se vše v dobré obrátí.
	}
	else if (Gritta_WantPay == TRUE)
	&&		(Npc_HasItems (self, itmi_gold) >= 100)
	{
		AI_Output (self, other, "DIA_Gritta_PERM_16_01"); //Vra se, a urovnáš tu záleitost s Matteem.
	}
	else if (Gritta_Threatened == TRUE)
	&&		(Npc_HasItems (self, itmi_gold) >= 100)
	{
		AI_Output (self, other, "DIA_Gritta_PERM_16_02"); //Co na mì tak blbì èumíš? Stejnì si na mì netroufneš zaútoèit!
	}
	else //Gritta_GoldGiven oder niedergeschlagen
	{
		AI_Output (self, other, "DIA_Gritta_PERM_16_03"); //Co ještì chceš? Moje zlato jsi u dostal, tak vypadni!
	};
	
	AI_StopProcessInfos (self); 
};


//###########################################
//##
//##	Kapitel 3
//##
//###########################################

// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Gritta_Kap3_EXIT(C_INFO)
{
	npc			= VLK_418_Gritta;
	nr			= 999;
	condition	= DIA_Gritta_Kap3_EXIT_Condition;
	information	= DIA_Gritta_Kap3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Gritta_Kap3_EXIT_Condition()
{
	if (Kapitel >= 3 )
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Gritta_Kap3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
//		Perm3U4U5
// ************************************************************

//------------------------------------
var int GrittaXP_Once;
//-----------------------------

INSTANCE DIA_Gritta_Perm3U4U5(C_INFO)
{
	npc			= VLK_418_Gritta;
	nr			= 31;
	condition	= DIA_Gritta_Perm3U4U5_Condition;
	information	= DIA_Gritta_Perm3U4U5_Info;
	permanent	= TRUE;
	description = "Jak se vede?";
};                       
FUNC INT DIA_Gritta_Perm3U4U5_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Gritta_Perm3U4U5_Info()
{	
	AI_Output (other,self ,"DIA_Gritta_Perm3U4U5_15_00"); //Jak se vede?
	
	if (Kapitel == 3)
	{
		if (MIS_RescueBennet != LOG_SUCCESS)
		{
			AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_01"); //Všecko jde od desíti k pìti. A se podíváš, kam se podíváš, všude vládne zloèin a násilí. Jen si pøedstav - dokonce zabili jednoho z paladinù!
			
			Info_ClearChoices (DIA_Gritta_Perm3U4U5);
			Info_AddChoice (DIA_Gritta_Perm3U4U5,DIALOG_BACK,DIA_Gritta_Perm3U4U5_BACK);
			Info_AddChoice (DIA_Gritta_Perm3U4U5,"To je válka - takové vìci se stávají.",DIA_Gritta_Perm3U4U5_War);
			Info_AddChoice (DIA_Gritta_Perm3U4U5,"To bude v poøádku.",DIA_Gritta_Perm3U4U5_TurnsGood);
			Info_AddChoice (DIA_Gritta_Perm3U4U5,"Co jsi zaslechla?",DIA_Gritta_Perm3U4U5_Rumors);
		}
		else
		{
			AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_02"); //Ach, lord Hagen toho oldáka pustil - to mì tak dojalo!
			AI_Output (other,self ,"DIA_Gritta_Perm3U4U5_15_03"); //A co to má spoleèného s tebou?
			AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_04"); //Jen se nad tím zamysli. Vìøíš, e by oldáci jen tak stáli a dívali se, jak jim vìší kamaráda?
			AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_05"); //Urèitì by se ho pokusili osvobodit, a z toho by koukalo poøádné krveprolití. Mohu tedy pouze dìkovat Innosovi.
		};	
	}
	else if (Kapitel == 5)	
	{
		AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_06"); //Paladinové jsou pøipraveni a vypadá to, e se brzy vydají na cestu.
	}
	else 
	{
		AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_07"); //Všechno pøi starém, ale nechci si stìovat.
	};
};

FUNC VOID DIA_Gritta_Perm3U4U5_BACK ()
{
	Info_ClearChoices (DIA_Gritta_Perm3U4U5);
};

FUNC VOID DIA_Gritta_Perm3U4U5_War ()
{
	AI_Output (other,self ,"DIA_Gritta_Perm3U4U5_War_15_00"); //To je válka - takové vìci se stávají.
	AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_War_16_01"); //Ano, za všechno mùe tahle strašná válka. Kadı nìjak trpí a zajímá ho, jak se s tím vším vypoøádají.
	AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_War_16_02"); //Obèas se ptám sama sebe, zaè nás Innos takhle trestá.
};

FUNC VOID DIA_Gritta_Perm3U4U5_TurnsGood ()
{
	AI_Output (other,self ,"DIA_Gritta_Perm3U4U5_TurnsGood_15_00"); //To bude v poøádku.
	AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_TurnsGood_16_01"); //To je od tebe hezké, e mì chceš povzbudit.
	
	if (GrittaXP_Once == FALSE)
	{
		B_GivePlayerXP (XP_AMBIENT);
		GrittaXP_Once = TRUE;
	};	
};

FUNC VOID DIA_Gritta_Perm3U4U5_Rumors ()
{
	AI_Output (other,self ,"DIA_Gritta_Perm3U4U5_Rumors_15_00"); //Co jsi zaslechla?
	AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_Rumors_16_01"); //Jenom to, co si vyprávìjí lidé na ulici.
	AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_Rumors_16_02"); //Prı u chytli toho vraha, ale neøeknu ti, jestli je to pravda.
};












