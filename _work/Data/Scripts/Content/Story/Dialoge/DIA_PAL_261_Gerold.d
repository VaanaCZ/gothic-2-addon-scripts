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
	description = "Kogo pilnujesz?";
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
	AI_Output	(other,self ,"DIA_Gerold_Hallo_15_00");//Kogo pilnujesz?
	AI_Output	(self ,other,"DIA_Gerold_Hallo_12_01");//Więźniów.
	AI_Output	(other,self ,"DIA_Gerold_Hallo_15_02");//A kogo dokładniej?
	AI_Output	(self ,other,"DIA_Gerold_Hallo_12_03");//Kilku skazańców i najemnika Gorna. To twardziel - silny niczym wół.
	AI_Output	(self ,other,"DIA_Gerold_Hallo_12_04");//Ledwo obezwładniło go czterech mężczyzn.
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
	description ="Czy możesz mnie wpuścić do lochu?";
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
	AI_Output	(other,self ,"DIA_Gerold_Jail_15_00");//Czy możesz mnie wpuścić do lochu?
	AI_Output	(self ,other,"DIA_Gerold_Jail_12_01");//Nie. NIKT nie wejdzie do lochu. Dotyczy to KAŻDEGO: ciebie, Miltena i całej reszty.
	AI_Output	(self ,other,"DIA_Gerold_Jail_12_02");//To nie jest knajpa, gdzie można wchodzić i wychodzić, kiedy ci się tylko spodoba. Zapamiętaj to sobie.
	
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
	description ="Nie zrobisz dla mnie wyjątku?";
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
	AI_Output	(other,self ,"DIA_Gerold_Ausnahme_15_00");//Nie zrobisz dla mnie wyjątku?
	AI_Output	(self ,other,"DIA_Gerold_Ausnahme_12_01");//Nie.
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
	description ="A jeśli ci zapłacę?";
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
	AI_Output	(other,self ,"DIA_Gerold_Gold_15_00");//A jeśli ci zapłacę?
	AI_Output	(self ,other,"DIA_Gerold_Gold_12_01");//...hm...
	AI_Output	(self ,other,"DIA_Gerold_Gold_12_02");//Nie.
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
	description ="Mam tu list dla jednego z więźniów.";
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
	AI_Output	(other,self ,"DIA_Gerold_Deal_15_00");	//Mam tu list dla jednego z więźniów. Mógłbyś go przekazać?
	AI_Output	(self ,other,"DIA_Gerold_Deal_12_01");	//Hm... w zasadzie nie widzę żadnych przeciwwskazań. Dla kogo jest ta wiadomość?
	AI_Output	(other,self ,"DIA_Gerold_Deal_15_02");	//Dla Gorna.
	AI_Output	(self ,other,"DIA_Gerold_Deal_12_03");	//To bardzo ważny więzień. Nie sądzę, żeby Garond się na to zgodził. Ale jeśli to dla ciebie takie ważne, chyba dojdziemy jakoś do porozumienia.
	AI_Output	(other,self ,"DIA_Gerold_Deal_15_04");	//Czego chcesz?
	AI_Output	(self ,other,"DIA_Gerold_Deal_12_05");	//Nasze racje żywnościowe stają się coraz mniejsze. Chciałbym dla odmiany najeść się do syta.
	AI_Output	(self ,other,"DIA_Gerold_Deal_12_06");	//Mam ochotę na smaczną kiełbasę i bochenek świeżego chleba. I trochę miodu.
	AI_Output	(self ,other,"DIA_Gerold_Deal_12_07");	//I butelkę wina... Tak, to wystarczy. Nie powinieneś mieć problemów ze zdobyciem tych artykułów. Wróć, kiedy będziesz już miał jedzenie.
	
	B_LogEntry (TOPIC_RescueGorn,"Jeśli przyniosę Geroldowi kiełbasę, chleb, wino i miód, przekaże Gornowi wiadomość.");
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
	description = "Mam coś dla ciebie...";
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
	AI_Output	(other,self ,"DIA_Gerold_Stuff_15_00");	//Mam coś dla ciebie. Oto jedzenie.
	
	
	//------------------HACK für deutliche Anzeige-------------------
	
	if (Npc_HasItems (other, ItFo_Honey) >= 1)
	&& (Npc_HasItems (other, ItFo_Bread) >= 1)
	&& (Npc_HasItems (other, ItFo_Wine) >= 1)
	&& (Npc_HasItems (other, ItFo_Sausage) >= 1)
	{
		 AI_PrintScreen ("Oddałeś miód",	 -1, 34, FONT_ScreenSmall, 2);
		 AI_PrintScreen ("Oddałeś chleb",	 -1, 37, FONT_ScreenSmall, 2);
		 AI_PrintScreen ("Oddałeś wino",     -1, 40, FONT_ScreenSmall, 2);
		 AI_PrintScreen ("Oddałeś kiełbasę",  	 -1, 43, FONT_ScreenSmall, 2);
			
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
	
		AI_Output	(self ,other,"DIA_Gerold_Stuff_12_01");	//Dobrze, dawaj żarcie. Masz tę wiadomość?
		AI_Output   (other,self ,"DIA_Gerold_Stuff_15_02"); //Tak, proszę. Pamiętaj, to dla Gorna.
		AI_Output 	(self ,other,"DIA_Gerold_Stuff_12_03"); //Wróć jutro, do tej pory odbierze już twój list.
		
		B_GiveInvItems (other,self ,ItWr_LetterForGorn_MIS,1); 
		DayContactGorn = Wld_GetDay();
		DIA_Gerold_Stuff_permanent = TRUE;
		
		B_LogEntry (TOPIC_RescueGorn,"Gerold dostał wszystko, czego sobie zażyczył, i obiecał przekazać wiadomość.");
	}
	else 
	{
		AI_Output (self ,other,"DIA_Gerold_Stuff_12_04"); //Wróć, kiedy zdobędziesz jedzenie.
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
	description = "Czy Gorn dostał wiadomość?";
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
	AI_Output	(other,self ,"DIA_Gerold_Antwort_15_00");//Czy Gorn dostał wiadomość?
	
	if (DayContactGorn < Wld_GetDay() )
	{
		AI_Output	(self ,other,"DIA_Gerold_Antwort_12_01");//Tak, mam ci przekazać jego odpowiedź.
		AI_Output	(other,self ,"DIA_Gerold_Antwort_15_02");//Jak ona brzmi?
		AI_Output	(self ,other,"DIA_Gerold_Antwort_12_03");//Przy południowej bramie.
		AI_Output	(other,self ,"DIA_Gerold_Antwort_15_04");//Czy powiedział coś jeszcze?
		AI_Output	(self ,other,"DIA_Gerold_Antwort_12_05");//Nie. Nie mam pojęcia, co to znaczy. A ty?
		AI_Output	(other,self ,"DIA_Gerold_Antwort_15_06");//Być może. Nie zastanawiaj się nad tym.
		AI_Output	(self ,other,"DIA_Gerold_Antwort_12_07");//Tak, może tak będzie lepiej.
		
		
		GornsTreasure = TRUE;	
		DIA_Gerold_Antwort_permanent = TRUE;
		B_LogEntry (TOPIC_RescueGorn,"Gorn twierdzi, że ukrył swoje złoto przy południowej bramie.");
	}
	else
	{
		AI_Output	(self ,other,"DIA_Gerold_GornsAnswer_12_08");//Nie, jeszcze nie. Wróć później.
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
	description = "Uwolnij Gorna.";
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
	AI_Output	(other,self ,"DIA_Gerold_SetGornFree_15_00");//Uwolnij Gorna. To rozkaz kapitana Garonda.
	AI_Output	(self ,other,"DIA_Gerold_SetGornFree_12_01");//Już przekazano mi taką wiadomość. Proszę, oto klucz. Możesz wejść do środka.

	CreateInvItems (self, ItKe_PrisonKey_MIS,1);
	B_GiveInvItems	(self,other,ItKe_PrisonKey_MIS,1);
	B_LogEntry (TOPIC_RescueGorn,"Gerold dał mi klucz do więzienia.");
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
	description = "Czy ty nigdy nie sypiasz?";
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
	AI_Output	(other,self ,"DIA_Gerold_Perm_15_00");//Czy ty nigdy nie sypiasz?
	AI_Output	(self ,other,"DIA_Gerold_Perm_12_01");//Nie. Dzięki łasce Innosa nie potrzebuję snu.
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

	description	 = 	"Wszystko w porządku?";
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
	AI_Output			(other, self, "DIA_Gerold_KAP4_ALLESRUHIG_15_00"); //Wszystko w porządku?
	AI_Output			(self, other, "DIA_Gerold_KAP4_ALLESRUHIG_12_01"); //Tak, w porządku...
	AI_Output			(other, self, "DIA_Gerold_KAP4_ALLESRUHIG_15_02"); //Ale?
	AI_Output			(self, other, "DIA_Gerold_KAP4_ALLESRUHIG_12_03"); //Kiszki grają mi marsza. Garond znowu kazał zmniejszyć racje żywnościowe.
	AI_Output			(self, other, "DIA_Gerold_KAP4_ALLESRUHIG_12_04"); //Jeśli szybko nie dostanę czegoś porządnego do zjedzenia, chyba odgryzę Garondowi jego tłustą dupę.

	Info_ClearChoices	(DIA_Gerold_KAP4_ALLESRUHIG);
	Info_AddChoice	(DIA_Gerold_KAP4_ALLESRUHIG, "To nie mój problem.", DIA_Gerold_KAP4_ALLESRUHIG_Nein );
	Info_AddChoice	(DIA_Gerold_KAP4_ALLESRUHIG, "Może coś ci przyniosę.", DIA_Gerold_KAP4_ALLESRUHIG_geben );
};
func void DIA_Gerold_KAP4_ALLESRUHIG_geben ()
{
	AI_Output			(other, self, "DIA_Gerold_KAP4_ALLESRUHIG_geben_15_00"); //Może coś ci przyniosę.
	AI_Output			(self, other, "DIA_Gerold_KAP4_ALLESRUHIG_geben_12_01"); //Oszalałeś? Na pewno nie tutaj. Jeśli ktoś zauważy, że mam jedzenie, zaraz otoczą mnie dziesiątki nowych przyjaciół, jeśli wiesz, co mam na myśli.
	if 	(Wld_IsTime	(23,10,08,00) == FALSE)
	{
		AI_Output			(self, other, "DIA_Gerold_KAP4_ALLESRUHIG_geben_12_02"); //Znajdziesz mnie w świątyni maga, kiedy nikogo już tam nie będzie.
	}
	else
	{
		AI_Output			(self, other, "DIA_Gerold_KAP4_ALLESRUHIG_geben_12_03"); //Szybko, chodź ze mną do świątyni maga, zanim reszta wypełznie ze swoich dziur. Nie chcę czekać do jutra.
	};
	AI_Output			(self, other, "DIA_Gerold_KAP4_ALLESRUHIG_geben_12_04"); //O tej porze w świątyni prawie nikogo nie ma. Zaczekam tam na ciebie.
	AI_Output			(self, other, "DIA_Gerold_KAP4_ALLESRUHIG_geben_12_05"); //Tylko nie przynieś mi suchego chleba albo jakiegoś ochłapu, jasne?

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Food"); 

 	Log_CreateTopic (TOPIC_GeroldGiveFood, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GeroldGiveFood, LOG_RUNNING);
	B_LogEntry (TOPIC_GeroldGiveFood,"Garond znowu zmniejszył racje żywnościowe. Lepiej znajdę Geroldowi coś do jedzenia, zanim głód popchnie go do jakiegoś głupiego czynu. Mam się z nim spotkać w siedzibie magów na zamku, kiedy wszyscy będą spać."); 

	MIS_GeroldGiveFood = LOG_RUNNING;
};

func void DIA_Gerold_KAP4_ALLESRUHIG_Nein ()
{
	AI_Output			(other, self, "DIA_Gerold_KAP4_ALLESRUHIG_Nein_15_00"); //To nie mój problem.
	AI_Output			(self, other, "DIA_Gerold_KAP4_ALLESRUHIG_Nein_12_01"); //Pewnie... Garond nie obetnie wam racji żywnościowych.
	AI_Output			(self, other, "DIA_Gerold_KAP4_ALLESRUHIG_Nein_12_02"); //Chociaż nie chce się do tego przyznać, jest śmiertelnie wystraszony, a wy jesteście jego jedyną szansą.

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
		AI_Output			(self, other, "DIA_Gerold_MoreFood_12_00"); //Dość, dość. To wystarczy na jakiś czas.
		AI_Output			(self, other, "DIA_Gerold_MoreFood_12_01"); //Proszę, weź moje złoto. I tak mi się tutaj do niczego nie przyda.
		AI_Output			(self, other, "DIA_Gerold_MoreFood_12_02"); //Lepiej już pójdę, zanim ktoś nas zobaczy.
		AI_StopProcessInfos (self);
		Npc_ExchangeRoutine	(self,"Start");
		MIS_GeroldGiveFood = LOG_SUCCESS;
		B_GivePlayerXP (XP_GeroldGiveFood);	
		CreateInvItems 		(self, ItMi_Gold, 450);									
		B_GiveInvItems 		(self, other, ItMi_Gold, 450);					
	}
	else
	{
		if (Gerold_FoodCounter == 0)
			{
				Info_AddChoice	(DIA_Gerold_FOOD, "Nie mam akurat nic przy sobie.", DIA_Gerold_FOOD_nichts );
			}
		else
			{
				Info_AddChoice	(DIA_Gerold_FOOD, "To wszystko, co mam.", DIA_Gerold_FOOD_kaese_nichtmehr );
				if (Gerold_FoodCounter < 5)
				{
					AI_Output			(self, other, "DIA_Gerold_MoreFood_12_03"); //Pewnie. Daj to tutaj. Masz coś jeszcze?
				}
				else
				{
					AI_Output			(self, other, "DIA_Gerold_MoreFood_12_04"); //Tak! Jeszcze, jeszcze!
				};
			};
			
		if Npc_HasItems (other,ItFo_FishSoup)
				|| Npc_HasItems (other,ItFo_Stew)
			{
			Info_AddChoice	(DIA_Gerold_FOOD, "(Oddaj zupę)", DIA_Gerold_FOOD_Suppe );
			};
		if Npc_HasItems (other,ItFoMutton)
			{
			Info_AddChoice	(DIA_Gerold_FOOD, "(Oddaj mięso)", DIA_Gerold_FOOD_fleisch );
			};
		if Npc_HasItems (other,ItFo_Bacon)
			{
			Info_AddChoice	(DIA_Gerold_FOOD, "(Oddaj szynkę)", DIA_Gerold_FOOD_schinken );
			};
		if Npc_HasItems (other,ItFo_Cheese)
			{
			Info_AddChoice	(DIA_Gerold_FOOD, "(Oddaj ser)", DIA_Gerold_FOOD_kaese );
			};
		if Npc_HasItems (other,ItFo_Sausage)
			{
			Info_AddChoice	(DIA_Gerold_FOOD, "(Oddaj kiełbasę)", DIA_Gerold_FOOD_Wurst );
			};
			Gerold_FoodCounter = (Gerold_FoodCounter +1);
	};
};

