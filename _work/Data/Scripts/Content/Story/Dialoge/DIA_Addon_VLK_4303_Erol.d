///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Erol_EXIT   (C_INFO)
{
	npc         = VLK_4303_Addon_Erol;
	nr          = 999;
	condition   = DIA_Addon_Erol_EXIT_Condition;
	information = DIA_Addon_Erol_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Erol_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Erol_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Erol_PICKPOCKET (C_INFO)
{
	npc			= VLK_4303_Addon_Erol;
	nr			= 900;
	condition	= DIA_Addon_Erol_PICKPOCKET_Condition;
	information	= DIA_Addon_Erol_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Addon_Erol_PICKPOCKET_Condition()
{
	C_Beklauen (43, 42);
};
 
FUNC VOID DIA_Addon_Erol_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Erol_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Erol_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Erol_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Erol_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Erol_PICKPOCKET_DoIt);
};

func void DIA_Addon_Erol_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Erol_PICKPOCKET);
};
	
func void DIA_Addon_Erol_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Erol_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Erol_Hallo		(C_INFO)
{
	npc		 = 	VLK_4303_Addon_Erol;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Erol_Hallo_Condition;
	information	 = 	DIA_Addon_Erol_Hallo_Info;

	description	 = 	"Co się dzieje?";
};

func int DIA_Addon_Erol_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Erol_Hallo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Erol_Hallo_15_00"); //Co się dzieje?
	AI_Output	(self, other, "DIA_Addon_Erol_Hallo_10_01"); //Co się dzieje? Popatrz tylko pod most, a zrozumiesz.
	AI_Output	(self, other, "DIA_Addon_Erol_Hallo_10_02"); //Coś takiego widzę pierwszy raz w życiu. Czemu nikt nie przepędzi tych obwiesiów?
};

///////////////////////////////////////////////////////////////////////
//	Info what
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Erol_what		(C_INFO)
{
	npc		 = 	VLK_4303_Addon_Erol;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Erol_what_Condition;
	information	 = 	DIA_Addon_Erol_what_Info;

	description	 = 	"Co się stało?";
};

func int DIA_Addon_Erol_what_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Erol_Hallo))
		{
			return TRUE;
		};
};

