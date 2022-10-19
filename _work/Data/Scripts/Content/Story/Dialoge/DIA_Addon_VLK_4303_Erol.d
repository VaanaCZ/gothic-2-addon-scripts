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

	description	 = 	"Co siê dzieje?";
};

func int DIA_Addon_Erol_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Erol_Hallo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Erol_Hallo_15_00"); //Co siê dzieje?
	AI_Output	(self, other, "DIA_Addon_Erol_Hallo_10_01"); //Co siê dzieje? Popatrz tylko pod most, a zrozumiesz.
	AI_Output	(self, other, "DIA_Addon_Erol_Hallo_10_02"); //Coœ takiego widzê pierwszy raz w ¿yciu. Czemu nikt nie przepêdzi tych obwiesiów?
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

	description	 = 	"Co siê sta³o?";
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
	AI_Output	(other, self, "DIA_Addon_Erol_what_15_00"); //Co siê sta³o?
	AI_Output	(self, other, "DIA_Addon_Erol_what_10_01"); //Jecha³em do miasta z moimi pomocnikami, kiedy nagle, ni st¹d, ni zow¹d, wyskoczyli na nas uzbrojeni bandyci.
	AI_Output	(self, other, "DIA_Addon_Erol_what_10_02"); //Na szczêœcie umiem siê broniæ, bo podzieli³bym los pozosta³ych.

	Log_CreateTopic (TOPIC_Addon_Erol, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Erol, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Erol,"Kupiec Erol zosta³ obrabowany przez bandytów i straci³ wszystkie towary. Bandyci z mostu ko³o gospody 'Martwa Harpia' nadal maj¹ jego cenne kamienne tabliczki. Erol chce je odzyskaæ."); 

	MIS_Addon_Erol_BanditStuff = LOG_RUNNING;

	Info_ClearChoices	(DIA_Addon_Erol_what);
	Info_AddChoice	(DIA_Addon_Erol_what, "Ten sprzêt pod mostem nale¿y do ciebie?", DIA_Addon_Erol_what_dein );
	Info_AddChoice	(DIA_Addon_Erol_what, "Kto ciê napad³?", DIA_Addon_Erol_what_wer );
};
func void DIA_Addon_Erol_what_back ()
{
	Info_ClearChoices	(DIA_Addon_Erol_what);
};
func void DIA_Addon_Erol_what_dein ()
{
	AI_Output (other, self, "DIA_Addon_Erol_what_dein_15_00"); //Ten sprzêt pod mostem nale¿y do ciebie?
	AI_Output (self, other, "DIA_Addon_Erol_what_dein_10_01"); //Tak. Wózek, towary... Wszystko.
	if (Npc_HasItems (other, itmi_erolskelch) > 0)
	{
		AI_Output (other, self, "DIA_Addon_Erol_what_dein_Add_15_00"); //Znalaz³em trochê tego po drodze.
		AI_Output (self, other, "DIA_Addon_Erol_what_dein_Add_10_01"); //Mo¿esz sobie zatrzymaæ te bibeloty. Nie s¹ du¿o warte.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Erol_what_dein_Add_10_02"); //Nic z tego nie ma dla mnie du¿ej wartoœci.
	};
	AI_Output (self, other, "DIA_Addon_Erol_what_dein_10_02"); //Jedyn¹ naprawdê cenn¹ rzecz¹ by³y trzy kamienne tabliczki, które te dranie oczywiœcie zrabowa³y!

	Info_AddChoice	(DIA_Addon_Erol_what, DIALOG_BACK, DIA_Addon_Erol_what_back );
	Info_AddChoice	(DIA_Addon_Erol_what, "Kamienne tabliczki?", DIA_Addon_Erol_what_Was );
};
func void DIA_Addon_Erol_what_Was ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_Was_15_00"); //Kamienne tabliczki?
	AI_Output			(self, other, "DIA_Addon_Erol_what_Was_10_01"); //Jeden z miejskich Magów Wody chcia³ je ode mnie kupiæ, a ja obieca³em mu je dostarczyæ.
	AI_Output			(self, other, "DIA_Addon_Erol_what_Was_10_02"); //Muszê je za wszelk¹ cenê odzyskaæ. Inaczej moja reputacja legnie w gruzach.

	Info_AddChoice	(DIA_Addon_Erol_what, "Gdzie znalaz³eœ te tabliczki?", DIA_Addon_Erol_what_woher );
	Info_AddChoice	(DIA_Addon_Erol_what, "Czemu ten mag tak bardzo siê nimi interesuje?", DIA_Addon_Erol_what_KDW );
};
func void DIA_Addon_Erol_what_KDW ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_KDW_15_00"); //Czemu ten mag tak bardzo siê nimi interesuje?
	AI_Output			(self, other, "DIA_Addon_Erol_what_KDW_10_01"); //Powiedzia³, ¿e potrzebne mu s¹ do badañ i poprosi³, ¿ebym rozejrza³ siê za innymi tego typu przedmiotami.
};
func void DIA_Addon_Erol_what_woher ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_woher_15_00"); //Gdzie znalaz³eœ te tabliczki?
	AI_Output			(self, other, "DIA_Addon_Erol_what_woher_10_01"); //Czêœæ z nich znalaz³em w mauzoleach i podobnych budowlach, a czêœæ - w jaskiniach.
	AI_Output			(self, other, "DIA_Addon_Erol_what_woher_10_02"); //Wiêkszoœæ sprzeda³em temu magowi z Khorinis.
	AI_Output			(self, other, "DIA_Addon_Erol_what_woher_10_03"); //W tych okolicach ciê¿ko siê na nie natkn¹æ. Najczêœciej znajdowa³em je na pó³nocny wschód od miasta.

	Info_AddChoice	(DIA_Addon_Erol_what, "Czemu po prostu nie poszukasz innych?", DIA_Addon_Erol_what_neue );
};
func void DIA_Addon_Erol_what_neue ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_neue_15_00"); //Czemu po prostu nie poszukasz innych?
	AI_Output			(self, other, "DIA_Addon_Erol_what_neue_10_01"); //Niestety, podczas walki z bandytami skrêci³em kostkê.
	AI_Output			(self, other, "DIA_Addon_Erol_what_neue_10_02"); //Mogê chodziæ, ale podró¿owanie i zwiedzanie jaskiñ raczej odpada.
};
func void DIA_Addon_Erol_what_wer ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_wer_15_00"); //Kto ciê napad³?
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_01"); //Bandyci, któ¿by inny? Czaj¹ siê w pobli¿u tego mostu.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_02"); //Kiedy ktoœ chce przejechaæ, wpada w ich sid³a.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_03"); //Wiedzia³em, ¿e most jest ma³o bezpieczny, wiêc chcia³em siê przeprawiæ pod nim.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_04"); //Ale widzê, ¿e mieli wielk¹ chrapkê na moje towary.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_05"); //Ci dranie skoczyli na nas z mostu, prosto na wóz.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_06"); //Powinienem by³ próbowaæ przekraœæ siê pod os³on¹ nocy.
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

	description	 = 	"Potrzebujê informacji o dostawie broni dla bandytów.";
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
	AI_Output	(other, self, "DIA_Addon_Erol_FernandosWeapons_15_00"); //Potrzebujê informacji o dostawie broni dla bandytów.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_01"); //Dostawie broni? Tak, s³ysza³em o tym. Jakaœ œwinia z miasta sprzeda³a im jej tyle, ¿e ledwie mogli wszystko unieœæ.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_02"); //Ci, którzy na mnie napadli, to czêœæ ich szajki.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_03"); //Pozostali musieli schowaæ siê gdzieœ na p³askowy¿u w pobli¿u farmy Bengara.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_04"); //Mo¿e próbowali pokonaæ prze³êcz...
	
	Info_ClearChoices	(DIA_Addon_Erol_FernandosWeapons);
	Info_AddChoice	(DIA_Addon_Erol_FernandosWeapons, DIALOG_BACK, DIA_Addon_Erol_FernandosWeapons_back );
	Info_AddChoice	(DIA_Addon_Erol_FernandosWeapons, "Gdzie jest ten p³askowy¿?", DIA_Addon_Erol_FernandosWeapons_bengar );
};
func void DIA_Addon_Erol_FernandosWeapons_bengar ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_FernandosWeapons_bengar_15_00"); //Gdzie jest ten p³askowy¿?
	AI_Output			(self, other, "DIA_Addon_Erol_FernandosWeapons_bengar_10_01"); //W centrum wyspy Khorinis znajduje siê "Martwa Harpia", gospoda nale¿¹ca do Orlana.
	AI_Output			(self, other, "DIA_Addon_Erol_FernandosWeapons_bengar_10_02"); //Od niej prowadzi œcie¿ka na po³udnie, wiod¹ca w³aœnie na ów p³askowy¿ i do Górniczej Doliny.
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

	description	 = 	"Jeœli chodzi o te tabliczki...";
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
	AI_Output	(other, self, "DIA_Addon_Erol_Stoneplates_15_00"); //Jeœli chodzi o te tabliczki...

	if (Npc_HasItems (other,ItWr_StonePlateCommon_Addon) >= 1)
	{
			var int StoneplatesCount;
			var int XP_Addon_BringStoneplates;
			var int StoneplatesGeld;
		
			
			StoneplatesCount = Npc_HasItems(other, ItWr_StonePlateCommon_Addon);
		
		
			if (StoneplatesCount == 1)
				{
					AI_Output		(other, self, "DIA_Addon_Erol_Stoneplates_15_01"); //Znalaz³em jedn¹ z nich...
					B_GivePlayerXP (XP_Addon_BringStoneplate);
					B_GiveInvItems (other, self, ItWr_StonePlateCommon_Addon, 1);
				
					StoneplatesCounter = StoneplatesCounter + 1;
					
				}
				else
				{
					AI_Output		(other, self, "DIA_Addon_Erol_Stoneplates_15_02"); //Znalaz³em kilka...
		
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
				
				
			AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_03"); //Wielkie dziêki.
		
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
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_06"); //To ju¿ wszystkie. Teraz bêdê móg³ dobiæ targu z magiem i wróciæ do domu.
				
				MIS_Addon_Erol_BanditStuff = LOG_SUCCESS;
				Wld_AssignRoomToGuild ("grpwaldhuette01",	GIL_PUBLIC);
			};
		
			AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_07"); //Oczywiœcie zap³acê ci za fatygê.

			StoneplatesGeld	= (Addon_ErolsStoneplatesOffer * Npc_HasItems (self, ItWr_StonePlateCommon_Addon ));
		
			CreateInvItems (self, ItMi_Gold, StoneplatesGeld); 
			B_GiveInvItems (self, other, ItMi_Gold, StoneplatesGeld);
			
			Npc_RemoveInvItems	(self ,ItWr_StonePlateCommon_Addon 	, Npc_HasItems (self, ItWr_StonePlateCommon_Addon ));//Joly: weil er zum Händler wird.
			
			if (MIS_Addon_Erol_BanditStuff == LOG_SUCCESS)
			{
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_08"); //Wracam do domu. Chcesz siê do mnie przy³¹czyæ?
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_09"); //Mo¿e zechcesz coœ u mnie kupiæ, jeœli dotrzemy na miejsce?
				
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
				AI_Output			(other, self, "DIA_Addon_Erol_Stoneplates_15_10"); //Mam tu coœ takiego...
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_11"); //Nie, to nie to. Tamte tabliczki by³y nas¹czone magi¹.
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_12"); //Mag, z którym ubi³em interes, nie bêdzie zainteresowany czymœ takim.
			}
			else
			{			
				AI_Output			(other, self, "DIA_Addon_Erol_Stoneplates_15_13"); //Ile ich brakuje?
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_14"); //Aby ocaliæ dobre imiê, potrzebujê trzech.
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

	description	 = 	"Jesteœ obywatelem miasta?";
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
	AI_Output	(other, self, "DIA_Addon_Erol_Buerger_15_00"); //Jesteœ obywatelem miasta?
	AI_Output	(self, other, "DIA_Addon_Erol_Buerger_10_01"); //Tak, ale to wkrótce siê zmieni. Nie cierpiê tych bufonów z górnego miasta.
	AI_Output	(self, other, "DIA_Addon_Erol_Buerger_10_02"); //Kiedyœ by³em wp³ywow¹ osob¹ w mieœcie, ale to by³o dawno temu.
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

	description	 = 	"Uda³o ci siê przepêdziæ bandytów?";
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
	AI_Output	(other, self, "DIA_Addon_Erol_PreTeach_15_00"); //Uda³o ci siê przepêdziæ bandytów?
	AI_Output	(self, other, "DIA_Addon_Erol_PreTeach_10_01"); //Tak, ale na pewno wci¹¿ czaj¹ siê w pobli¿u mostu.
	AI_Output	(other, self, "DIA_Addon_Erol_PreTeach_15_02"); //Mo¿esz mnie nauczyæ silniej uderzaæ?
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

	description	 = 	"Poka¿ mi swoje towary.";
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
	AI_Output	(self, other, "DIA_Addon_Erol_PreTrade_10_00"); //Niestety, nie mogê ci nic sprzedaæ. Ca³y mój towar le¿y w tej chwili pod mostem.
	AI_Output	(self, other, "DIA_Addon_Erol_PreTrade_10_01"); //Wrócê do interesu dopiero po powrocie do domu.

	if (MIS_Addon_Erol_BanditStuff != LOG_SUCCESS)
	{
		AI_Output	(self, other, "DIA_Addon_Erol_PreTrade_10_02"); //Ale nie wrócê, póki nie odzyskam swoich tabliczek.
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
	AI_Output	(other, self, "DIA_Addon_Erol_SLD_15_02"); //Nie masz ¿adnych k³opotów z najemnikami?
	AI_Output	(self, other, "DIA_Addon_Erol_SLD_10_03"); //Nie czepiaj¹ siê mnie, a ja nie mieszam siê do ich spraw.
	AI_Output	(self, other, "DIA_Addon_Erol_SLD_10_04"); //S¹ dobrymi klientami i za niewielk¹ op³at¹ pilnuj¹ mojej chaty, gdy mnie tu nie ma.
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
	description	 = 	"Poka¿ mi swoje towary.";
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
	AI_Output	(self, other, "DIA_Addon_Erol_Trade_10_00"); //Niestety, asortyment moich towarów nie jest zbyt du¿y.
	
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
	description = "Poka¿ mi, jak walczyæ z wiêksz¹ si³¹.";
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
	AI_Output (other,self ,"DIA_Addon_Erol_Teach_15_00"); //Poka¿ mi, jak walczyæ z wiêksz¹ si³¹.

	if (MIS_Addon_Erol_BanditStuff != LOG_SUCCESS)
	{
		AI_Output	(self, other, "DIA_Addon_Erol_Teach_10_01"); //Owszem, ale nie za darmo.
		AI_Output	(self, other, "DIA_Addon_Erol_Teach_10_02"); //Pomó¿ mi zachowaæ dobre imiê i znajdŸ moje kamienne tabliczki.
		AI_Output	(self, other, "DIA_Addon_Erol_Teach_10_03"); //Wtedy poka¿ê ci, jak wykorzystaæ sw¹ si³ê w walce.
	}
	else if (Erol_Bonus == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_00"); //Dobrze. Patrz uwa¿nie. To prosta, lecz u¿yteczna sztuczka.
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_01"); //Kiedy uderzasz, u¿ywaj si³y ca³ego cia³a, nie tylko ramion.
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_02"); //Kiedy wyci¹gasz ramiê, obróæ biodro.
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_03"); //Jeœli trochê poæwiczysz, zauwa¿ysz ró¿nicê.
		B_RaiseAttribute (other, ATR_STRENGTH, 1);
		Erol_Bonus = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_04"); //Jeœli chcesz podszkoliæ siê bardziej, musisz potrenowaæ.
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






