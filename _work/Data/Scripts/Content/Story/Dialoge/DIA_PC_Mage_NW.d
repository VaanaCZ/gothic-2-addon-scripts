


// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_MiltenNW_EXIT(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 999;
	condition	= DIA_MiltenNW_EXIT_Condition;
	information	= DIA_MiltenNW_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_MiltenNW_EXIT_Condition()
{
	if (Kapitel < 3)	
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_MiltenNW_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
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

INSTANCE DIA_MiltenNW_KAP3_EXIT(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 999;
	condition	= DIA_MiltenNW_KAP3_EXIT_Condition;
	information	= DIA_MiltenNW_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_MiltenNW_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_MiltenNW_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//*************************************************************
//Hallo!
//*************************************************************

INSTANCE DIA_MiltenNW_KAP3_Hello(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 31;
	condition	= DIA_MiltenNW_KAP3_Hello_Condition;
	information	= DIA_MiltenNW_KAP3_Hello_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_MiltenNW_KAP3_Hello_Condition()
{
	if hero.guild == GIL_PAL
	|| hero.guild == GIL_DJG
	{
		return TRUE;
	};	
};

FUNC VOID DIA_MiltenNW_KAP3_Hello_Info()
{	
	if (hero.guild == GIL_PAL)
	{
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_00"); //(nevêâícnê) Nejde mi to na rozum. Opravdu jsi paladin?
		AI_Output (other,self ,"DIA_MiltenNW_KAP3_Hello_15_01"); //Evidentnê.
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_02"); //(euforicky) Pokud je mezi paladiny nêkdo jako ty, mêli by se mít Beliarovi pohùnci radši na pozoru.
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_03"); //Jestli jsi porazil Spáèe, nemêlo by ti pár skâetù dêlat sebemenší potíže.
		AI_Output (other,self ,"DIA_MiltenNW_KAP3_Hello_15_04"); //Ve hâe nejsou jenom skâeti.
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_05"); //To vím, ale i tak je dobré tê mít na své stranê.
		AI_Output (other,self ,"DIA_MiltenNW_KAP3_Hello_15_06"); //No dobrá.
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_07"); //Co dêláš tady v klášteâe? Nech mê hádat. Chceš se uèit umêní magie.
		AI_Output (other,self ,"DIA_MiltenNW_KAP3_Hello_15_08"); //Možná.
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_09"); //Vêdêl jsem to - bêž si promluvit s Mardukem, on je zodpovêdný za vás paladiny. Najdeš ho pâed kaplí.
	};
	if (hero.guild == GIL_DJG)
	{
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_10"); //Vidím, že ty âeèi mêly pravdu.
		AI_Output (other,self ,"DIA_MiltenNW_KAP3_Hello_15_11"); //Jaké âeèi?
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_12"); //Že ses spolèil s têmi drakobijci.
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_13"); //No, nikdy jsi nebyl dobrý materiál pro církev. Aã je to ale jak chce, bojuješ za naši vêc, a to je to, co se poèítá.
		AI_Output (other,self ,"DIA_MiltenNW_KAP3_Hello_15_14"); //Je to vše?
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_15"); //Mám samozâejmê radost. Navíc vypadáš tak, že se tê musí každý skâet hned leknout.
		AI_Output (other,self ,"DIA_MiltenNW_KAP3_Hello_15_16"); //Ve hâe nejsou jenom skâeti.
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_17"); //To vím, ale i tak s nimi jsou problémy. Jsi velmi dùležitý.
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_18"); //Porazil jsi Spáèe. Možná jednoho dne budeme všichni potâebovat pomoc.
		AI_Output (other,self ,"DIA_MiltenNW_KAP3_Hello_15_19"); //No dobrá.
	};		
};	

// ************************************************************
// 	  				   Was machst du hier am Kloster
// ************************************************************

INSTANCE DIA_MiltenNW_Monastery(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 35;
	condition	= DIA_MiltenNW_Monastery_Condition;
	information	= DIA_MiltenNW_Monastery_Info;
	permanent	= FALSE;
	description = "Jak ses dostal do kláštera tak rychle?";
};                       
FUNC INT DIA_MiltenNW_Monastery_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_MiltenNW_Monastery_Info()
{	
	AI_Output (other,self ,"DIA_MiltenNW_Monastery_15_00"); //Jak ses dostal do kláštera tak rychle?
	AI_Output (self ,other,"DIA_MiltenNW_Monastery_03_01"); //Co je to za otázku? Proplížil jsem se prùsmykem a namíâil si to rovnou do kláštera.
	AI_Output (self ,other,"DIA_MiltenNW_Monastery_03_02"); //Pâiznávám, že nebylo vždycky snadné proklouznout mezi têmi všemi pâíšerami, které se zabydlují na téhle stranê údolí, ale pâece jenom jsem mêl míà problémù, než jsem èekal.
};

// ************************************************************
// 	  				   Weisst du wo die Anderen sind?
// ************************************************************

INSTANCE DIA_MiltenNW_FourFriends(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 35;
	condition	= DIA_MiltenNW_FourFriends_Condition;
	information	= DIA_MiltenNW_FourFriends_Info;
	permanent	= FALSE;
	description = "Víš, kde jsou ostatní?";
};                       
FUNC INT DIA_MiltenNW_FourFriends_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_MiltenNW_FourFriends_Info()
{	
	AI_Output (other,self ,"DIA_MiltenNW_FourFriends_15_00"); //Víš, kde jsou ostatní?
	if (Npc_IsDead (PC_FIGHTER_NW_vor_DJG) == FALSE)
	{
		AI_Output (self ,other,"DIA_MiltenNW_FourFriends_03_01"); //Zdá se, že Gorn se vypoâádal s pobytem v Garondovê vêzení docela dobâe.
		
		if (MIS_RescueGorn != LOG_SUCCESS)
		{
			AI_Output (other,self ,"DIA_MiltenNW_FourFriends_15_02"); //Jak se dostal ven?
			AI_Output (self ,other,"DIA_MiltenNW_FourFriends_03_03"); //Musel jsem Garondovi trochu zalhat, abych ho pâesvêdèil, že má obvinêní stáhnout.
			AI_Output (self ,other,"DIA_MiltenNW_FourFriends_03_04"); //Ale bude to jen mezi námi, rozumêno?
		};
		
		AI_Output (self ,other,"DIA_MiltenNW_FourFriends_03_05"); //Každopádnê chtêl jít za Leem a podívat se, co se dêje na farmê.
		AI_Output (self ,other,"DIA_MiltenNW_FourFriends_03_06"); //Po tom blivajzu, co dostával ve vêzení, se urèitê cpe ze všech sil. To bude pro zásoby žoldnéâù têžká zkouška.
	}
	else
	{
		AI_Output (self ,other,"DIA_MiltenNW_FourFriends_03_07"); //Gorn to nepâežil.
	};
	if (Npc_IsDead (PC_THIEF_NW) == FALSE)
	{
		AI_Output (self ,other,"DIA_MiltenNW_FourFriends_03_08"); //Diego mumlal nêco o zúètování. Netuším, co mêl na mysli.
		AI_Output (self ,other,"DIA_MiltenNW_FourFriends_03_09"); //Ale âekl bych, že je ve mêstê. Znáš ho - vždycky se nêco najde.
	}
	else
	{
		AI_Output (self ,other,"DIA_MiltenNW_FourFriends_03_10"); //Diego to koupil - zdá se, že ho bariéra pâece jenom dostala.
	};
};
//*************************************************************
//Ich muss ins Kloster //HauptStory!!!
//*************************************************************

INSTANCE DIA_MiltenNW_KAP3_Entry(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 32;
	condition	= DIA_MiltenNW_KAP3_Entry_Condition;
	information	= DIA_MiltenNW_KAP3_Entry_Info;
	permanent	= TRUE;
	description = "Potâebuji se dostat do kláštera. Je to dùležité!";
};                       
FUNC INT DIA_MiltenNW_KAP3_Entry_Condition()
{
	if (Kapitel == 3)	
	&& (hero.guild != GIL_KDF)
	&& (MiltenNW_GivesMonasteryKey == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_MiltenNW_KAP3_Entry_Info()
{	
	AI_Output (other,self ,"DIA_MiltenNW_KAP3_Entry_15_00"); //Potâebuju se dostat do kláštera. Je to dùležité!
	if (hero.guild == GIL_PAL)
	{
		AI_Output (self,other,"DIA_MiltenNW_KAP3_Entry_03_01"); //Ano, jistê. Tady je klíè.
		
		CreateInvItems (self,ItKe_Innos_Mis,1);
		B_GiveInvItems (self,other,ItKe_Innos_Mis,1); 
	
		MiltenNW_GivesMonasteryKey = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Entry_03_02"); //Nemùžu tê do kláštera vpustit. Mêl bych problémy pâed nejvyšší radou.
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Entry_03_03"); //Bez povolení mých nadâízených nesmím do kláštera nikoho vpustit.
	
		Info_ClearChoices (DIA_MiltenNW_KAP3_Entry);
		Info_AddChoice (DIA_MiltenNW_KAP3_Entry,DIALOG_Back,DIA_MiltenNW_KAP3_Entry_BACK);
		Info_AddChoice (DIA_MiltenNW_KAP3_Entry,"Je to dùležité!",DIA_MiltenNW_KAP3_Entry_Important);
	
		if (Npc_HasItems (other,ItWr_PermissionToWearInnosEye_MIS) >=1)
		{	
			Info_AddChoice (DIA_MiltenNW_KAP3_Entry,"Pâináším dopis od lorda Hagena.",DIA_MiltenNW_KAP3_Entry_Permit); 
		};
	};	
};	
	
FUNC VOID DIA_MiltenNW_KAP3_Entry_BACK ()
{
	Info_ClearChoices (DIA_MiltenNW_KAP3_Entry);
};	

FUNC VOID DIA_MiltenNW_KAP3_Entry_Important ()
{
	AI_Output (other,self ,"DIA_MiltenNW_KAP3_Entry_Important_15_00"); //Je to dùležité!
	AI_Output (self ,other,"DIA_MiltenNW_KAP3_Entry_Important_03_01"); //To nepùjde. Pyrokar by mi utrhl hlavu.
	
	Info_ClearChoices (DIA_MiltenNW_KAP3_Entry);
};

FUNC VOID DIA_MiltenNW_KAP3_Entry_Permit ()
{
	AI_Output (other,self ,"DIA_MiltenNW_KAP3_Entry_Permit_15_00"); //Pâináším dopis od lorda Hagena.
	AI_Output (self ,other,"DIA_MiltenNW_KAP3_Entry_Permit_03_01"); //Ukaž mi ho.
	
	B_GiveInvItems (other,self,ItWr_PermissionToWearInnosEye_MIS,1);
	B_UseFakeScroll ();	
	
	AI_Output (self ,other,"DIA_MiltenNW_KAP3_Entry_Permit_03_02"); //(váhavê) Dobrá. Tady je klíè od kláštera. Pyrokar je v kostele.
	
	CreateInvItems (self,ItKe_Innos_Mis,1);
	B_GiveInvItems (self,other,ItKe_Innos_Mis,1); 
	B_GiveInvItems (self,other,ItWr_PermissionToWearInnosEye_MIS,1);
	
	MiltenNW_GivesMonasteryKey = TRUE;
	
	Info_ClearChoices (DIA_MiltenNW_KAP3_Entry);
};

//***************************************************************
//	Hast du hier jemanden herauskommen gesehen?
//***************************************************************

INSTANCE DIA_MiltenNW_KAP3_NovizenChase(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 31;
	condition	= DIA_MiltenNW_KAP3_NovizenChase_Condition;
	information	= DIA_MiltenNW_KAP3_NovizenChase_Info;
	permanent	= FALSE;
	description = "Nevíš, kde je Pedro?";
};                       
FUNC INT DIA_MiltenNW_KAP3_NovizenChase_Condition()
{
	IF 	(Kapitel == 3) 
	&&	(MIS_NOVIZENCHASE == LOG_RUNNING) 
	&& 	(MIS_SCKnowsInnosEyeIsBroken == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_MiltenNW_KAP3_NovizenChase_Info()
{	
	AI_Output (other,self ,"DIA_MiltenNW_KAP3_NovizenChase_15_00"); //Nevíš, kde je Pedro?
	AI_Output (self ,other,"DIA_MiltenNW_KAP3_NovizenChase_03_01"); //Myslíš, že bych tady jen tak stál, kdybych vêdêl, kde se ten odpadlík schovává?
	AI_Output (self ,other,"DIA_MiltenNW_KAP3_NovizenChase_03_02"); //Musí zaplatit za své èiny. Doufám, že se nám podaâí dostat Oko zpátky.
	AI_Output (self ,other,"DIA_MiltenNW_KAP3_NovizenChase_03_03"); //Musíš nám pomoci. Najdi ho a pâines zpêt Innosovo oko.
	//Joly: AI_Output (self ,other,"DIA_MiltenNW_KAP3_NovizenChase_03_04"); //Ich werde sehen, was ich tun kann.
};	

//***************************************************************
//	Weißt du etwas über die vermummten Gestalten?
//***************************************************************

INSTANCE DIA_MiltenNW_KAP3_Perm(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 39;
	condition	= DIA_MiltenNW_KAP3_Perm_Condition;
	information	= DIA_MiltenNW_KAP3_Perm_Info;
	permanent	= FALSE;
	description = "Nevíš nêco o têch postavách v kápích?";
};                       
FUNC INT DIA_MiltenNW_KAP3_Perm_Condition()
{
	IF 	(Kapitel == 3)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_MiltenNW_KAP3_Perm_Info()
{	
	AI_Output (other,self ,"DIA_MiltenNW_KAP3_Perm_15_00"); //Nevíš nêco o têch postavách v kápích?
	AI_Output (self ,other,"DIA_MiltenNW_KAP3_Perm_03_01"); //Ne, ale nemám z têch chlapíkù dobrý pocit.
	AI_Output (self ,other,"DIA_MiltenNW_KAP3_Perm_03_02"); //Pokud na nê narazíš, buë opatrný.
};	
	

//########################
//##					##
//##	Kapitel 4		##
//##					##
//########################

// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_MiltenNW_KAP4_EXIT(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 999;
	condition	= DIA_MiltenNW_KAP4_EXIT_Condition;
	information	= DIA_MiltenNW_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_MiltenNW_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_MiltenNW_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 	  				   Perm KAP4
// ************************************************************

INSTANCE DIA_MiltenNW_KAP4_PERM(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 49;
	condition	= DIA_MiltenNW_KAP4_PERM_Condition;
	information	= DIA_MiltenNW_KAP4_PERM_Info;
	permanent	= TRUE;
	description = "Co je nového?";
};                       
FUNC INT DIA_MiltenNW_KAP4_PERM_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_MiltenNW_KAP4_PERM_Info()
{	
	AI_Output (other,self ,"DIA_MiltenNW_KAP4_PERM_15_00"); //Co je nového?
	AI_Output (self ,other,"DIA_MiltenNW_KAP4_PERM_03_01"); //Na to bych se mêl zeptat já. Máme tady dost starostí.
	AI_Output (self ,other,"DIA_MiltenNW_KAP4_PERM_03_02"); //Nejvyšší rada se snaží zjistit, co nepâítel udêlá pâíštê.
	AI_Output (other,self ,"DIA_MiltenNW_KAP4_PERM_15_03"); //Nêco dalšího?
	
	if (hero.guild == GIL_PAL)
	{
		AI_Output (self ,other,"DIA_MiltenNW_KAP4_PERM_03_04"); //V poslední dobê jsou útoky skâetù èastêjší, dokonce i mimo Hornické údolí.
		AI_Output (self ,other,"DIA_MiltenNW_KAP4_PERM_03_05"); //Vùbec se mi to nechce líbit - myslím, že už nemáme moc èasu.
	}
	else if (hero.guild == GIL_DJG)
	{
		AI_Output (self ,other,"DIA_MiltenNW_KAP4_PERM_03_06"); //Jeden farmáâ âíkal, že poblíž jeho farmy se objevila nêjaká šupinatá stvoâení.
		AI_Output (self ,other,"DIA_MiltenNW_KAP4_PERM_03_07"); //Nevím, jaký to dává dohromady smysl, ale mám pocit, že nepâítel nêco chystá.
	}
	else if (MIS_FindTheObesessed == LOG_RUNNING)
	{
		AI_Output (self ,other,"DIA_MiltenNW_KAP4_PERM_03_08"); //Dostáváme èím dál tím víc zpráv o posedlých lidech. Nepâítel je silný, silnêjší, než jsme èekali.
	}
	else
	{
		AI_Output (self ,other,"DIA_MiltenNW_KAP4_PERM_03_09"); //Ne, situace je stále vážná. Jediné, co mùžeme dêlat, je vêâit v Innose.
	};
};

//########################
//##					##
//##	Kapitel 5		##
//##					##
//########################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_MiltenNW_KAP5_EXIT(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 999;
	condition	= DIA_MiltenNW_KAP5_EXIT_Condition;
	information	= DIA_MiltenNW_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_MiltenNW_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_MiltenNW_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 	  				   Ich habe alle Drachen getötet. (Perm Kap 5)
// ************************************************************

INSTANCE DIA_MiltenNW_AllDragonsDead(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 900;
	condition	= DIA_MiltenNW_AllDragonsDead_Condition;
	information	= DIA_MiltenNW_AllDragonsDead_Info;
	permanent	= FALSE;
	description = "Pobil jsem všechny draky.";
};                       
FUNC INT DIA_MiltenNW_AllDragonsDead_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_MiltenNW_AllDragonsDead_Info()
{	
	AI_Output (other,self ,"DIA_MiltenNW_AllDragonsDead_15_00"); //Pobil jsem všechny draky.
	AI_Output (self ,other,"DIA_MiltenNW_AllDragonsDead_03_01"); //Vážnê? Takže nadêje pâece jenom ještê žije. Teë už zbývá jen useknout zlu hlavu.
	AI_Output (self ,other,"DIA_MiltenNW_AllDragonsDead_03_02"); //Pokud jsi to vážnê dokázal, mohli bychom válku vyhrát.
	AI_Output (other,self ,"DIA_MiltenNW_AllDragonsDead_15_03"); //Kdo, já?
	AI_Output (self ,other,"DIA_MiltenNW_AllDragonsDead_03_04"); //Samozâejmê že ty. Kdo jiný?
	
	if (MiltenNW_IsOnBoard	 == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_MiltenNW_AllDragonsDead_03_05"); //Mêli bychom brzy vyrazit, dâív než bude pozdê.
	};
};

///////////////////////////////////////////////////////////////////////
//	In Bibliothek gewesen
///////////////////////////////////////////////////////////////////////
instance DIA_MiltenNW_SCWasInLib		(C_INFO)
{
	npc			 = 	PC_Mage_NW;
	nr			 = 	3;
	condition	 = 	DIA_MiltenNW_SCWasInLib_Condition;
	information	 = 	DIA_MiltenNW_SCWasInLib_Info;
	important	 = 	TRUE;

};
func int DIA_MiltenNW_SCWasInLib_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	{
		return TRUE;
	};
};
func void DIA_MiltenNW_SCWasInLib_Info ()
{
	AI_Output			(self, other, "DIA_MiltenNW_SCWasInLib_03_00"); //Hej, slyšel jsem, že jsi strávil dlouhý èas v klášterních sklepech. Co jsi zjistil?
};

///////////////////////////////////////////////////////////////////////
//	Ich weiss wo der Feind ist.
///////////////////////////////////////////////////////////////////////
instance DIA_MiltenNW_KnowWhereEnemy		(C_INFO)
{
	npc			 = 	PC_Mage_NW;
	nr			 = 	55;
	condition	 = 	DIA_MiltenNW_KnowWhereEnemy_Condition;
	information	 = 	DIA_MiltenNW_KnowWhereEnemy_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Vím, kde se nepâítel skrývá.";
};

func int DIA_MiltenNW_KnowWhereEnemy_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (MiltenNW_IsOnBoard == FALSE) 
	{
		return TRUE;
	};
};
var int SCToldMiltenHeKnowWhereEnemy;
func void DIA_MiltenNW_KnowWhereEnemy_Info ()
{
	AI_Output			(other, self, "DIA_MiltenNW_KnowWhereEnemy_15_00"); //Vím, kde se nepâítel ukrývá. Je to malý ostrùvek nedaleko odsud.
	AI_Output			(self, other, "DIA_MiltenNW_KnowWhereEnemy_03_01"); //To je naše velká šance. Musíme okamžitê vyrazit a znièit zlo jednou provždy.
	SCToldMiltenHeKnowWhereEnemy = TRUE;
	
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);  
  	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING);
  	if ((Npc_IsDead(DiegoNW))== FALSE)
  	{
 		AI_Output			(self, other, "DIA_MiltenNW_KnowWhereEnemy_03_02"); //Mluvil jsi o tom s Diegem? Myslím, že by chtêl jet s tebou.
 		B_LogEntry (TOPIC_Crew,"Diego mi mùže velmi pomoci - nikdy dlouho nepobyl na jednom místê.");
 	};

  	if ((Npc_IsDead(GornNW_nach_DJG))== FALSE)
  	{
 		AI_Output			(self, other, "DIA_MiltenNW_KnowWhereEnemy_03_03"); //A co Gorn? Promluv si s ním. Slyšel jsem, že se vrátil z Hornického údolí.
 		B_LogEntry (TOPIC_Crew,"Gorn by mi jistê byl také zdatným pomocníkem. Nikdy neuškodí, máš-li po boku zdatného bojovníka. Snad by mê mohl trochu vycvièit.");
 	};
	
	if ((Npc_IsDead(Lester))== FALSE)
  	{
 		AI_Output			(self, other, "DIA_MiltenNW_KnowWhereEnemy_03_04"); //A nezapomeà na Lestera. Pokud ho nevytáhneš z toho jeho údolí, tak tam shnije.
 		B_LogEntry (TOPIC_Crew,"Jestli Lestera nevezmu s sebou, nejspíš se z tohoto údolí nikdy nedostane.");
 	};
	
	AI_Output			(self, other, "DIA_MiltenNW_KnowWhereEnemy_03_05"); //Znám také svou vlastní roli, kterou bych mêl hrát. Až budeme èelit nepâíteli, mùžu ti posílit magickou energii a pomáhat ti pâi vytváâení run. Kdy zaèneme?
	
	B_LogEntry (TOPIC_Crew,"Pùjde-li Milten se mnou, mùže mê nauèit, jak vyrábêt runy a zvýšit si zásoby many.");
	
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_MiltenNW_KnowWhereEnemy_15_06"); //Ne tak rychle, už mám dost lidí.
		AI_Output			(self, other, "DIA_MiltenNW_KnowWhereEnemy_03_07"); //Víš, že bych s tebou šel. Pokud si to rozmyslíš, budu tady na tebe èekat.
		AI_Output			(self, other, "DIA_MiltenNW_KnowWhereEnemy_03_08"); //Hodnê štêstí, a aã nad tebou Innos drží ochrannou ruku.
	}
	else 
	{
		Info_ClearChoices (DIA_MiltenNW_KnowWhereEnemy);
		Info_AddChoice (DIA_MiltenNW_KnowWhereEnemy,"V tuhle chvíli pro tebe nemám využití.",DIA_MiltenNW_KnowWhereEnemy_No);
		Info_AddChoice (DIA_MiltenNW_KnowWhereEnemy,"Vítej na palubê!",DIA_MiltenNW_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_MiltenNW_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_MiltenNW_KnowWhereEnemy_Yes_15_00"); //Vítej na palubê!
	AI_Output (other,self ,"DIA_MiltenNW_KnowWhereEnemy_Yes_15_01"); //Setkáme se v pâístavu. Poèkej tam na mê.
	AI_Output (self ,other,"DIA_MiltenNW_KnowWhereEnemy_Yes_03_02"); //Dobrá. Budu tam, až budeš pâipraven.
	
	self.flags 		 = NPC_FLAG_IMMORTAL;
	MiltenNW_IsOnBoard	 = LOG_SUCCESS;
	
	B_GivePlayerXP (XP_Crewmember_Success);
	
	crewmember_Count = (Crewmember_Count +1);
	
	if (MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine (self,"SHIP"); 
		}
		else
		{
			Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
		};

	Info_ClearChoices (DIA_MiltenNW_KnowWhereEnemy);
};

FUNC VOID DIA_MiltenNW_KnowWhereEnemy_No ()
{
	AI_Output (other,self ,"DIA_MiltenNW_KnowWhereEnemy_No_15_00"); //V tuhle chvíli pro tebe nemám využití.
	AI_Output (self ,other,"DIA_MiltenNW_KnowWhereEnemy_No_03_01"); //Víš, že bych to s tebou táhl až do konce. Pokud si to rozmyslíš, budu tady na tebe èekat.

	MiltenNW_IsOnBoard	 = LOG_OBSOLETE;
	Info_ClearChoices (DIA_MiltenNW_KnowWhereEnemy);
};

///////////////////////////////////////////////////////////////////////
//	WhereCaptain
///////////////////////////////////////////////////////////////////////
instance DIA_MiltenNW_WhereCaptain		(C_INFO)
{
	npc			 = 	PC_Mage_NW;
	nr			 = 	3;
	condition	 = 	DIA_MiltenNW_WhereCaptain_Condition;
	information	 = 	DIA_MiltenNW_WhereCaptain_Info;
	
	description	 = 	"Kde bych mêl hledat kapitána?";

};
func int DIA_MiltenNW_WhereCaptain_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (SCToldMiltenHeKnowWhereEnemy == TRUE)
	&& (SCGotCaptain == FALSE)
	{
		return TRUE;
	};
};
func void DIA_MiltenNW_WhereCaptain_Info ()
{
	AI_Output			(other, self, "DIA_MiltenNW_WhereCaptain_15_00"); //Kde bych mêl hledat kapitána?
	AI_Output			(self, other, "DIA_MiltenNW_WhereCaptain_03_01"); //Zeptej se Jorgena. Je to koneckoncù námoâník. Mêl by být ještê poâád v klášteâe.
	AI_Output			(self, other, "DIA_MiltenNW_WhereCaptain_03_02"); //Ale jestli ti nebude schopen pomoci, budeš muset hledat nêkoho, kdo by ti âídil loë, na farmách nebo ve mêstê.
	AI_Output			(self, other, "DIA_MiltenNW_WhereCaptain_03_03"); //Nejlepší asi bude promluvit si s Leem nebo jít do pâístavu v Khorinidu. Nic lepšího mê teë nenapadá.
 
	Log_CreateTopic (TOPIC_Captain, LOG_MISSION);                                                                                                                                                            
	Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);                                                                                                                                                          
	B_LogEntry (TOPIC_Captain,"Snad by se mi mohlo podaâit najmout kapitána - Jorgena. Mêl by se ještê zdržovat v klášteâe. Kromê nêho bych mêl na statcích èi ve mêstê natrefit i na jiné kandidáty na tuto funkci. Snad bych si mohl promluvit s Leem nebo se poptat po pâístavu.");
	
};

///////////////////////////////////////////////////////////////////////
//	I kann dich doch nicht gebrauchen!
///////////////////////////////////////////////////////////////////////
instance DIA_MiltenNW_LeaveMyShip		(C_INFO)
{
	npc			 = 	PC_Mage_NW;
	nr			 = 	55;
	condition	 = 	DIA_MiltenNW_LeaveMyShip_Condition;
	information	 = 	DIA_MiltenNW_LeaveMyShip_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Nakonec tê pâece jenom nemùžu vzít s sebou.";
};
func int DIA_MiltenNW_LeaveMyShip_Condition ()
{	
	if (MiltenNW_IsOnBOard == LOG_SUCCESS)
	&& (MIS_ReadyforChapter6 == FALSE)
	{
		return TRUE;
	};
};
func void DIA_MiltenNW_LeaveMyShip_Info ()
{
	AI_Output			(other, self, "DIA_MiltenNW_LeaveMyShip_15_00"); //Nakonec tê pâece jenom nemùžu vzít s sebou.
	AI_Output			(self, other, "DIA_MiltenNW_LeaveMyShip_03_01"); //Sám musíš nejlíp vêdêt, koho budeš potâebovat. Pokud si to rozmyslíš, budu na tebe èekat v klášteâe.
	
	MiltenNW_IsOnBoard	 = LOG_OBSOLETE;				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	crewmember_Count = (Crewmember_Count -1);
	
	Npc_ExchangeRoutine (self,"ShipOff"); 
};

///////////////////////////////////////////////////////////////////////
//	Ich habs mir überlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_MiltenNW_StillNeedYou		(C_INFO)
{
	npc			 = 	PC_Mage_NW;
	nr			 = 	55;
	condition	 = 	DIA_MiltenNW_StillNeedYou_Condition;
	information	 = 	DIA_MiltenNW_StillNeedYou_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Potâebuji tê.";
};
func int DIA_MiltenNW_StillNeedYou_Condition ()
{	
	if ((MiltenNW_IsOnBOard == LOG_OBSOLETE)		//Hier brauch man natürlich nur eine variable abfragen
	|| (MiltenNW_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew)
	{
		return TRUE;
	};
};
func void DIA_MiltenNW_StillNeedYou_Info ()
{
	AI_Output			(other, self, "DIA_MiltenNW_StillNeedYou_15_00"); //Potâebuji tê.

	AI_Output	(self, other, "DIA_MiltenNW_StillNeedYou_03_01"); //Bude mi ctí. Pojëme, nemáme èasu nazbyt.
	AI_Output	(self, other, "DIA_MiltenNW_StillNeedYou_03_02"); //Jdu do pâístavu. Potkáme se tam.
		
	self.flags 		 = NPC_FLAG_IMMORTAL;
	MiltenNW_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	
		if (MIS_ReadyforChapter6 == TRUE)
			{
				Npc_ExchangeRoutine (self,"SHIP"); 
			}
			else
			{
				Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
			};
	
		AI_StopProcessInfos (self);
};



// ************************************************************
// 		Teach
// ************************************************************
INSTANCE DIA_MiltenNW_Teach(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 90;
	condition	= DIA_MiltenNW_Teach_Condition;
	information	= DIA_MiltenNW_Teach_Info;
	permanent	= TRUE;
	description = "Chci se nauèit nêjaká nová kouzla.";
};                       

FUNC INT DIA_MiltenNW_Teach_Condition()
{	
	if (other.guild == GIL_KDF)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenNW_Teach_Info()
{	
	AI_Output (other,self ,"DIA_MiltenNW_Teach_15_00");//Chci se nauèit nêjaká nová kouzla.
	
	if  (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 2)
	{
		Info_ClearChoices (DIA_MiltenNW_Teach);
		Info_AddChoice (DIA_MiltenNW_Teach,DIALOG_BACK,DIA_MiltenNW_Teach_BACK);
		
		if (PLAYER_TALENT_RUNES [SPL_WINDFIST] == FALSE) 
		{
			Info_AddChoice	(DIA_MiltenNW_Teach, B_BuildLearnString (NAME_SPL_WINDFIST, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_WINDFIST)) ,DIA_MiltenNW_Teach_Windfist);
		};
		if (PLAYER_TALENT_RUNES [SPL_InstantFireball] == FALSE) 
		{
			Info_AddChoice	(DIA_MiltenNW_Teach, B_BuildLearnString (NAME_SPL_InstantFireball, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_InstantFireball)) ,DIA_MiltenNW_Teach_Feuerball);
		};
		if (PLAYER_TALENT_RUNES [SPL_Icebolt] == FALSE) 
		{
			Info_AddChoice	(DIA_MiltenNW_Teach, B_BuildLearnString (NAME_SPL_Icebolt, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Icebolt)) ,DIA_MiltenNW_Teach_Eispfeil);
		};
	}
	else
	{
		AI_Output (self ,other,"DIA_MiltenNW_Teach_03_01");//Ještê jsi nepostoupil do druhého magického kruhu. Není nic, co bych tê mohl nauèit.
	};
};	
FUNC VOID DIA_MiltenNW_Teach_BACK()
{
	Info_ClearChoices (DIA_MiltenNW_Teach);
};
FUNC VOID DIA_MiltenNW_Teach_WINDFIST()
{
	B_TeachPlayerTalentRunes (self, other, SPL_WINDFIST);	
};
FUNC VOID DIA_MiltenNW_Teach_Feuerball()
{
	B_TeachPlayerTalentRunes (self, other, SPL_InstantFireball);	
};
FUNC VOID DIA_MiltenNW_Teach_Eispfeil()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Icebolt);	
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_MiltenNW_Mana		(C_INFO)
{
	npc		  	 = 	PC_Mage_NW;
	nr			 = 	100;
	condition	 = 	DIA_MiltenNW_Mana_Condition;
	information	 = 	DIA_MiltenNW_Mana_Info;
	permanent	 = 	TRUE;
	description	 = 	"Chtêl bych posílit svoji magickou moc.";
};
func int DIA_MiltenNW_Mana_Condition ()
{	
	if (other.guild == GIL_KDF)	
	{
		return TRUE;
	};
};
func void DIA_MiltenNW_Mana_Info ()
{
	AI_Output (other, self, "DIA_MiltenNW_Mana_15_00"); //Chtêl bych posílit svoji magickou moc.
	
	Info_ClearChoices   (DIA_MiltenNW_Mana);
	Info_AddChoice 		(DIA_MiltenNW_Mana, DIALOG_BACK, DIA_MiltenNW_Mana_BACK);
	Info_AddChoice		(DIA_MiltenNW_Mana, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))		,DIA_MiltenNW_Mana_1);
	Info_AddChoice		(DIA_MiltenNW_Mana, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_MiltenNW_Mana_5);
	
};
func void DIA_MiltenNW_Mana_BACK()
{
	if (other.attribute[ATR_MANA_MAX] >= T_MED)
	{
		AI_Output (self, other, "DIA_MiltenNW_Mana_03_00"); //Tvé magické síly jsou velké. Moc velké na to, abych ti je pomohl ještê zvýšit.
	};
	Info_ClearChoices (DIA_MiltenNW_Mana);
};
func void DIA_MiltenNW_Mana_1()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 1, T_MED);
	
	Info_ClearChoices   (DIA_MiltenNW_Mana);
	
	Info_AddChoice 		(DIA_MiltenNW_Mana, DIALOG_BACK, DIA_MiltenNW_Mana_BACK);
	Info_AddChoice		(DIA_MiltenNW_Mana, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))		,DIA_MiltenNW_Mana_1);
	Info_AddChoice		(DIA_MiltenNW_Mana, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_MiltenNW_Mana_5);
	
	
};
func void DIA_MiltenNW_Mana_5()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 5, T_MED);
	
	Info_ClearChoices   (DIA_MiltenNW_Mana);
	
	Info_AddChoice 		(DIA_MiltenNW_Mana, DIALOG_BACK, DIA_MiltenNW_Mana_BACK);
	Info_AddChoice		(DIA_MiltenNW_Mana, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))		,DIA_MiltenNW_Mana_1);
	Info_AddChoice		(DIA_MiltenNW_Mana, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_MiltenNW_Mana_5);
	
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Mage_NW_PICKPOCKET (C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 900;
	condition	= DIA_Mage_NW_PICKPOCKET_Condition;
	information	= DIA_Mage_NW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Mage_NW_PICKPOCKET_Condition()
{
	C_Beklauen (56, 75);
};
 
FUNC VOID DIA_Mage_NW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Mage_NW_PICKPOCKET);
	Info_AddChoice		(DIA_Mage_NW_PICKPOCKET, DIALOG_BACK 		,DIA_Mage_NW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Mage_NW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Mage_NW_PICKPOCKET_DoIt);
};

func void DIA_Mage_NW_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Mage_NW_PICKPOCKET);
};
	
func void DIA_Mage_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Mage_NW_PICKPOCKET);
};