func void DIA_Addon_Erol_what_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Erol_what_15_00"); //Co się stało?
	AI_Output	(self, other, "DIA_Addon_Erol_what_10_01"); //Jechałem do miasta z moimi pomocnikami, kiedy nagle, ni stąd, ni zowąd, wyskoczyli na nas uzbrojeni bandyci.
	AI_Output	(self, other, "DIA_Addon_Erol_what_10_02"); //Na szczęście umiem się bronić, bo podzieliłbym los pozostałych.

	Log_CreateTopic (TOPIC_Addon_Erol, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Erol, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Erol,"Kupiec Erol został obrabowany przez bandytów i stracił wszystkie towary. Bandyci z mostu koło gospody 'Martwa Harpia' nadal mają jego cenne kamienne tabliczki. Erol chce je odzyskać."); 

	MIS_Addon_Erol_BanditStuff = LOG_RUNNING;

	Info_ClearChoices	(DIA_Addon_Erol_what);
	Info_AddChoice	(DIA_Addon_Erol_what, "Ten sprzęt pod mostem należy do ciebie?", DIA_Addon_Erol_what_dein );
	Info_AddChoice	(DIA_Addon_Erol_what, "Kto cię napadł?", DIA_Addon_Erol_what_wer );
};
func void DIA_Addon_Erol_what_back ()
{
	Info_ClearChoices	(DIA_Addon_Erol_what);
};
func void DIA_Addon_Erol_what_dein ()
{
	AI_Output (other, self, "DIA_Addon_Erol_what_dein_15_00"); //Ten sprzęt pod mostem należy do ciebie?
	AI_Output (self, other, "DIA_Addon_Erol_what_dein_10_01"); //Tak. Wózek, towary... Wszystko.
	if (Npc_HasItems (other, itmi_erolskelch) > 0)
	{
		AI_Output (other, self, "DIA_Addon_Erol_what_dein_Add_15_00"); //Znalazłem trochę tego po drodze.
		AI_Output (self, other, "DIA_Addon_Erol_what_dein_Add_10_01"); //Możesz sobie zatrzymać te bibeloty. Nie są dużo warte.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Erol_what_dein_Add_10_02"); //Nic z tego nie ma dla mnie dużej wartości.
	};
	AI_Output (self, other, "DIA_Addon_Erol_what_dein_10_02"); //Jedyną naprawdę cenną rzeczą były trzy kamienne tabliczki, które te dranie oczywiście zrabowały!

	Info_AddChoice	(DIA_Addon_Erol_what, DIALOG_BACK, DIA_Addon_Erol_what_back );
	Info_AddChoice	(DIA_Addon_Erol_what, "Kamienne tabliczki?", DIA_Addon_Erol_what_Was );
};
func void DIA_Addon_Erol_what_Was ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_Was_15_00"); //Kamienne tabliczki?
	AI_Output			(self, other, "DIA_Addon_Erol_what_Was_10_01"); //Jeden z miejskich Magów Wody chciał je ode mnie kupić, a ja obiecałem mu je dostarczyć.
	AI_Output			(self, other, "DIA_Addon_Erol_what_Was_10_02"); //Muszę je za wszelką cenę odzyskać. Inaczej moja reputacja legnie w gruzach.

	Info_AddChoice	(DIA_Addon_Erol_what, "Gdzie znalazłeś te tabliczki?", DIA_Addon_Erol_what_woher );
	Info_AddChoice	(DIA_Addon_Erol_what, "Czemu ten mag tak bardzo się nimi interesuje?", DIA_Addon_Erol_what_KDW );
};
func void DIA_Addon_Erol_what_KDW ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_KDW_15_00"); //Czemu ten mag tak bardzo się nimi interesuje?
	AI_Output			(self, other, "DIA_Addon_Erol_what_KDW_10_01"); //Powiedział, że potrzebne mu są do badań i poprosił, żebym rozejrzał się za innymi tego typu przedmiotami.
};
func void DIA_Addon_Erol_what_woher ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_woher_15_00"); //Gdzie znalazłeś te tabliczki?
	AI_Output			(self, other, "DIA_Addon_Erol_what_woher_10_01"); //Część z nich znalazłem w mauzoleach i podobnych budowlach, a część - w jaskiniach.
	AI_Output			(self, other, "DIA_Addon_Erol_what_woher_10_02"); //Większość sprzedałem temu magowi z Khorinis.
	AI_Output			(self, other, "DIA_Addon_Erol_what_woher_10_03"); //W tych okolicach ciężko się na nie natknąć. Najczęściej znajdowałem je na północny wschód od miasta.

	Info_AddChoice	(DIA_Addon_Erol_what, "Czemu po prostu nie poszukasz innych?", DIA_Addon_Erol_what_neue );
};
func void DIA_Addon_Erol_what_neue ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_neue_15_00"); //Czemu po prostu nie poszukasz innych?
	AI_Output			(self, other, "DIA_Addon_Erol_what_neue_10_01"); //Niestety, podczas walki z bandytami skręciłem kostkę.
	AI_Output			(self, other, "DIA_Addon_Erol_what_neue_10_02"); //Mogę chodzić, ale podróżowanie i zwiedzanie jaskiń raczej odpada.
};
func void DIA_Addon_Erol_what_wer ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_wer_15_00"); //Kto cię napadł?
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_01"); //Bandyci, któżby inny? Czają się w pobliżu tego mostu.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_02"); //Kiedy ktoś chce przejechać, wpada w ich sidła.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_03"); //Wiedziałem, że most jest mało bezpieczny, więc chciałem się przeprawić pod nim.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_04"); //Ale widzę, że mieli wielką chrapkę na moje towary.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_05"); //Ci dranie skoczyli na nas z mostu, prosto na wóz.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_06"); //Powinienem był próbować przekraść się pod osłoną nocy.
};

///////////////////////////////////////////////////////////////////////
//	Info FernandosWeapons
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Erol_FernandosWeapons		(C_INFO)
{
	npc		 = 	VLK_4303_Addon_Erol;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Erol_FernandosWeapons_Condition;
	information	 = 	DIA_Addon_Erol_FernandosWeapons_Info;

	description	 = 	"Potrzebuję informacji o dostawie broni dla bandytów.";
};

func int DIA_Addon_Erol_FernandosWeapons_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Erol_what))
 	&& (MIS_Vatras_FindTheBanditTrader == LOG_RUNNING)	
		{
			return TRUE;
		};
};