func void DIA_Gerold_FOOD_Info ()
{
	AI_Output			(self, other, "DIA_Gerold_FOOD_12_00"); //Jesteś! A więc - o co chodzi? Przyniosłeś mi coś do jedzenia?

	DIA_Gerold_MoreFood ();
};

func void DIA_Gerold_FOOD_nichts ()
{
	AI_Output			(other, self, "DIA_Gerold_FOOD_nichts_15_00"); //Nie mam akurat nic przy sobie.
	AI_Output			(self, other, "DIA_Gerold_FOOD_nichts_12_01"); //Najpierw robisz wokół tego takie zamieszanie, a teraz chcesz mnie wykiwać?
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
	Npc_ExchangeRoutine	(self,"Start"); 
	MIS_GeroldGiveFood = LOG_FAILED;
	B_GivePlayerXP (XP_Ambient);
};


func void DIA_Gerold_FOOD_kaese_nichtmehr ()
{
	AI_Output			(other, self, "DIA_Gerold_FOOD_kaese_nichtmehr_15_00"); //To wszystko, co mam.
	AI_Output			(self, other, "DIA_Gerold_FOOD_kaese_nichtmehr_12_01"); //I ja mam w to uwierzyć? Dobrze, lepsze to niż nic. Proszę, weź to złoto.
	CreateInvItems 		(self, ItMi_Gold, 50);									
	B_GiveInvItems 		(self, other, ItMi_Gold, 50);					
	AI_Output			(self, other, "DIA_Gerold_FOOD_kaese_nichtmehr_12_02"); //Muszę wrócić na posterunek.
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
	
	Npc_ExchangeRoutine	(self,"Start");
	MIS_GeroldGiveFood = LOG_OBSOLETE;
	B_GivePlayerXP (XP_GeroldGiveFoodLow);	
};

