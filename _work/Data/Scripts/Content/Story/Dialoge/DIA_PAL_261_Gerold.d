// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Gerold_EXIT(C_INFO)
{
	npc			= PAL_261_Gerold;
	nr			= 999;
	condition	= DIA_Gerold_EXIT_Condition;
	information	= DIA_Gerold_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Gerold_EXIT_Condition()
{
	if (Kapitel < 4)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Gerold_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 	Wer sitzt im Kerker?
// ************************************************************
INSTANCE DIA_Gerold_Hallo (C_INFO)
{
	npc			= PAL_261_Gerold;
	nr			= 2;
	condition	= DIA_Gerold_Hallo_Condition;
	information	= DIA_Gerold_Hallo_Info;
	permanent	= FALSE;
	description = "Co to hlídáš?";
};                       
FUNC INT DIA_Gerold_Hallo_Condition()
{
	if (Kapitel == 2)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Gerold_Hallo_Info()
{	
	AI_Output	(other,self ,"DIA_Gerold_Hallo_15_00");//Co to hlídáš?
	AI_Output	(self ,other,"DIA_Gerold_Hallo_12_01");//Vìznì.
	AI_Output	(other,self ,"DIA_Gerold_Hallo_15_02");//A kdo to je?
	AI_Output	(self ,other,"DIA_Gerold_Hallo_12_03");//Pár trestancù a oldnéø jménem Gorn. Tuhı chlapík - je silnı jako bık.
	AI_Output	(self ,other,"DIA_Gerold_Hallo_12_04");//Potøebovali jsme ètyøi chlapy, abychom ho mohli dát pod zámek.
};	
// ************************************************************
// 	Kerker
// ************************************************************
INSTANCE DIA_Gerold_Jail (C_INFO)
{
	npc			= PAL_261_Gerold;
	nr			= 2;
	condition	= DIA_Gerold_Jail_Condition;
	information	= DIA_Gerold_Jail_Info;
	permanent	= FALSE;
	description ="Pustíš mì do vìzení?";
};                       
FUNC INT DIA_Gerold_Jail_Condition()
{
	if (Kapitel == 2)
	&& Npc_KnowsInfo (other, DIA_Gerold_Hallo)
	&&   (Garond_Kerkerauf == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Gerold_Jail_Info()
{	
	AI_Output	(other,self ,"DIA_Gerold_Jail_15_00");//Pustíš mì do vìzení?
	AI_Output	(self ,other,"DIA_Gerold_Jail_12_01");//Ne. NIKDO do vìzení nesmí. To platí pro KADÉHO. Pro tebe, pro Miltena a pro všechny ostatní.
	AI_Output	(self ,other,"DIA_Gerold_Jail_12_02");//Tohle není ádná hospoda, kam bys mohl vcházet a vycházet podle libosti. Pamatuj si to.
	
	KnowsAboutGorn = TRUE;  
};	
// ************************************************************
// 	Ausnahme
// ************************************************************
INSTANCE DIA_Gerold_Ausnahme (C_INFO)
{
	npc			= PAL_261_Gerold;
	nr			= 2;
	condition	= DIA_Gerold_Ausnahme_Condition;
	information	= DIA_Gerold_Ausnahme_Info;
	permanent	= FALSE;
	description ="Nemùeš pro mì udìlat vıjimku?";
};                       
FUNC INT DIA_Gerold_Ausnahme_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Gerold_Jail))
	&& (Kapitel == 2)
	&&   (Garond_Kerkerauf == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Gerold_Ausnahme_Info()
{	
	AI_Output	(other,self ,"DIA_Gerold_Ausnahme_15_00");//Nemùeš pro mì udìlat vıjimku?
	AI_Output	(self ,other,"DIA_Gerold_Ausnahme_12_01");//Ne.
};	
// ************************************************************
// 	Gold
// ************************************************************
INSTANCE DIA_Gerold_Gold (C_INFO)
{
	npc			= PAL_261_Gerold;
	nr			= 2;
	condition	= DIA_Gerold_Gold_Condition;
	information	= DIA_Gerold_Gold_Info;
	permanent	= FALSE;
	description ="A co kdy ti dobøe zaplatím?";
};                       
FUNC INT DIA_Gerold_Gold_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Gerold_Ausnahme))
	&& (Kapitel == 2)
	&&   (Garond_Kerkerauf == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Gerold_Gold_Info()
{	
	AI_Output	(other,self ,"DIA_Gerold_Gold_15_00");//A co kdy ti dobøe zaplatím?
	AI_Output	(self ,other,"DIA_Gerold_Gold_12_01");//... hm...
	AI_Output	(self ,other,"DIA_Gerold_Gold_12_02");//Ne.
};		
// ************************************************************
// 	Deal mit Gerold um Brief reinzuschmuggeln
// ************************************************************
INSTANCE DIA_Gerold_Deal (C_INFO)
{
	npc			= PAL_261_Gerold;
	nr			= 2;
	condition	= DIA_Gerold_Deal_Condition;
	information	= DIA_Gerold_Deal_Info;
	permanent	= FALSE;
	description ="Mám tu zprávu pro jednoho z vìzòù...";
};                       

FUNC INT DIA_Gerold_Deal_Condition()
{
	
	IF 	 (MIS_RescueGorn == LOG_RUNNING)
	&&	 (Npc_HasItems (other,ItWr_LetterForGorn_MIS) >=1)
	&& 	 (Kapitel == 2)
	&&   (Garond_Kerkerauf == FALSE)
	{
		return TRUE;
	};	
};
 
FUNC VOID DIA_Gerold_Deal_Info()
{	
	AI_Output	(other,self ,"DIA_Gerold_Deal_15_00");	//Mám tady vzkaz pro jednoho z vìzòù. Mùeš mu ho pøedat?
	AI_Output	(self ,other,"DIA_Gerold_Deal_12_01");	//Hm... v zásadì nevidím jedinı dùvod, proè ne. Pro koho je ten vzkaz?
	AI_Output	(other,self ,"DIA_Gerold_Deal_15_02");	//Pro Gorna.
	AI_Output	(self ,other,"DIA_Gerold_Deal_12_03");	//Velice dùleitı vìzeò. Nemyslím, e by s tím Garond souhlasil. Ale pokud to je pro tebe tak podstatné, jsem si jist, e se nìjak dohodneme.
	AI_Output	(other,self ,"DIA_Gerold_Deal_15_04");	//Co chceš?
	AI_Output	(self ,other,"DIA_Gerold_Deal_12_05");	//Naše pøídìly jídla se vıraznì sníily. Rád bych se pro zmìnu jednou poøádnì najedl.
	AI_Output	(self ,other,"DIA_Gerold_Deal_12_06");	//Pøines mi nìjakou slušnou klobásku a èerstvı krajíc chleba - a trochu sladkého medu.
	AI_Output	(self ,other,"DIA_Gerold_Deal_12_07");	//A k tomu ještì láhev vína... Jo, to by mìlo staèit. Urèitì se ti to podaøí. Vra se, a to budeš mít.
	
	B_LogEntry (TOPIC_RescueGorn,"Pokud Geroldovi pøinesu klobásu, chléb, víno a med, pøedá Gornovi zprávu.");
};	
// ************************************************************
// 	Deal Stuff
// ************************************************************		  				   
INSTANCE DIA_Gerold_Stuff (C_INFO)
{
	npc			= PAL_261_Gerold;
	nr			= 2;
	condition	= DIA_Gerold_Stuff_Condition;
	information	= DIA_Gerold_Stuff_Info;
	permanent	= TRUE;
	description = "Nìco tu pro tebe mám...";
};
//-----------------------------------                       
var int DIA_Gerold_Stuff_permanent;
//-----------------------------------
FUNC INT DIA_Gerold_Stuff_Condition()
{
	IF (Npc_HasItems (other,ItWr_LetterForGorn_MIS) >=1 )
	&&	Npc_KnowsInfo (other,DIA_Gerold_Deal)
	&& (Kapitel == 2)
	&& (DIA_Gerold_Stuff_permanent == FALSE)
	{
		return TRUE;
	};	
};
 
FUNC VOID DIA_Gerold_Stuff_Info()
{	
	AI_Output	(other,self ,"DIA_Gerold_Stuff_15_00");	//Nìco pro tebe mám. Jídlo, které jsi chtìl.
	
	
	//------------------HACK für deutliche Anzeige-------------------
	
	if (Npc_HasItems (other, ItFo_Honey) >= 1)
	&& (Npc_HasItems (other, ItFo_Bread) >= 1)
	&& (Npc_HasItems (other, ItFo_Wine) >= 1)
	&& (Npc_HasItems (other, ItFo_Sausage) >= 1)
	{
		 AI_PrintScreen ("Med odevzdán",	 -1, 34, FONT_ScreenSmall, 2);
		 AI_PrintScreen ("Chléb odevzdán",	 -1, 37, FONT_ScreenSmall, 2);
		 AI_PrintScreen ("Víno odevzdáno",     -1, 40, FONT_ScreenSmall, 2);
		 AI_PrintScreen ("Klobása odevzdána",  	 -1, 43, FONT_ScreenSmall, 2);
			
		Npc_RemoveInvItems (other, ItFo_Honey,1);
		Npc_RemoveInvItems (other, ItFo_Bread,1);
		Npc_RemoveInvItems (other, ItFo_Wine,1);
		Npc_RemoveInvItems (other, ItFo_Sausage,1);	
	/*
	if (B_GiveInvItems (other,self,ItFo_Honey  ,1)
	&&  B_GiveInvItems (other,self,ItFo_Bread  ,1)
	&&  B_GiveInvItems (other,self,ItFo_Wine   ,1)
	&&  B_GiveInvItems (other,self,ItFo_Sausage,1))
	{
	*/
	
		AI_Output	(self ,other,"DIA_Gerold_Stuff_12_01");	//Dobrá, dej mi ten dlabanec. Máš ten vzkaz?
		AI_Output   (other,self ,"DIA_Gerold_Stuff_15_02"); //Ano, tady. Nezapomeò, je to pro Gorna.
		AI_Output 	(self ,other,"DIA_Gerold_Stuff_12_03"); //Vra se zítra, tou dobou u bude ten vzkaz mít.
		
		B_GiveInvItems (other,self ,ItWr_LetterForGorn_MIS,1); 
		DayContactGorn = Wld_GetDay();
		DIA_Gerold_Stuff_permanent = TRUE;
		
		B_LogEntry (TOPIC_RescueGorn,"Gerold dostal, co chtìl, a teï pøedá zprávu pøíslušnému adresátovi.");
	}
	else 
	{
		AI_Output (self ,other,"DIA_Gerold_Stuff_12_04"); //Vra se, a budeš mít vìci, které jsem chtìl.
	};
};
// ************************************************************
// 	Deal Antwort
// ************************************************************		  	
INSTANCE DIA_Gerold_Antwort (C_INFO)
{
	npc			= PAL_261_Gerold;
	nr			= 2;
	condition	= DIA_Gerold_Antwort_Condition;
	information	= DIA_Gerold_Antwort_Info;
	permanent	= TRUE;
	description = "Dostal Gorn ten vzkaz?";
};                       
//-------------------------------------
var int DIA_Gerold_Antwort_permanent; 
//-------------------------------------
FUNC INT DIA_Gerold_Antwort_Condition()
{	
	if (DIA_Gerold_Stuff_permanent == TRUE)
	&& (Kapitel == 2)
	&& (DIA_Gerold_Antwort_permanent == FALSE)
	{
		return TRUE;	
	};
};
FUNC VOID DIA_Gerold_Antwort_Info()
{	
	AI_Output	(other,self ,"DIA_Gerold_Antwort_15_00");//Dostal Gorn ten vzkaz?
	
	if (DayContactGorn < Wld_GetDay() )
	{
		AI_Output	(self ,other,"DIA_Gerold_Antwort_12_01");//Ano, a mám ti od nìj vyøídit tohle:
		AI_Output	(other,self ,"DIA_Gerold_Antwort_15_02");//A?
		AI_Output	(self ,other,"DIA_Gerold_Antwort_12_03");//Je to u jiní brány.
		AI_Output	(other,self ,"DIA_Gerold_Antwort_15_04");//Øíkal ještì nìco?
		AI_Output	(self ,other,"DIA_Gerold_Antwort_12_05");//Ne. Netuším, co to mìlo znamenat. Ty to víš?
		AI_Output	(other,self ,"DIA_Gerold_Antwort_15_06");//Moná. Ale radši bys o tom nemìl moc pøemıšlet.
		AI_Output	(self ,other,"DIA_Gerold_Antwort_12_07");//Ano, to asi bude lepší.
		
		
		GornsTreasure = TRUE;	
		DIA_Gerold_Antwort_permanent = TRUE;
		B_LogEntry (TOPIC_RescueGorn,"Gorn tvrdí, e jeho zlato najdu u jiní brány.");
	}
	else
	{
		AI_Output	(self ,other,"DIA_Gerold_GornsAnswer_12_08");//Ne, ještì ne. Vra se pozdìji.
	};
	
	AI_StopProcessInfos (self);
};

// ************************************************************
// 	Offizielle Freilassung
// ************************************************************		  	
INSTANCE DIA_Gerold_SetGornFree (C_INFO)
{
	npc			= PAL_261_Gerold;
	nr			= 2;
	condition	= DIA_Gerold_SetGornFree_Condition;
	information	= DIA_Gerold_SetGornFree_Info;
	permanent	= FALSE;
	description = "Pus Gorna na svobodu.";
};                       

FUNC INT DIA_Gerold_SetGornFree_Condition()
{	
	if (Garond_Kerkerauf == TRUE)
	&& (Kapitel == 2)	
	{
		return TRUE;	
	};
};
 
FUNC VOID DIA_Gerold_SetGornFree_Info()
{	
	AI_Output	(other,self ,"DIA_Gerold_SetGornFree_15_00");//Propus Gorna na svobodu. Je to rozkaz od velitele Garonda.
	AI_Output	(self ,other,"DIA_Gerold_SetGornFree_12_01");//U o tom vím. Tady máš klíè, mùeš dovnitø.

	CreateInvItems (self, ItKe_PrisonKey_MIS,1);
	B_GiveInvItems	(self,other,ItKe_PrisonKey_MIS,1);
	B_LogEntry (TOPIC_RescueGorn,"Gerold mi svìøil klíè od vìznice.");
};
// ************************************************************
// 	Perm
// ************************************************************
INSTANCE DIA_Gerold_Perm (C_INFO)
{
	npc			= PAL_261_Gerold;
	nr			= 900;
	condition	= DIA_Gerold_Perm_Condition;
	information	= DIA_Gerold_Perm_Info;
	permanent	= TRUE;
	description = "To nikdy nespíš?";
};                       
FUNC INT DIA_Gerold_Perm_Condition()
{
	if (Kapitel < 4)
	&& Npc_KnowsInfo (other,DIA_Gerold_Gold)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Gerold_Perm_Info()
{	
	AI_Output	(other,self ,"DIA_Gerold_Perm_15_00");//To nikdy nespíš?
	AI_Output	(self ,other,"DIA_Gerold_Perm_12_01");//Ne. Innos sám mi dal sílu, abych nikdy nepotøeboval odpoèinek.
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

INSTANCE DIA_Gerold_KAP4_EXIT(C_INFO)
{
	npc			= PAL_261_Gerold;
	nr			= 999;
	condition	= DIA_Gerold_KAP4_EXIT_Condition;
	information	= DIA_Gerold_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Gerold_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Gerold_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};



///////////////////////////////////////////////////////////////////////
//	Info AllesRuhig
///////////////////////////////////////////////////////////////////////
instance DIA_Gerold_KAP4_ALLESRUHIG		(C_INFO)
{
	npc		 = 	PAL_261_Gerold;
	nr		 = 	30;
	condition	 = 	DIA_Gerold_KAP4_ALLESRUHIG_Condition;
	information	 = 	DIA_Gerold_KAP4_ALLESRUHIG_Info;

	description	 = 	"Všechno v poøádku?";
};

func int DIA_Gerold_KAP4_ALLESRUHIG_Condition ()
{
	if (Kapitel >= 4)	
	{
		return TRUE;
	};
};

func void DIA_Gerold_KAP4_ALLESRUHIG_Info ()
{
	AI_Output			(other, self, "DIA_Gerold_KAP4_ALLESRUHIG_15_00"); //Všechno v poøádku?
	AI_Output			(self, other, "DIA_Gerold_KAP4_ALLESRUHIG_12_01"); //V poøádku, jistì.
	AI_Output			(other, self, "DIA_Gerold_KAP4_ALLESRUHIG_15_02"); //Ale?
	AI_Output			(self, other, "DIA_Gerold_KAP4_ALLESRUHIG_12_03"); //Pupek mi drhne o páteø, chlape. Garond zase zmenšil pøídìly jídla.
	AI_Output			(self, other, "DIA_Gerold_KAP4_ALLESRUHIG_12_04"); //Jestli nedostanu do chøtánu nìjakı slušnı dlabanec, zahryznu se do té Garondovy tlusté... zadku.

	Info_ClearChoices	(DIA_Gerold_KAP4_ALLESRUHIG);
	Info_AddChoice	(DIA_Gerold_KAP4_ALLESRUHIG, "To není mùj problém.", DIA_Gerold_KAP4_ALLESRUHIG_Nein );
	Info_AddChoice	(DIA_Gerold_KAP4_ALLESRUHIG, "Moná bych ti mohl nìco dát.", DIA_Gerold_KAP4_ALLESRUHIG_geben );
};
func void DIA_Gerold_KAP4_ALLESRUHIG_geben ()
{
	AI_Output			(other, self, "DIA_Gerold_KAP4_ALLESRUHIG_geben_15_00"); //Moná bych ti mohl nìco dát.
	AI_Output			(self, other, "DIA_Gerold_KAP4_ALLESRUHIG_geben_12_01"); //Zbláznil ses? Tady v ádném pøípadì. Kdyby to vidìli ostatní, budu mít hned tunu novıch pøátel, jestli chápeš, co tím chci øíct.
	if 	(Wld_IsTime	(23,10,08,00) == FALSE)
	{
		AI_Output			(self, other, "DIA_Gerold_KAP4_ALLESRUHIG_geben_12_02"); //A pùjdou všichni spát, najdeš mì v mágovì svatyni.
	}
	else
	{
		AI_Output			(self, other, "DIA_Gerold_KAP4_ALLESRUHIG_geben_12_03"); //Rychle, pojï za mnou do mágovy svatynì, ne se ostatní vyhrabou. Nechce se mi èekat do zítøka.
	};
	AI_Output			(self, other, "DIA_Gerold_KAP4_ALLESRUHIG_geben_12_04"); //V tuhle dobu tam stejnì nikdo nebıvá. Poèkám tam na tebe.
	AI_Output			(self, other, "DIA_Gerold_KAP4_ALLESRUHIG_geben_12_05"); //Ale neukazuj se tam se suchım chlebem a syrovou flaksou masa, jasnı?

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Jídlo"); 

 	Log_CreateTopic (TOPIC_GeroldGiveFood, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GeroldGiveFood, LOG_RUNNING);
	B_LogEntry (TOPIC_GeroldGiveFood,"Garond opìt omezil pøídìly potravin. Radši bych mìl Geroldovi dát nìco k jídlu, nebo z hladu vyvede nìjakou hroznou pitomost. Mám se s ním setkat u pøíbytku mágù na hradì, a budou všichni spát."); 

	MIS_GeroldGiveFood = LOG_RUNNING;
};

func void DIA_Gerold_KAP4_ALLESRUHIG_Nein ()
{
	AI_Output			(other, self, "DIA_Gerold_KAP4_ALLESRUHIG_Nein_15_00"); //To není mùj problém.
	AI_Output			(self, other, "DIA_Gerold_KAP4_ALLESRUHIG_Nein_12_01"); //Mùeš mluvit. Tobì Garond urèitì pøídìl nesníí.
	AI_Output			(self, other, "DIA_Gerold_KAP4_ALLESRUHIG_Nein_12_02"); //I kdy by to neuznal, má strachy staenı zadek a v tobì vidí jedinou spásu.

	AI_StopProcessInfos (self);
};

var int Gerold_FoodCounter;
///////////////////////////////////////////////////////////////////////
//	Info Food
///////////////////////////////////////////////////////////////////////
instance DIA_Gerold_FOOD		(C_INFO)
{
	npc		 = 	PAL_261_Gerold;
	nr		 = 	31;
	condition	 = 	DIA_Gerold_FOOD_Condition;
	information	 = 	DIA_Gerold_FOOD_Info;
	important	 = 	TRUE;
};

func int DIA_Gerold_FOOD_Condition ()
{
	if (Npc_GetDistToWP(self,"OC_MAGE_IN")<500) 
		&& (Kapitel >= 4)
		{
				return TRUE;
		};
};

func void DIA_Gerold_MoreFood ()
{
	Info_ClearChoices	(DIA_Gerold_FOOD);

	if (Gerold_FoodCounter > 8)
	{
		AI_Output			(self, other, "DIA_Gerold_MoreFood_12_00"); //To staèí. To staèí. S tím na chvíli vystaèím.
		AI_Output			(self, other, "DIA_Gerold_MoreFood_12_01"); //Tady máš peníze. Tady si za nì stejnì nic nekoupím, take si je klidnì vezmi.
		AI_Output			(self, other, "DIA_Gerold_MoreFood_12_02"); //U bych asi mìl jít, ne si nás nìkdo všimne.
		AI_StopProcessInfos (self);
		Npc_ExchangeRoutine	(self,"Zaèít");
		MIS_GeroldGiveFood = LOG_SUCCESS;
		B_GivePlayerXP (XP_GeroldGiveFood);	
		CreateInvItems 		(self, ItMi_Gold, 450);									
		B_GiveInvItems 		(self, other, ItMi_Gold, 450);					
	}
	else
	{
		if (Gerold_FoodCounter == 0)
			{
				Info_AddChoice	(DIA_Gerold_FOOD, "Teï momentálnì nic nemám.", DIA_Gerold_FOOD_nichts );
			}
		else
			{
				Info_AddChoice	(DIA_Gerold_FOOD, "To je všechno, co mám.", DIA_Gerold_FOOD_kaese_nichtmehr );
				if (Gerold_FoodCounter < 5)
				{
					AI_Output			(self, other, "DIA_Gerold_MoreFood_12_03"); //Jasan. Dej to sem. Máš ještì další?
				}
				else
				{
					AI_Output			(self, other, "DIA_Gerold_MoreFood_12_04"); //Jo. Víc, víc!
				};
			};
			
		if Npc_HasItems (other,ItFo_FishSoup)
				|| Npc_HasItems (other,ItFo_Stew)
			{
			Info_AddChoice	(DIA_Gerold_FOOD, "(Dát mu polévku.)", DIA_Gerold_FOOD_Suppe );
			};
		if Npc_HasItems (other,ItFoMutton)
			{
			Info_AddChoice	(DIA_Gerold_FOOD, "(Dát mu maso.)", DIA_Gerold_FOOD_fleisch );
			};
		if Npc_HasItems (other,ItFo_Bacon)
			{
			Info_AddChoice	(DIA_Gerold_FOOD, "(Dát mu šunku.)", DIA_Gerold_FOOD_schinken );
			};
		if Npc_HasItems (other,ItFo_Cheese)
			{
			Info_AddChoice	(DIA_Gerold_FOOD, "(Dát mu sır.)", DIA_Gerold_FOOD_kaese );
			};
		if Npc_HasItems (other,ItFo_Sausage)
			{
			Info_AddChoice	(DIA_Gerold_FOOD, "(Dát mu klobásu.)", DIA_Gerold_FOOD_Wurst );
			};
			Gerold_FoodCounter = (Gerold_FoodCounter +1);
	};
};

func void DIA_Gerold_FOOD_Info ()
{
	AI_Output			(self, other, "DIA_Gerold_FOOD_12_00"); //Tady máš. Take co? Máš pro mì nìco k jídlu?

	DIA_Gerold_MoreFood ();
};

func void DIA_Gerold_FOOD_nichts ()
{
	AI_Output			(other, self, "DIA_Gerold_FOOD_nichts_15_00"); //Teï momentálnì nic nemám.
	AI_Output			(self, other, "DIA_Gerold_FOOD_nichts_12_01"); //Nejdøív kolem toho dìláš takovı humbuk a nakonec mì chceš podvést?
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
	Npc_ExchangeRoutine	(self,"Zaèít"); 
	MIS_GeroldGiveFood = LOG_FAILED;
	B_GivePlayerXP (XP_Ambient);
};


func void DIA_Gerold_FOOD_kaese_nichtmehr ()
{
	AI_Output			(other, self, "DIA_Gerold_FOOD_kaese_nichtmehr_15_00"); //To je všechno, co mám.
	AI_Output			(self, other, "DIA_Gerold_FOOD_kaese_nichtmehr_12_01"); //A tomu mám vìøit? No dobrá, lepší nìco ne nic. Tady máš pár zlaákù.
	CreateInvItems 		(self, ItMi_Gold, 50);									
	B_GiveInvItems 		(self, other, ItMi_Gold, 50);					
	AI_Output			(self, other, "DIA_Gerold_FOOD_kaese_nichtmehr_12_02"); //No. Mìl bych se vrátit na svoje místo.
	AI_StopProcessInfos (self);
	
	var int XP_GeroldGiveFoodLow;
	var int Teiler;
	
	if (Gerold_FoodCounter < 4)
		{
			Teiler = 3;
		}
	else
		{
			Teiler = 2;
		};
	
	XP_GeroldGiveFoodLow = (XP_GeroldGiveFood/Teiler);
	
	Npc_ExchangeRoutine	(self,"Zaèít");
	MIS_GeroldGiveFood = LOG_OBSOLETE;
	B_GivePlayerXP (XP_GeroldGiveFoodLow);	
};

func void DIA_Gerold_FOOD_kaese ()
{
	AI_Output			(other, self, "DIA_Gerold_FOOD_kaese_15_00"); //Co takhle pìknı špalík sıra?
	B_GiveInvItems (other,self , ItFo_Cheese, 1);	
	DIA_Gerold_MoreFood ();
};

func void DIA_Gerold_FOOD_Wurst ()
{
	AI_Output			(other, self, "DIA_Gerold_FOOD_Wurst_15_00"); //Kus klobásy?
	B_GiveInvItems (other,self , ItFo_Sausage, 1);	
	DIA_Gerold_MoreFood ();
};

func void DIA_Gerold_FOOD_schinken ()
{
	AI_Output			(other, self, "DIA_Gerold_FOOD_schinken_15_00"); //Mùu ti dát tuhle šunku.
	B_GiveInvItems (other,self , ItFo_Bacon, 1);	
	DIA_Gerold_MoreFood ();
};

func void DIA_Gerold_FOOD_fleisch ()
{
	AI_Output			(other, self, "DIA_Gerold_FOOD_fleisch_15_00"); //Flák masa?
	B_GiveInvItems (other,self , ItFoMutton, 1);	
	DIA_Gerold_MoreFood ();
};

func void DIA_Gerold_FOOD_Suppe ()
{
	AI_Output			(other, self, "DIA_Gerold_FOOD_Suppe_15_00"); //Dobrá polévka by se šikla, ne?

	if (B_GiveInvItems (other, self, ItFo_FishSoup,1))
		{
		}
		else
		{
			B_GiveInvItems (other,self , ItFo_Stew, 1);
		};
	DIA_Gerold_MoreFood ();
};

///////////////////////////////////////////////////////////////////////
//	Info perm4
///////////////////////////////////////////////////////////////////////
instance DIA_Gerold_PERM4		(C_INFO)
{
	npc		 = 	PAL_261_Gerold;
	nr		 = 	41;
	condition	 = 	DIA_Gerold_PERM4_Condition;
	information	 = 	DIA_Gerold_PERM4_Info;
	permanent	 = 	TRUE;

	description	 = 	"Ještì máš hlad?";
};

func int DIA_Gerold_PERM4_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Gerold_KAP4_ALLESRUHIG))
		{
				return TRUE;
		};
};

func void DIA_Gerold_PERM4_Info ()
{
	AI_Output			(other, self, "DIA_Gerold_PERM4_15_00"); //Ještì máš hlad?
	
	if (MIS_OCGateOpen == TRUE)
	{
	AI_Output			(self, other, "DIA_Gerold_PERM4_12_01"); //Pokud skøeti znovu zaútoèí, nepomùe mi ani plné bøicho.
	}
	else if (MIS_GeroldGiveFood == LOG_SUCCESS)
	{
	AI_Output			(self, other, "DIA_Gerold_PERM4_12_02"); //To si dìláš srandu. U jsem plnı. Ještì jednou dìkuju.
	}
	else if (MIS_GeroldGiveFood == LOG_OBSOLETE)
	{
	AI_Output			(self, other, "DIA_Gerold_PERM4_12_03"); //Hm. Ale i tak ti dìkuju.
	}
	else
	{
		if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Gerold_PERM4_12_04"); //Je to v poøádku, mistøe.
		}
		else
		{
			AI_Output			(self, other, "DIA_Gerold_PERM4_12_05"); //Zmiz!
		};
	};
	AI_StopProcessInfos (self);
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

INSTANCE DIA_Gerold_KAP5_EXIT(C_INFO)
{
	npc			= PAL_261_Gerold;
	nr			= 999;
	condition	= DIA_Gerold_KAP5_EXIT_Condition;
	information	= DIA_Gerold_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Gerold_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Gerold_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
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


INSTANCE DIA_Gerold_KAP6_EXIT(C_INFO)
{
	npc			= PAL_261_Gerold;
	nr			= 999;
	condition	= DIA_Gerold_KAP6_EXIT_Condition;
	information	= DIA_Gerold_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Gerold_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Gerold_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Gerold_PICKPOCKET (C_INFO)
{
	npc			= PAL_261_Gerold;
	nr			= 900;
	condition	= DIA_Gerold_PICKPOCKET_Condition;
	information	= DIA_Gerold_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Gerold_PICKPOCKET_Condition()
{
	C_Beklauen (71, 170);
};
 
FUNC VOID DIA_Gerold_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Gerold_PICKPOCKET);
	Info_AddChoice		(DIA_Gerold_PICKPOCKET, DIALOG_BACK 		,DIA_Gerold_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Gerold_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Gerold_PICKPOCKET_DoIt);
};

func void DIA_Gerold_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Gerold_PICKPOCKET);
};
	
func void DIA_Gerold_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Gerold_PICKPOCKET);
};















































