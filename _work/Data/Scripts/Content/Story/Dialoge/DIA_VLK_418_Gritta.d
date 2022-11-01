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
	AI_Output (self ,other,"DIA_Gritta_Hello_16_00"); //Co chceš, cizinče? Jestli jsi pâišel žebrat, pak tę musím zklamat - jsem jenom chudá vdova.
	AI_Output (self ,other,"DIA_Gritta_Hello_16_01"); //Jmenuji se Gritta. Od té doby, co mi zemâel manžel, vedu domácnost svému strýci Thorbenovi.
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
	description = "Posílá mę Matteo, prý mu stále dlužíš nęjaké peníze.";
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
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_15_00"); //Posílá mę Matteo, prý mu stále dlužíš nęjaké peníze.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_16_01"); //On chce své peníze? A proč? Zboží, které mi dodal, bylo vadné, špatnę utkané a ještę hůâe sešité.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_16_02"); //A vidęl jsi ty barvy? Vůbec se nepodobaly tęm, jaké jsem si objednala! Je to podvod, nic jiného!
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_16_03"); //Âeknu ti, že kdyby byl naživu můj muž, Matteo by si nikdy nic takového nedovolil. Ach, můj ubohý manžel...

	Info_ClearChoices (DIA_Gritta_WantsMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Nech toho. Kde jsou ty prachy?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Pokračovat...",DIA_Gritta_WantsMoney_Continue01);
};
FUNC VOID DIA_Gritta_WantsMoney_Continue01 ()
{
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_continue01_16_00"); //...byl to takový dobrák. Pohledný, pracovitý a džentlmen ze staré školy. Nic nám nechybęlo - byli jsme bohatí a šăastní...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue01_16_01"); //...občas nás dokonce zvali i do lepší společnosti. Samé slavnosti, krásné šaty a účesy...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue01_16_02"); //...vybraná jídla a zdvoâilá konverzace. Všechno bylo tenkrát lepší. Tehdy by si nikdo nedovolil urážet nebohou vdovu takovými...
	
	Info_ClearChoices (DIA_Gritta_WantsMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Nech toho. Kde jsou ty prachy?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Pokračovat...",DIA_Gritta_WantsMoney_Continue02);
};
FUNC VOID DIA_Gritta_WantsMoney_Continue02 ()
{
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_continue02_16_00"); //...smęšnými tvrzeními. Co si jen počnu? Moje renta stačí jen taktak na pâežití a časy jsou čím dál horší. Je to vidęt všude...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue02_16_01"); //...lidé musí šetâit, škudlit a utahovat opasky. Už celé týdny do męsta nedorazila žádná loë. Můj muž býval kapitánem obchodní lodi - vlastnę ji zároveŕ i vlastnil...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue02_16_02"); //...ze svých cest mi vždycky vozil dárky - nádherné látky z pevniny, vzácné koâení z jižních zemí...
	
	Info_ClearChoices (DIA_Gritta_WantsMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Nech toho. Kde jsou ty prachy?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Pokračovat...",DIA_Gritta_WantsMoney_Continue03);
};
FUNC VOID DIA_Gritta_WantsMoney_Continue03 ()
{
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_continue03_16_00"); //...vętšina lidí o podobných vęcech nikdy neslyšela. Ale jednoho dne jsem dostala zprávu, že Gritta se potopila - ano, naše loë nesla toto jméno, můj muž tím dával najevo...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue03_16_01"); //...lásku, jakou ke mnę choval. Plakala jsem a modlila se, aby můj drahý to neštęstí pâežil, každý den jsem doufala, že o nęm tâeba uslyším, ale má touha byla marná...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue04_16_02"); //...kéž se Innos smiluje nad jeho duší. Aă odpočívá v pokoji. Od té doby tu pâebývám v tęchto skromných podmínkách, a teë mę ten bezcitný, bezohledný Matteo...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue04_16_03"); //...chce pâipravit o poslední zbyteček mých celoživotních úspor. Prosím, smiluj se nad ubohou ženou. Kdyby byl naživu můj muž, nikdy by si nic takového nedovolil. Ach, můj ubohý manžel...
	
	Info_ClearChoices (DIA_Gritta_WantsMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Pâestaŕ s tím. Kde je to zlato?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Pokračovat...",DIA_Gritta_WantsMoney_Continue01);
};
FUNC VOID DIA_Gritta_WantsMoney_WhereMoney ()
{
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_WhereMoney_15_00"); //Pâestaŕ s tím. Kde je to zlato?
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_WhereMoney_16_01"); //(vzdorovitę) Ale já to zlato nemám, jsem jenom chudá vdova!
	
	Info_ClearChoices (DIA_Gritta_WantsMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Naval prachy, nebo ti jednu vlepím!",DIA_Gritta_WantsMoney_BeatUp);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Tak to asi budeme muset prodat nęjaký tvůj majetek...",DIA_Gritta_WantsMoney_EnoughStuff);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Tak já tu sumu zaplatím za tebe.",DIA_Gritta_WantsMoney_IWillPay);
};
FUNC VOID DIA_Gritta_WantsMoney_EnoughStuff ()
{
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_EnoughStuff_15_00"); //Tak prostę prodej pár tęch svých hadâíků. Určitę jich máš ve skâíni celou hromadu.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_EnoughStuff_16_01"); //Jak se opovažuješ, ty nevychovanče! No tak dobâe, tady máš to zlato.
	B_GiveInvItems (self,other,ItMi_Gold, 100); 
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_EnoughStuff_15_02"); //(úšklebek) Vida, ani to nebolelo.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_EnoughStuff_16_03"); //(jedovatę) A teë prosím odejdi z mého domu.
	
	Gritta_GoldGiven = TRUE;
	
	AI_StopProcessInfos (self); 
};
func VOID DIA_Gritta_WantsMoney_IWillPay ()
{
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_IWillPay_15_00"); //Tak já tu sumu zaplatím za tebe.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_IWillPay_16_01"); //Opravdu bys to pro mę udęlal? Ach, já vędęla, že nejsi takový nenažraný hajzl jako Matteo!
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_IWillPay_15_02"); //No jo, to nic.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_IWillPay_16_03"); //Vraă se, až to zaâídíš - chci se ti nęjak odvdęčit.
	Info_ClearChoices (DIA_Gritta_WantsMoney);
	
	Gritta_WantPay = TRUE;
};
FUNC VOID DIA_Gritta_WantsMoney_BeatUp ()
{
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_BeatUp_15_00"); //(hrozivę) Naval prachy, nebo ti jednu vlepím!
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_BeatUp_16_01"); //(vyzývavę) Jsi jenom prachsprostý lump. Jen pojë, vytas zbraŕ a já zavolám stráže!
	
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
	AI_Output (self, other, "DIA_Gritta_WINE_16_00"); //To od tebe bylo opravdu šlechetné, žes to za mę zaplatil. Chtęla bych se ti nęjak odmęnit.
	AI_Output (self, other, "DIA_Gritta_WINE_16_01"); //Tuhle láhev vína mi manžel - nechă Innos dopâeje pokoj jeho duši - pâivezl z jižních ostrovů.
	AI_Output (self, other, "DIA_Gritta_WINE_16_02"); //Také jsem to všude rozhlásila. Aspoŕ nękdo tu má v tęle kouska cti.
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
		AI_Output (self, other, "DIA_Gritta_PERM_16_00"); //Dokud jsou ve męstę muži jako ty, stále mohu v srdci chovat nadęji, že se vše v dobré obrátí.
	}
	else if (Gritta_WantPay == TRUE)
	&&		(Npc_HasItems (self, itmi_gold) >= 100)
	{
		AI_Output (self, other, "DIA_Gritta_PERM_16_01"); //Vraă se, až urovnáš tu záležitost s Matteem.
	}
	else if (Gritta_Threatened == TRUE)
	&&		(Npc_HasItems (self, itmi_gold) >= 100)
	{
		AI_Output (self, other, "DIA_Gritta_PERM_16_02"); //Co na mę tak blbę čumíš? Stejnę si na mę netroufneš zaútočit!
	}
	else //Gritta_GoldGiven oder niedergeschlagen
	{
		AI_Output (self, other, "DIA_Gritta_PERM_16_03"); //Co ještę chceš? Moje zlato jsi už dostal, tak vypadni!
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
			AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_01"); //Všecko jde od desíti k pęti. Aă se podíváš, kam se podíváš, všude vládne zločin a násilí. Jen si pâedstav - dokonce zabili jednoho z paladinů!
			
			Info_ClearChoices (DIA_Gritta_Perm3U4U5);
			Info_AddChoice (DIA_Gritta_Perm3U4U5,DIALOG_BACK,DIA_Gritta_Perm3U4U5_BACK);
			Info_AddChoice (DIA_Gritta_Perm3U4U5,"To je válka - takové vęci se stávají.",DIA_Gritta_Perm3U4U5_War);
			Info_AddChoice (DIA_Gritta_Perm3U4U5,"To bude v poâádku.",DIA_Gritta_Perm3U4U5_TurnsGood);
			Info_AddChoice (DIA_Gritta_Perm3U4U5,"Co jsi zaslechla?",DIA_Gritta_Perm3U4U5_Rumors);
		}
		else
		{
			AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_02"); //Ach, lord Hagen toho žoldáka pustil - to mę tak dojalo!
			AI_Output (other,self ,"DIA_Gritta_Perm3U4U5_15_03"); //A co to má společného s tebou?
			AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_04"); //Jen se nad tím zamysli. Vęâíš, že by žoldáci jen tak stáli a dívali se, jak jim vęší kamaráda?
			AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_05"); //Určitę by se ho pokusili osvobodit, a z toho by koukalo poâádné krveprolití. Mohu tedy pouze dękovat Innosovi.
		};	
	}
	else if (Kapitel == 5)	
	{
		AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_06"); //Paladinové jsou pâipraveni a vypadá to, že se brzy vydají na cestu.
	}
	else 
	{
		AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_07"); //Všechno pâi starém, ale nechci si stęžovat.
	};
};