func void DIA_Gerold_FOOD_kaese ()
{
	AI_Output			(other, self, "DIA_Gerold_FOOD_kaese_15_00"); //A co powiesz na kawał soczystego sera?
	B_GiveInvItems (other,self , ItFo_Cheese, 1);	
	DIA_Gerold_MoreFood ();
};

func void DIA_Gerold_FOOD_Wurst ()
{
	AI_Output			(other, self, "DIA_Gerold_FOOD_Wurst_15_00"); //Kawałek kiełbasy?
	B_GiveInvItems (other,self , ItFo_Sausage, 1);	
	DIA_Gerold_MoreFood ();
};

func void DIA_Gerold_FOOD_schinken ()
{
	AI_Output			(other, self, "DIA_Gerold_FOOD_schinken_15_00"); //Mógłbym ci dać tę szynkę.
	B_GiveInvItems (other,self , ItFo_Bacon, 1);	
	DIA_Gerold_MoreFood ();
};

func void DIA_Gerold_FOOD_fleisch ()
{
	AI_Output			(other, self, "DIA_Gerold_FOOD_fleisch_15_00"); //Kawałek mięsa?
	B_GiveInvItems (other,self , ItFoMutton, 1);	
	DIA_Gerold_MoreFood ();
};

func void DIA_Gerold_FOOD_Suppe ()
{
	AI_Output			(other, self, "DIA_Gerold_FOOD_Suppe_15_00"); //Zjadłbyś trochę dobrej zupy, prawda?

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

	description	 = 	"Wciąż głodny?";
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
	AI_Output			(other, self, "DIA_Gerold_PERM4_15_00"); //Wciąż głodny?
	
	if (MIS_OCGateOpen == TRUE)
	{
	AI_Output			(self, other, "DIA_Gerold_PERM4_12_01"); //Jeśli orkowie znowu zaatakują, nawet pełen brzuch mi nie pomoże.
	}
	else if (MIS_GeroldGiveFood == LOG_SUCCESS)
	{
	AI_Output			(self, other, "DIA_Gerold_PERM4_12_02"); //Chyba żartujesz. Nic już nie przełknę. Dziękuję jeszcze raz.
	}
	else if (MIS_GeroldGiveFood == LOG_OBSOLETE)
	{
	AI_Output			(self, other, "DIA_Gerold_PERM4_12_03"); //Tak. Ale dziękuję za pomoc.
	}
	else
	{
		if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Gerold_PERM4_12_04"); //W porządku, Mistrzu.
		}
		else
		{
			AI_Output			(self, other, "DIA_Gerold_PERM4_12_05"); //Spadaj stąd!
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















