func void DIA_Addon_Erol_FernandosWeapons_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Erol_FernandosWeapons_15_00"); //Potrzebuję informacji o dostawie broni dla bandytów.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_01"); //Dostawie broni? Tak, słyszałem o tym. Jakaś świnia z miasta sprzedała im jej tyle, że ledwie mogli wszystko unieść.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_02"); //Ci, którzy na mnie napadli, to część ich szajki.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_03"); //Pozostali musieli schować się gdzieś na płaskowyżu w pobliżu farmy Bengara.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_04"); //Może próbowali pokonać przełęcz...
	
	Info_ClearChoices	(DIA_Addon_Erol_FernandosWeapons);
	Info_AddChoice	(DIA_Addon_Erol_FernandosWeapons, DIALOG_BACK, DIA_Addon_Erol_FernandosWeapons_back );
	Info_AddChoice	(DIA_Addon_Erol_FernandosWeapons, "Gdzie jest ten płaskowyż?", DIA_Addon_Erol_FernandosWeapons_bengar );
};
func void DIA_Addon_Erol_FernandosWeapons_bengar ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_FernandosWeapons_bengar_15_00"); //Gdzie jest ten płaskowyż?
	AI_Output			(self, other, "DIA_Addon_Erol_FernandosWeapons_bengar_10_01"); //W centrum wyspy Khorinis znajduje się "Martwa Harpia", gospoda należąca do Orlana.
	AI_Output			(self, other, "DIA_Addon_Erol_FernandosWeapons_bengar_10_02"); //Od niej prowadzi ścieżka na południe, wiodąca właśnie na ów płaskowyż i do Górniczej Doliny.
	Info_ClearChoices	(DIA_Addon_Erol_FernandosWeapons);
};

func void DIA_Addon_Erol_FernandosWeapons_back ()
{
	Info_ClearChoices	(DIA_Addon_Erol_FernandosWeapons);
};


///////////////////////////////////////////////////////////////////////
//	Info Stoneplates
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Erol_Stoneplates		(C_INFO)
{
	npc		 = 	VLK_4303_Addon_Erol;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Erol_Stoneplates_Condition;
	information	 = 	DIA_Addon_Erol_Stoneplates_Info;
	permanent	 = 	TRUE;

	description	 = 	"Jeśli chodzi o te tabliczki...";
};

func int DIA_Addon_Erol_Stoneplates_Condition ()
{
	if (MIS_Addon_Erol_BanditStuff == LOG_RUNNING)
		{
			return TRUE;
		};
};

var int StoneplatesCounter;
const int Addon_ErolsStoneplatesOffer = (Value_StonePlateCommon + 5); //Joly:Kohle für eine StonePlateCommon

