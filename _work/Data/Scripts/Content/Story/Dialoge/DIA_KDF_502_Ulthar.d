///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ulthar_EXIT   (C_INFO)
{
	npc         = KDF_502_Ulthar;
	nr          = 999;
	condition   = DIA_Ulthar_EXIT_Condition;
	information = DIA_Ulthar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Ulthar_EXIT_Condition()
{
	if (Kapitel < 3)
	{
	
		return TRUE;
	};
};
FUNC VOID DIA_Ulthar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_GREET		(C_INFO)
{
	npc			 = 	KDF_502_Ulthar;
	nr			 = 	2;
	condition	 = 	DIA_Ulthar_GREET_Condition;
	information	 = 	DIA_Ulthar_GREET_Info;
	permanent	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Ulthar_GREET_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&&(!Npc_KnowsInfo (hero,DIA_Pyrokar_FIRE))
	&& (hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Ulthar_GREET_Info ()
{
	AI_Output (self, other, "DIA_Ulthar_GREET_05_00"); //Spójrzcie, kolejny nowicjusz staje przed Najwy¿sz¹ Rad¹. Niech Innos bêdzie z tob¹, synu.
	AI_Output (other, self, "DIA_Ulthar_GREET_15_01"); //Czym dok³adnie zajmuje siê Najwy¿sza Rada?
	AI_Output (self, other, "DIA_Ulthar_GREET_05_02"); //Naszym zadaniem jest g³oszenie woli Innosa. Dlatego w³aœnie wyznaczamy wybrañców, którzy zostan¹ poddani Próbie Magii.
	AI_Output (self, other, "DIA_Ulthar_GREET_05_03"); //Choæ ¿yjemy w odosobnieniu, nasze oczy spogl¹daj¹ na œwiat i jego problemy. Koœció³ Innosa jest najwy¿sz¹ instancj¹ ziemskiego prawa.
	AI_Output (other, self, "DIA_Ulthar_GREET_15_04"); //Ach, wiêc interesuje was to, co siê dzieje na œwiecie...
	AI_Output (other, self, "DIA_Ulthar_GREET_15_05"); //Jeœli tak, to co myœlicie o smokach gromadz¹cych siê w Górniczej Dolinie i ich coraz potê¿niejszej armii?
	AI_Output (self, other, "DIA_Ulthar_GREET_05_06"); //Rozumiem twoje rozgoryczenie, jednak ka¿da z naszych decyzji musi byæ dok³adnie przemyœlana.
	AI_Output (self, other, "DIA_Ulthar_GREET_05_07"); //Jeœli damy siê ponieœæ emocjom, nic nie zdzia³amy. Dlatego ty zajmij siê swoimi zadaniami, a my w tym czasie znajdziemy najlepsze wyjœcie z sytuacji.
};
///////////////////////////////////////////////////////////////////////
//	Info TEST
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_MAGETEST		(C_INFO)
{
	npc			 = 	KDF_502_Ulthar;
	nr			 = 	2;
	condition	 = 	DIA_Ulthar_MAGETEST_Condition;
	information	 = 	DIA_Ulthar_MAGETEST_Info;
	description	 = 	"Opowiedz mi proszê o Próbie Magii.";
};
func int DIA_Ulthar_MAGETEST_Condition ()
{	
	if Npc_KnowsInfo (hero, DIA_Ulthar_GREET)
	{
		return TRUE;
	};
};
func void DIA_Ulthar_MAGETEST_Info ()
{
	AI_Output (other, self, "DIA_Ulthar_MAGETEST_15_00"); //Opowiedz mi proszê o Próbie Magii.
	AI_Output (self, other, "DIA_Ulthar_MAGETEST_05_01"); //Dziêki niej wybrani nowicjusze mog¹ staæ siê pe³noprawnymi cz³onkami gildii magów. Jednak tylko jeden z nich mo¿e j¹ przejœæ.
	AI_Output (self, other, "DIA_Ulthar_MAGETEST_05_02"); //Wybrañcy, którzy wezm¹ udzia³ w Próbie, wyznaczani s¹ przez Innosa.
};
///////////////////////////////////////////////////////////////////////
//	Info WHEN
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_WHEN		(C_INFO)
{
	npc			 = 	KDF_502_Ulthar;
	nr			 = 	3;
	condition	 = 	DIA_Ulthar_WHEN_Condition;
	information	 = 	DIA_Ulthar_WHEN_Info;
	permanent	 =  TRUE;
	description	 = 	"Kiedy odbêdzie siê Próba?";
};
func int DIA_Ulthar_WHEN_Condition ()
{
	if  Npc_KnowsInfo (hero, DIA_Ulthar_MAGETEST)
	&& (KNOWS_FIRE_CONTEST == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Ulthar_WHEN_Info ()
{
	AI_Output (other, self, "DIA_Ulthar_WHEN_15_00"); //Kiedy odbêdzie siê Próba?
	AI_Output (self, other, "DIA_Ulthar_WHEN_05_01"); //Gdy dostajemy sygna³ od Innosa, informujemy wybranych nowicjuszy, ¿e nadszed³ czas Próby.
	
};
///////////////////////////////////////////////////////////////////////
//	Info TEST
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_TEST		(C_INFO)
{
	npc			 = 	KDF_502_Ulthar;
	nr           =  10;
	condition	 = 	DIA_Ulthar_TEST_Condition;
	information	 = 	DIA_Ulthar_TEST_Info;
	permanent	 =  FALSE;
	description	 = 	"Mistrzu, jestem gotów poddaæ siê Próbie.";
};
func int DIA_Ulthar_TEST_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Pyrokar_FIRE)
	{
		return TRUE;
	};
};
func void DIA_Ulthar_TEST_Info ()
{
	AI_Output (other, self, "DIA_Ulthar_TEST_15_00"); //Mistrzu, jestem gotów poddaæ siê Próbie.
	AI_Output (self, other, "DIA_Ulthar_TEST_05_01"); //Nie dziwi mnie, ¿e znasz stare prawo.
	AI_Output (self, other, "DIA_Ulthar_TEST_05_02"); //Ale ostrzegam, bierzesz na siebie wielki ciê¿ar! Zapamiêtaj, ¿e niecierpliwy umys³ nie zdo³a przetrwaæ Próby Ognia.
	AI_Output (self, other, "DIA_Ulthar_TEST_05_03"); //Od dawna ju¿ nikt nie poddawa³ siê Próbie. Zaœ prze¿y³ j¹ tylko jeden cz³owiek.
	AI_Output (self, other, "DIA_Ulthar_TEST_05_04"); //By³ nim m³ody, ambitny nowicjusz, Serpentes. Wiele lat po tym wydarzeniu zosta³ cz³onkiem Najwy¿szej Rady.
	AI_Output (other, self, "DIA_Ulthar_TEST_15_05"); //Nied³ugo nie bêdzie jedynym, któremu uda³o siê przejœæ próbê.
	AI_Output (self, other, "DIA_Ulthar_TEST_05_06"); //Nie bêdê d³u¿ej trzyma³ ciê w niepewnoœci. Oto twoje zadanie:
	AI_Output (self, other, "DIA_Ulthar_TEST_05_07"); //Stwórz runê ognistej strza³y. To wszystko - niech Innos ciê prowadzi.
	
	MIS_RUNE = LOG_RUNNING;
	Log_CreateTopic (TOPIC_Rune,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Rune,LOG_RUNNING);
	B_LogEntry (TOPIC_Rune,"Ulthar zleci³ mi zadanie. Mam stworzyæ runê ognistej strza³y.");
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info RUNNING
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_RUNNING		(C_INFO)
{
	npc			 = 	KDF_502_Ulthar;
	nr           =  10;
	condition	 = 	DIA_Ulthar_RUNNING_Condition;
	information	 = 	DIA_Ulthar_RUNNING_Info;
	permanent	 = 	TRUE;
	important	 = 	TRUE;
};
func int DIA_Ulthar_RUNNING_Condition ()
{	
	if (MIS_RUNE == LOG_RUNNING)
	&& Npc_IsInState	(self, ZS_Talk) 
	&& (Npc_HasItems    (other, ItRu_FireBolt) == 0)
	{
		return TRUE;
	};
};
func void DIA_Ulthar_RUNNING_Info ()
{
	AI_Output (self, other, "DIA_Ulthar_RUNNING_05_00"); //Znasz ju¿ swe zadanie. Bierz siê do pracy.
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info SUCCESS
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_SUCCESS		(C_INFO)
{
	npc			 = 	KDF_502_Ulthar;
	nr			 = 	2;
	condition	 = 	DIA_Ulthar_SUCCESS_Condition;
	information	 = 	DIA_Ulthar_SUCCESS_Info;
	permanent	 =  FALSE;
	description	 = 	"Uda³o mi siê stworzyæ runê.";
};
func int DIA_Ulthar_SUCCESS_Condition ()
{
	if (MIS_RUNE == LOG_RUNNING)
	&& (Npc_HasItems (hero, ItRu_FireBolt) >= 1)
	{
		return TRUE;
	};
};
func void DIA_Ulthar_SUCCESS_Info ()
{
	AI_Output (other, self, "DIA_Ulthar_SUCCESS_15_00"); //Uda³o mi siê stworzyæ runê.
	AI_Output (self, other, "DIA_Ulthar_SUCCESS_05_01"); //Dobra robota, nowicjuszu. Zatrzymaj j¹, to twoja pierwsza runa.
	AI_Output (self, other, "DIA_Ulthar_SUCCESS_05_02"); //Kiedy osi¹gniesz pierwszy Kr¹g Ognia, bêdziesz móg³ jej u¿ywaæ.
	AI_Output (self, other, "DIA_Ulthar_SUCCESS_05_03"); //Ku mojej radoœci uda³o ci siê przejœæ próbê!
	
	if (MIS_GOLEM == LOG_RUNNING)
	&& ((Npc_IsDead (Magic_Golem)) == FALSE)
	{
		AI_Output (self, other, "DIA_Ulthar_SUCCESS_05_04"); //Wci¹¿ jednak masz do wykonania zlecone ci przez Serpentesa zadanie.
	};
	
	MIS_RUNE = LOG_SUCCESS;
	B_GivePlayerXP (XP_RUNE);
	
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

INSTANCE DIA_Ulthar_KAP3_EXIT(C_INFO)
{
	npc			= KDF_502_Ulthar;
	nr			= 999;
	condition	= DIA_Ulthar_KAP3_EXIT_Condition;
	information	= DIA_Ulthar_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Ulthar_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ulthar_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info PermAbKap3
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_PermAbKap3		(C_INFO)
{
	npc			 = 	KDF_502_Ulthar;
	nr           =  99;
	condition	 = 	DIA_Ulthar_PermAbKap3_Condition;
	information	 = 	DIA_Ulthar_PermAbKap3_Info;
	permanent	 = 	TRUE;
	description  =  "Jakieœ wieœci?";
};
func int DIA_Ulthar_PermAbKap3_Condition ()
{	
	if (Kapitel >= 3)
	|| Npc_KnowsInfo (other,DIA_Ulthar_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Ulthar_PermAbKap3_Info ()
{
	AI_Output (other, self, "DIA_Ulthar_PermAbKap3_15_00"); //Jakieœ wieœci?

	if (hero.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Ulthar_PermAbKap3_05_01"); //Nie w tej chwili. IdŸ, proszê, i zajmij siê swoimi zadaniami, masz jeszcze wiele do zrobienia.
	}
	else
	{
		AI_Output (self, other, "DIA_Ulthar_PermAbKap3_05_02"); //Nie. Nic, czym nale¿a³oby siê przejmowaæ.
	};
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info SchreineVergiftet
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_SCHREINEVERGIFTET		(C_INFO)
{
	npc		 = 	KDF_502_Ulthar;
	nr		 = 	30;
	condition	 = 	DIA_Ulthar_SCHREINEVERGIFTET_Condition;
	information	 = 	DIA_Ulthar_SCHREINEVERGIFTET_Info;
	important	 = 	TRUE;
};

func int DIA_Ulthar_SCHREINEVERGIFTET_Condition ()
{
	if (Pedro_Traitor == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Ulthar_SCHREINEVERGIFTET_Info ()
{
	if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output			(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_00"); //Jest coœ jeszcze. Wróg zbezczeœci³ kilka przydro¿nych kapliczek Innosa. Straci³y sw¹ magiczn¹ moc.
			AI_Output			(other, self, "DIA_Ulthar_SCHREINEVERGIFTET_15_01"); //Rozumiem, i co w zwi¹zku z tym?
			AI_Output			(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_02"); //Twoim zadaniem bêdzie oczyœciæ je, zanim problem stanie siê naprawdê powa¿ny.
			CreateInvItems (self, ItMi_UltharsHolyWater_Mis, 1);									
			B_GiveInvItems (self, other, ItMi_UltharsHolyWater_Mis, 1);	
			AI_Output			(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_03"); //WeŸ tê wodê œwiêcon¹ i wlej do ka¿dej z kapliczek po kilka kropli.
			AI_Output			(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_04"); //Dziêki œwiêtym s³owom oczyszczenia kapliczki powinny odzyskaæ sw¹ dawn¹ moc.

			if ((Npc_HasItems (other,ItWr_Map_Shrine_MIS))==FALSE)
			{
				if ((Npc_HasItems (Gorax,ItWr_Map_Shrine_MIS)))
				&& ((Npc_IsDead(Gorax))== FALSE)
				{
					AI_Output			(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_05"); //Gorax sprzeda ci mapê, na której zaznaczono odpowiednie kapliczki.
				}
				else
				{
					AI_Output			(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_06"); //Oto twoja mapa. Te z kapliczek, które wymagaj¹ oczyszczenia, s¹ na niej odpowiednio zaznaczone.
					CreateInvItems (self, ItWr_Map_Shrine_MIS, 1);									
					B_GiveInvItems (self, other, ItWr_Map_Shrine_MIS, 1);					
				};
			};

			AI_Output			(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_07"); //Teraz idŸ i bierz siê do pracy.
			MIS_Ulthar_HeileSchreine_PAL = LOG_RUNNING;	
			
			Log_CreateTopic (TOPIC_Ulthar_HeileSchreine_PAL, LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Ulthar_HeileSchreine_PAL, LOG_RUNNING);
			B_LogEntry (TOPIC_Ulthar_HeileSchreine_PAL,"Ulthar da³ mi wodê œwiêcon¹ i kaza³ przy jej pomocy oczyœciæ wszystkie zbezczeszczone przez wroga kapliczki."); 
			
			AI_StopProcessInfos (self);
		}
		else
		{
			AI_Output			(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_08"); //Jeszcze jedno. Trzymaj siê z dala od przydro¿nych kapliczek. Dosz³y nas wieœci o tym, jakoby zosta³y one zbezczeszczone.
			AI_Output			(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_09"); //Trudno przewidzieæ, czym skoñczy³oby siê skorzystanie z ich mocy.
			AI_Output			(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_10"); //Ten problem jednak nie powinien ciê interesowaæ, to zadanie dla paladynów.
			AI_StopProcessInfos (self);
		};
};

///////////////////////////////////////////////////////////////////////
//	Info SchreineGeheilt
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_SchreineGeheilt		(C_INFO)
{
	npc		 = 	KDF_502_Ulthar;
	nr		 = 	30;
	condition	 = 	DIA_Ulthar_SchreineGeheilt_Condition;
	information	 = 	DIA_Ulthar_SchreineGeheilt_Info;

	description  = 	"Uda³o mi siê oczyœciæ wszystkie kapliczki.";
};

func int DIA_Ulthar_SchreineGeheilt_Condition ()
{
	if (MIS_Ulthar_HeileSchreine_PAL == LOG_SUCCESS)
		{
				return TRUE;
		};
};

func void DIA_Ulthar_SchreineGeheilt_Info ()
{
	AI_Output			(other, self, "DIA_Ulthar_SchreineGeheilt_15_00"); //Uda³o mi siê oczyœciæ wszystkie kapliczki.
	AI_Output			(self, other, "DIA_Ulthar_SchreineGeheilt_05_01"); //Œwietna robota. Jestem z ciebie dumny, moje dziecko. Niech Innos ciê b³ogos³awi.
	AI_Output			(self, other, "DIA_Ulthar_SchreineGeheilt_05_02"); //W podziêce weŸ ten amulet si³y. Jestem pewien, ¿e oka¿e siê pomocny w walce z wrogiem.
	CreateInvItems (self, ItAm_Dex_Strg_01, 1);									
	B_GiveInvItems (self, other, ItAm_Dex_Strg_01, 1);
	B_GivePlayerXP (XP_Ulthar_SchreineGereinigt);
	AI_StopProcessInfos (self);
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

INSTANCE DIA_Ulthar_KAP4_EXIT(C_INFO)
{
	npc			= KDF_502_Ulthar;
	nr			= 999;
	condition	= DIA_Ulthar_KAP4_EXIT_Condition;
	information	= DIA_Ulthar_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Ulthar_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ulthar_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


///////////////////////////////////////////////////////////////////////
//	Info SchreineGeheiltNoPAL
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_SchreineGeheiltNoPAL		(C_INFO)
{
	npc		 = 	KDF_502_Ulthar;
	nr		 = 	30;
	condition	 = 	DIA_Ulthar_SchreineGeheiltNoPAL_Condition;
	information	 = 	DIA_Ulthar_SchreineGeheiltNoPAL_Info;
	important	 = 	TRUE;

};

func int DIA_Ulthar_SchreineGeheiltNoPAL_Condition ()
{
	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)|| (hero.guild == GIL_KDF))
	&& (Kapitel >= 4)
		{
				return TRUE;
		};
};

func void DIA_Ulthar_SchreineGeheiltNoPAL_Info ()
{
	AI_Output			(self, other, "DIA_Ulthar_SchreineGeheiltNoPAL_05_00"); //Mam dobre wieœci. Przydro¿ne kapliczki zosta³y oczyszczone. Potêga Innosa pomog³a paladynom raz na zawsze uporaæ siê z tym problemem.
	AI_Output			(self, other, "DIA_Ulthar_SchreineGeheiltNoPAL_05_01"); //Znowu mo¿esz czciæ Innosa datkami i modlitw¹ bez strachu o swe bezpieczeñstwo.
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

INSTANCE DIA_Ulthar_KAP5_EXIT(C_INFO)
{
	npc			= KDF_502_Ulthar;
	nr			= 999;
	condition	= DIA_Ulthar_KAP5_EXIT_Condition;
	information	= DIA_Ulthar_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Ulthar_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ulthar_KAP5_EXIT_Info()
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


INSTANCE DIA_Ulthar_KAP6_EXIT(C_INFO)
{
	npc			= KDF_502_Ulthar;
	nr			= 999;
	condition	= DIA_Ulthar_KAP6_EXIT_Condition;
	information	= DIA_Ulthar_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Ulthar_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ulthar_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Ulthar_PICKPOCKET (C_INFO)
{
	npc			= KDF_502_Ulthar;
	nr			= 900;
	condition	= DIA_Ulthar_PICKPOCKET_Condition;
	information	= DIA_Ulthar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Ulthar_PICKPOCKET_Condition()
{
	C_Beklauen (74, 320);
};
 
FUNC VOID DIA_Ulthar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Ulthar_PICKPOCKET);
	Info_AddChoice		(DIA_Ulthar_PICKPOCKET, DIALOG_BACK 		,DIA_Ulthar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Ulthar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Ulthar_PICKPOCKET_DoIt);
};

func void DIA_Ulthar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Ulthar_PICKPOCKET);
};
	
func void DIA_Ulthar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Ulthar_PICKPOCKET);
};
































 
