FUNC VOID DIA_Gritta_Perm3U4U5_BACK ()
{
	Info_ClearChoices (DIA_Gritta_Perm3U4U5);
};

FUNC VOID DIA_Gritta_Perm3U4U5_War ()
{
	AI_Output (other,self ,"DIA_Gritta_Perm3U4U5_War_15_00"); //To je válka - takové vęci se stávají.
	AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_War_16_01"); //Ano, za všechno může tahle strašná válka. Každý nęjak trpí a zajímá ho, jak se s tím vším vypoâádají.
	AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_War_16_02"); //Občas se ptám sama sebe, zač nás Innos takhle trestá.
};

FUNC VOID DIA_Gritta_Perm3U4U5_TurnsGood ()
{
	AI_Output (other,self ,"DIA_Gritta_Perm3U4U5_TurnsGood_15_00"); //To bude v poâádku.
	AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_TurnsGood_16_01"); //To je od tebe hezké, že mę chceš povzbudit.
	
	if (GrittaXP_Once == FALSE)
	{
		B_GivePlayerXP (XP_AMBIENT);
		GrittaXP_Once = TRUE;
	};	
};

FUNC VOID DIA_Gritta_Perm3U4U5_Rumors ()
{
	AI_Output (other,self ,"DIA_Gritta_Perm3U4U5_Rumors_15_00"); //Co jsi zaslechla?
	AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_Rumors_16_01"); //Jenom to, co si vyprávęjí lidé na ulici.
	AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_Rumors_16_02"); //Prý už chytli toho vraha, ale neâeknu ti, jestli je to pravda.
};