func void DIA_Addon_Erol_Stoneplates_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Erol_Stoneplates_15_00"); //Jeśli chodzi o te tabliczki...

	if (Npc_HasItems (other,ItWr_StonePlateCommon_Addon) >= 1)
	{
			var int StoneplatesCount;
			var int XP_Addon_BringStoneplates;
			var int StoneplatesGeld;
		
			
			StoneplatesCount = Npc_HasItems(other, ItWr_StonePlateCommon_Addon);
		
		
			if (StoneplatesCount == 1)
				{
					AI_Output		(other, self, "DIA_Addon_Erol_Stoneplates_15_01"); //Znalazłem jedną z nich...
					B_GivePlayerXP (XP_Addon_BringStoneplate);
					B_GiveInvItems (other, self, ItWr_StonePlateCommon_Addon, 1);
				
					StoneplatesCounter = StoneplatesCounter + 1;
					
				}
				else
				{
					AI_Output		(other, self, "DIA_Addon_Erol_Stoneplates_15_02"); //Znalazłem kilka...
		
					if ((StoneplatesCount + StoneplatesCounter) >= 3)
					{
						B_GiveInvItems (other, self, ItWr_StonePlateCommon_Addon, 3 - StoneplatesCounter);
						XP_Addon_BringStoneplates = ((3 - StoneplatesCounter) * XP_Addon_BringStoneplate);
						StoneplatesCounter = 3;
					}
					else
					{
						B_GiveInvItems (other, self, ItWr_StonePlateCommon_Addon, StoneplatesCount);
						XP_Addon_BringStoneplates = (StoneplatesCount * XP_Addon_BringStoneplate);
						StoneplatesCounter = (StoneplatesCounter + StoneplatesCount); 
					};
					B_GivePlayerXP (XP_Addon_BringStoneplates);
				};
				
				
			AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_03"); //Wielkie dzięki.
		
			if (StoneplatesCounter == 1)
			{
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_04"); //Teraz brakuje mi tylko dwóch.
			}
			else if	(StoneplatesCounter == 2)
			{
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_05"); //Brakuje jeszcze jednej.
			}
			else // mindestens 3 Steintafeln hat er schon.
			{
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_06"); //To już wszystkie. Teraz będę mógł dobić targu z magiem i wrócić do domu.
				
				MIS_Addon_Erol_BanditStuff = LOG_SUCCESS;
				Wld_AssignRoomToGuild ("grpwaldhuette01",	GIL_PUBLIC);
			};
		
			AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_07"); //Oczywiście zapłacę ci za fatygę.

			StoneplatesGeld	= (Addon_ErolsStoneplatesOffer * Npc_HasItems (self, ItWr_StonePlateCommon_Addon ));
		
			CreateInvItems (self, ItMi_Gold, StoneplatesGeld); 
			B_GiveInvItems (self, other, ItMi_Gold, StoneplatesGeld);
			
			Npc_RemoveInvItems	(self ,ItWr_StonePlateCommon_Addon 	, Npc_HasItems (self, ItWr_StonePlateCommon_Addon ));//Joly: weil er zum Händler wird.
			
			if (MIS_Addon_Erol_BanditStuff == LOG_SUCCESS)
			{
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_08"); //Wracam do domu. Chcesz się do mnie przyłączyć?
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_09"); //Może zechcesz coś u mnie kupić, jeśli dotrzemy na miejsce?
				
				AI_StopProcessInfos (self);
				AI_UseMob			(self,"BENCH",-1);
				AI_GotoWP 			(self,"NW_TAVERN_TO_FOREST_03");
				Npc_ExchangeRoutine	(self,"Start");
				Wld_AssignRoomToGuild ("grpwaldhuette01",	GIL_PUBLIC);
			};
	}
	else
	{
			if (C_ScHasMagicStonePlate () == TRUE)
			{
				AI_Output			(other, self, "DIA_Addon_Erol_Stoneplates_15_10"); //Mam tu coś takiego...
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_11"); //Nie, to nie to. Tamte tabliczki były nasączone magią.
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_12"); //Mag, z którym ubiłem interes, nie będzie zainteresowany czymś takim.
			}
			else
			{			
				AI_Output			(other, self, "DIA_Addon_Erol_Stoneplates_15_13"); //Ile ich brakuje?
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_14"); //Aby ocalić dobre imię, potrzebuję trzech.
			}; 
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Buerger
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Erol_Buerger		(C_INFO)
{
	npc		 = 	VLK_4303_Addon_Erol;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Erol_Buerger_Condition;
	information	 = 	DIA_Addon_Erol_Buerger_Info;

	description	 = 	"Jesteś obywatelem miasta?";
};

func int DIA_Addon_Erol_Buerger_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Erol_Hallo))
		{
			return TRUE;
		};
};

func void DIA_Addon_Erol_Buerger_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Erol_Buerger_15_00"); //Jesteś obywatelem miasta?
	AI_Output	(self, other, "DIA_Addon_Erol_Buerger_10_01"); //Tak, ale to wkrótce się zmieni. Nie cierpię tych bufonów z górnego miasta.
	AI_Output	(self, other, "DIA_Addon_Erol_Buerger_10_02"); //Kiedyś byłem wpływową osobą w mieście, ale to było dawno temu.
};

///////////////////////////////////////////////////////////////////////
//	Info PreTeach
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Erol_PreTeach		(C_INFO)
{
	npc		 = 	VLK_4303_Addon_Erol;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Erol_PreTeach_Condition;
	information	 = 	DIA_Addon_Erol_PreTeach_Info;

	description	 = 	"Udało ci się przepędzić bandytów?";
};

func int DIA_Addon_Erol_PreTeach_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Erol_what))
	{
		return TRUE;
	};
};

func void DIA_Addon_Erol_PreTeach_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Erol_PreTeach_15_00"); //Udało ci się przepędzić bandytów?
	AI_Output	(self, other, "DIA_Addon_Erol_PreTeach_10_01"); //Tak, ale na pewno wciąż czają się w pobliżu mostu.
	AI_Output	(other, self, "DIA_Addon_Erol_PreTeach_15_02"); //Możesz mnie nauczyć silniej uderzać?
	AI_Output	(self, other, "DIA_Addon_Erol_PreTeach_10_03"); //Pewnie.
	Erol_Addon_TeachPlayer = TRUE;
	Log_CreateTopic (Topic_OutTeacher,LOG_NOTE);
	B_LogEntry (Topic_OutTeacher, LogText_Addon_Erol_Teach);
};

///////////////////////////////////////////////////////////////////////
//	Info PreTrade
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Erol_PreTrade		(C_INFO)
{
	npc		 = 	VLK_4303_Addon_Erol;
	nr		 = 	100;
	condition	 = 	DIA_Addon_Erol_PreTrade_Condition;
	information	 = 	DIA_Addon_Erol_PreTrade_Info;
	permanent	 = 	TRUE;

	description	 = 	"Pokaż mi swoje towary.";
};

func int DIA_Addon_Erol_PreTrade_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Erol_what))
	&& (Npc_GetDistToWP(self,"NW_BIGFARM_HUT_IN_01")>2000)
	
		{
			return TRUE;
		};
};

func void DIA_Addon_Erol_PreTrade_Info ()
{
	B_Say (other,self,"$TRADE_2");
	AI_Output	(self, other, "DIA_Addon_Erol_PreTrade_10_00"); //Niestety, nie mogę ci nic sprzedać. Cały mój towar leży w tej chwili pod mostem.
	AI_Output	(self, other, "DIA_Addon_Erol_PreTrade_10_01"); //Wrócę do interesu dopiero po powrocie do domu.

	if (MIS_Addon_Erol_BanditStuff != LOG_SUCCESS)
	{
		AI_Output	(self, other, "DIA_Addon_Erol_PreTrade_10_02"); //Ale nie wrócę, póki nie odzyskam swoich tabliczek.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info SLD
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Erol_SLD		(C_INFO)
{
	npc		 = 	VLK_4303_Addon_Erol;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Erol_SLD_Condition;
	information	 = 	DIA_Addon_Erol_SLD_Info;

	description	 = 	"To twoja chata?";
};

func int DIA_Addon_Erol_SLD_Condition ()
{
	if	((Npc_GetDistToWP(self,"NW_BIGFARM_HUT_IN_01")<2000) )
		{
			return TRUE;
		};
};
var int Erol_IsAtHome;
func void DIA_Addon_Erol_SLD_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Erol_SLD_15_00"); //To twoja chata?
	AI_Output	(self, other, "DIA_Addon_Erol_SLD_10_01"); //Tak. O co chodzi?
	AI_Output	(other, self, "DIA_Addon_Erol_SLD_15_02"); //Nie masz żadnych kłopotów z najemnikami?
	AI_Output	(self, other, "DIA_Addon_Erol_SLD_10_03"); //Nie czepiają się mnie, a ja nie mieszam się do ich spraw.
	AI_Output	(self, other, "DIA_Addon_Erol_SLD_10_04"); //Są dobrymi klientami i za niewielką opłatą pilnują mojej chaty, gdy mnie tu nie ma.
	B_GivePlayerXP (XP_Ambient);
	if (Erol_IsAtHome == FALSE)
	{
		Npc_ExchangeRoutine	(self,"HOME");
		Erol_IsAtHome = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Erol_Trade		(C_INFO)
{
	npc		 = 	VLK_4303_Addon_Erol;
	nr		 = 	100;
	condition	 = 	DIA_Addon_Erol_Trade_Condition;
	information	 = 	DIA_Addon_Erol_Trade_Info;
	Trade 		 = 	TRUE;
	permanent	 = 	TRUE;
	description	 = 	"Pokaż mi swoje towary.";
};

func int DIA_Addon_Erol_Trade_Condition ()
{
	if (MIS_Addon_Erol_BanditStuff == LOG_SUCCESS)
	&& ((Npc_GetDistToWP(self,"NW_BIGFARM_HUT_IN_01")<3000) )
	{
		return TRUE;
	};
};
var int DIA_Addon_Erol_Trade_OneTime;
func void DIA_Addon_Erol_Trade_Info ()
{
	B_GiveTradeInv (self);
	B_Say (other,self,"$TRADE_2");
	AI_Output	(self, other, "DIA_Addon_Erol_Trade_10_00"); //Niestety, asortyment moich towarów nie jest zbyt duży.
	
	if (Erol_IsAtHome == FALSE)
	{
		Log_CreateTopic (Topic_OutTrader,LOG_NOTE);
		B_LogEntry (Topic_OutTrader, LogText_Addon_ErolTrade);

		Npc_ExchangeRoutine	(self,"Home");
		Erol_IsAtHome = TRUE;
	};
};

//*******************************************
//	TeachPlayer
//*******************************************

INSTANCE DIA_Addon_Erol_Teach(C_INFO)
{
	npc			= VLK_4303_Addon_Erol;
	nr			= 99;
	condition	= DIA_Addon_Erol_Teach_Condition;
	information	= DIA_Addon_Erol_Teach_Info;
	permanent	= TRUE;
	description = "Pokaż mi, jak walczyć z większą siłą.";
};                       

FUNC INT DIA_Addon_Erol_Teach_Condition()
{
	if (Erol_Addon_TeachPlayer == TRUE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Addon_Erol_Teach_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Erol_Teach_15_00"); //Pokaż mi, jak walczyć z większą siłą.

	if (MIS_Addon_Erol_BanditStuff != LOG_SUCCESS)
	{
		AI_Output	(self, other, "DIA_Addon_Erol_Teach_10_01"); //Owszem, ale nie za darmo.
		AI_Output	(self, other, "DIA_Addon_Erol_Teach_10_02"); //Pomóż mi zachować dobre imię i znajdź moje kamienne tabliczki.
		AI_Output	(self, other, "DIA_Addon_Erol_Teach_10_03"); //Wtedy pokażę ci, jak wykorzystać swą siłę w walce.
	}
	else if (Erol_Bonus == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_00"); //Dobrze. Patrz uważnie. To prosta, lecz użyteczna sztuczka.
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_01"); //Kiedy uderzasz, używaj siły całego ciała, nie tylko ramion.
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_02"); //Kiedy wyciągasz ramię, obróć biodro.
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_03"); //Jeśli trochę poćwiczysz, zauważysz różnicę.
		B_RaiseAttribute (other, ATR_STRENGTH, 1);
		Erol_Bonus = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_04"); //Jeśli chcesz podszkolić się bardziej, musisz potrenować.
		Info_ClearChoices (DIA_Addon_Erol_Teach);
		Info_AddChoice		(DIA_Addon_Erol_Teach, DIALOG_BACK, DIA_Addon_Erol_Teach_Back);
		Info_AddChoice		(DIA_Addon_Erol_Teach, B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Addon_Erol_Teach_STR_1);
		Info_AddChoice		(DIA_Addon_Erol_Teach, B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Addon_Erol_Teach_STR_5);
	};
};

FUNC VOID DIA_Addon_Erol_Teach_Back ()
{
	Info_ClearChoices (DIA_Addon_Erol_Teach);
};

FUNC VOID DIA_Addon_Erol_Teach_STR_1 ()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 1, T_MAX);
	
	Info_ClearChoices 	(DIA_Addon_Erol_Teach);
	Info_AddChoice		(DIA_Addon_Erol_Teach, DIALOG_BACK, DIA_Addon_Erol_Teach_Back);
	Info_AddChoice		(DIA_Addon_Erol_Teach, B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Addon_Erol_Teach_STR_1);
	Info_AddChoice		(DIA_Addon_Erol_Teach, B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Addon_Erol_Teach_STR_5);
};

FUNC VOID DIA_Addon_Erol_Teach_STR_5 ()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 5, T_MAX);
	
	Info_ClearChoices 	(DIA_Addon_Erol_Teach);
	Info_AddChoice		(DIA_Addon_Erol_Teach, DIALOG_BACK, DIA_Addon_Erol_Teach_Back);
	Info_AddChoice		(DIA_Addon_Erol_Teach, B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Addon_Erol_Teach_STR_1);
	Info_AddChoice		(DIA_Addon_Erol_Teach, B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Addon_Erol_Teach_STR_5);
};






