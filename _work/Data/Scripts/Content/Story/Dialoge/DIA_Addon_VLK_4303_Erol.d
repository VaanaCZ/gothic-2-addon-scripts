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

	description	 = 	"Co si� dzieje?";
};

func int DIA_Addon_Erol_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Erol_Hallo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Erol_Hallo_15_00"); //Co si� dzieje?
	AI_Output	(self, other, "DIA_Addon_Erol_Hallo_10_01"); //Co si� dzieje? Popatrz tylko pod most, a zrozumiesz.
	AI_Output	(self, other, "DIA_Addon_Erol_Hallo_10_02"); //Co� takiego widz� pierwszy raz w �yciu. Czemu nikt nie przep�dzi tych obwiesi�w?
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

	description	 = 	"Co si� sta�o?";
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
	AI_Output	(other, self, "DIA_Addon_Erol_what_15_00"); //Co si� sta�o?
	AI_Output	(self, other, "DIA_Addon_Erol_what_10_01"); //Jecha�em do miasta z moimi pomocnikami, kiedy nagle, ni st�d, ni zow�d, wyskoczyli na nas uzbrojeni bandyci.
	AI_Output	(self, other, "DIA_Addon_Erol_what_10_02"); //Na szcz�cie umiem si� broni�, bo podzieli�bym los pozosta�ych.

	Log_CreateTopic (TOPIC_Addon_Erol, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Erol, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Erol,"Kupiec Erol zosta� obrabowany przez bandyt�w i straci� wszystkie towary. Bandyci z mostu ko�o gospody 'Martwa Harpia' nadal maj� jego cenne kamienne tabliczki. Erol chce je odzyska�."); 

	MIS_Addon_Erol_BanditStuff = LOG_RUNNING;

	Info_ClearChoices	(DIA_Addon_Erol_what);
	Info_AddChoice	(DIA_Addon_Erol_what, "Ten sprz�t pod mostem nale�y do ciebie?", DIA_Addon_Erol_what_dein );
	Info_AddChoice	(DIA_Addon_Erol_what, "Kto ci� napad�?", DIA_Addon_Erol_what_wer );
};
func void DIA_Addon_Erol_what_back ()
{
	Info_ClearChoices	(DIA_Addon_Erol_what);
};
func void DIA_Addon_Erol_what_dein ()
{
	AI_Output (other, self, "DIA_Addon_Erol_what_dein_15_00"); //Ten sprz�t pod mostem nale�y do ciebie?
	AI_Output (self, other, "DIA_Addon_Erol_what_dein_10_01"); //Tak. W�zek, towary... Wszystko.
	if (Npc_HasItems (other, itmi_erolskelch) > 0)
	{
		AI_Output (other, self, "DIA_Addon_Erol_what_dein_Add_15_00"); //Znalaz�em troch� tego po drodze.
		AI_Output (self, other, "DIA_Addon_Erol_what_dein_Add_10_01"); //Mo�esz sobie zatrzyma� te bibeloty. Nie s� du�o warte.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Erol_what_dein_Add_10_02"); //Nic z tego nie ma dla mnie du�ej warto�ci.
	};
	AI_Output (self, other, "DIA_Addon_Erol_what_dein_10_02"); //Jedyn� naprawd� cenn� rzecz� by�y trzy kamienne tabliczki, kt�re te dranie oczywi�cie zrabowa�y!

	Info_AddChoice	(DIA_Addon_Erol_what, DIALOG_BACK, DIA_Addon_Erol_what_back );
	Info_AddChoice	(DIA_Addon_Erol_what, "Kamienne tabliczki?", DIA_Addon_Erol_what_Was );
};
func void DIA_Addon_Erol_what_Was ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_Was_15_00"); //Kamienne tabliczki?
	AI_Output			(self, other, "DIA_Addon_Erol_what_Was_10_01"); //Jeden z miejskich Mag�w Wody chcia� je ode mnie kupi�, a ja obieca�em mu je dostarczy�.
	AI_Output			(self, other, "DIA_Addon_Erol_what_Was_10_02"); //Musz� je za wszelk� cen� odzyska�. Inaczej moja reputacja legnie w gruzach.

	Info_AddChoice	(DIA_Addon_Erol_what, "Gdzie znalaz�e� te tabliczki?", DIA_Addon_Erol_what_woher );
	Info_AddChoice	(DIA_Addon_Erol_what, "Czemu ten mag tak bardzo si� nimi interesuje?", DIA_Addon_Erol_what_KDW );
};
func void DIA_Addon_Erol_what_KDW ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_KDW_15_00"); //Czemu ten mag tak bardzo si� nimi interesuje?
	AI_Output			(self, other, "DIA_Addon_Erol_what_KDW_10_01"); //Powiedzia�, �e potrzebne mu s� do bada� i poprosi�, �ebym rozejrza� si� za innymi tego typu przedmiotami.
};
func void DIA_Addon_Erol_what_woher ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_woher_15_00"); //Gdzie znalaz�e� te tabliczki?
	AI_Output			(self, other, "DIA_Addon_Erol_what_woher_10_01"); //Cz�� z nich znalaz�em w mauzoleach i podobnych budowlach, a cz�� - w jaskiniach.
	AI_Output			(self, other, "DIA_Addon_Erol_what_woher_10_02"); //Wi�kszo�� sprzeda�em temu magowi z Khorinis.
	AI_Output			(self, other, "DIA_Addon_Erol_what_woher_10_03"); //W tych okolicach ci�ko si� na nie natkn��. Najcz�ciej znajdowa�em je na p�nocny wsch�d od miasta.

	Info_AddChoice	(DIA_Addon_Erol_what, "Czemu po prostu nie poszukasz innych?", DIA_Addon_Erol_what_neue );
};
func void DIA_Addon_Erol_what_neue ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_neue_15_00"); //Czemu po prostu nie poszukasz innych?
	AI_Output			(self, other, "DIA_Addon_Erol_what_neue_10_01"); //Niestety, podczas walki z bandytami skr�ci�em kostk�.
	AI_Output			(self, other, "DIA_Addon_Erol_what_neue_10_02"); //Mog� chodzi�, ale podr�owanie i zwiedzanie jaski� raczej odpada.
};
func void DIA_Addon_Erol_what_wer ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_wer_15_00"); //Kto ci� napad�?
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_01"); //Bandyci, kt�by inny? Czaj� si� w pobli�u tego mostu.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_02"); //Kiedy kto� chce przejecha�, wpada w ich sid�a.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_03"); //Wiedzia�em, �e most jest ma�o bezpieczny, wi�c chcia�em si� przeprawi� pod nim.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_04"); //Ale widz�, �e mieli wielk� chrapk� na moje towary.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_05"); //Ci dranie skoczyli na nas z mostu, prosto na w�z.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_06"); //Powinienem by� pr�bowa� przekra�� si� pod os�on� nocy.
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

	description	 = 	"Potrzebuj� informacji o dostawie broni dla bandyt�w.";
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
	AI_Output	(other, self, "DIA_Addon_Erol_FernandosWeapons_15_00"); //Potrzebuj� informacji o dostawie broni dla bandyt�w.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_01"); //Dostawie broni? Tak, s�ysza�em o tym. Jaka� �winia z miasta sprzeda�a im jej tyle, �e ledwie mogli wszystko unie��.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_02"); //Ci, kt�rzy na mnie napadli, to cz�� ich szajki.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_03"); //Pozostali musieli schowa� si� gdzie� na p�askowy�u w pobli�u farmy Bengara.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_04"); //Mo�e pr�bowali pokona� prze��cz...
	
	Info_ClearChoices	(DIA_Addon_Erol_FernandosWeapons);
	Info_AddChoice	(DIA_Addon_Erol_FernandosWeapons, DIALOG_BACK, DIA_Addon_Erol_FernandosWeapons_back );
	Info_AddChoice	(DIA_Addon_Erol_FernandosWeapons, "Gdzie jest ten p�askowy�?", DIA_Addon_Erol_FernandosWeapons_bengar );
};
func void DIA_Addon_Erol_FernandosWeapons_bengar ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_FernandosWeapons_bengar_15_00"); //Gdzie jest ten p�askowy�?
	AI_Output			(self, other, "DIA_Addon_Erol_FernandosWeapons_bengar_10_01"); //W centrum wyspy Khorinis znajduje si� "Martwa Harpia", gospoda nale��ca do Orlana.
	AI_Output			(self, other, "DIA_Addon_Erol_FernandosWeapons_bengar_10_02"); //Od niej prowadzi �cie�ka na po�udnie, wiod�ca w�a�nie na �w p�askowy� i do G�rniczej Doliny.
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

	description	 = 	"Je�li chodzi o te tabliczki...";
};

func int DIA_Addon_Erol_Stoneplates_Condition ()
{
	if (MIS_Addon_Erol_BanditStuff == LOG_RUNNING)
		{
			return TRUE;
		};
};

var int StoneplatesCounter;
const int Addon_ErolsStoneplatesOffer = (Value_StonePlateCommon + 5); //Joly:Kohle f�r eine StonePlateCommon

func void DIA_Addon_Erol_Stoneplates_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Erol_Stoneplates_15_00"); //Je�li chodzi o te tabliczki...

	if (Npc_HasItems (other,ItWr_StonePlateCommon_Addon) >= 1)
	{
			var int StoneplatesCount;
			var int XP_Addon_BringStoneplates;
			var int StoneplatesGeld;
		
			
			StoneplatesCount = Npc_HasItems(other, ItWr_StonePlateCommon_Addon);
		
		
			if (StoneplatesCount == 1)
				{
					AI_Output		(other, self, "DIA_Addon_Erol_Stoneplates_15_01"); //Znalaz�em jedn� z nich...
					B_GivePlayerXP (XP_Addon_BringStoneplate);
					B_GiveInvItems (other, self, ItWr_StonePlateCommon_Addon, 1);
				
					StoneplatesCounter = StoneplatesCounter + 1;
					
				}
				else
				{
					AI_Output		(other, self, "DIA_Addon_Erol_Stoneplates_15_02"); //Znalaz�em kilka...
		
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
				
				
			AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_03"); //Wielkie dzi�ki.
		
			if (StoneplatesCounter == 1)
			{
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_04"); //Teraz brakuje mi tylko dw�ch.
			}
			else if	(StoneplatesCounter == 2)
			{
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_05"); //Brakuje jeszcze jednej.
			}
			else // mindestens 3 Steintafeln hat er schon.
			{
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_06"); //To ju� wszystkie. Teraz b�d� m�g� dobi� targu z magiem i wr�ci� do domu.
				
				MIS_Addon_Erol_BanditStuff = LOG_SUCCESS;
				Wld_AssignRoomToGuild ("grpwaldhuette01",	GIL_PUBLIC);
			};
		
			AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_07"); //Oczywi�cie zap�ac� ci za fatyg�.

			StoneplatesGeld	= (Addon_ErolsStoneplatesOffer * Npc_HasItems (self, ItWr_StonePlateCommon_Addon ));
		
			CreateInvItems (self, ItMi_Gold, StoneplatesGeld); 
			B_GiveInvItems (self, other, ItMi_Gold, StoneplatesGeld);
			
			Npc_RemoveInvItems	(self ,ItWr_StonePlateCommon_Addon 	, Npc_HasItems (self, ItWr_StonePlateCommon_Addon ));//Joly: weil er zum H�ndler wird.
			
			if (MIS_Addon_Erol_BanditStuff == LOG_SUCCESS)
			{
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_08"); //Wracam do domu. Chcesz si� do mnie przy��czy�?
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_09"); //Mo�e zechcesz co� u mnie kupi�, je�li dotrzemy na miejsce?
				
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
				AI_Output			(other, self, "DIA_Addon_Erol_Stoneplates_15_10"); //Mam tu co� takiego...
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_11"); //Nie, to nie to. Tamte tabliczki by�y nas�czone magi�.
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_12"); //Mag, z kt�rym ubi�em interes, nie b�dzie zainteresowany czym� takim.
			}
			else
			{			
				AI_Output			(other, self, "DIA_Addon_Erol_Stoneplates_15_13"); //Ile ich brakuje?
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_14"); //Aby ocali� dobre imi�, potrzebuj� trzech.
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

	description	 = 	"Jeste� obywatelem miasta?";
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
	AI_Output	(other, self, "DIA_Addon_Erol_Buerger_15_00"); //Jeste� obywatelem miasta?
	AI_Output	(self, other, "DIA_Addon_Erol_Buerger_10_01"); //Tak, ale to wkr�tce si� zmieni. Nie cierpi� tych bufon�w z g�rnego miasta.
	AI_Output	(self, other, "DIA_Addon_Erol_Buerger_10_02"); //Kiedy� by�em wp�ywow� osob� w mie�cie, ale to by�o dawno temu.
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

	description	 = 	"Uda�o ci si� przep�dzi� bandyt�w?";
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
	AI_Output	(other, self, "DIA_Addon_Erol_PreTeach_15_00"); //Uda�o ci si� przep�dzi� bandyt�w?
	AI_Output	(self, other, "DIA_Addon_Erol_PreTeach_10_01"); //Tak, ale na pewno wci�� czaj� si� w pobli�u mostu.
	AI_Output	(other, self, "DIA_Addon_Erol_PreTeach_15_02"); //Mo�esz mnie nauczy� silniej uderza�?
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

	description	 = 	"Poka� mi swoje towary.";
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
	AI_Output	(self, other, "DIA_Addon_Erol_PreTrade_10_00"); //Niestety, nie mog� ci nic sprzeda�. Ca�y m�j towar le�y w tej chwili pod mostem.
	AI_Output	(self, other, "DIA_Addon_Erol_PreTrade_10_01"); //Wr�c� do interesu dopiero po powrocie do domu.

	if (MIS_Addon_Erol_BanditStuff != LOG_SUCCESS)
	{
		AI_Output	(self, other, "DIA_Addon_Erol_PreTrade_10_02"); //Ale nie wr�c�, p�ki nie odzyskam swoich tabliczek.
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
	AI_Output	(other, self, "DIA_Addon_Erol_SLD_15_02"); //Nie masz �adnych k�opot�w z najemnikami?
	AI_Output	(self, other, "DIA_Addon_Erol_SLD_10_03"); //Nie czepiaj� si� mnie, a ja nie mieszam si� do ich spraw.
	AI_Output	(self, other, "DIA_Addon_Erol_SLD_10_04"); //S� dobrymi klientami i za niewielk� op�at� pilnuj� mojej chaty, gdy mnie tu nie ma.
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
	description	 = 	"Poka� mi swoje towary.";
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
	AI_Output	(self, other, "DIA_Addon_Erol_Trade_10_00"); //Niestety, asortyment moich towar�w nie jest zbyt du�y.
	
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
	description = "Poka� mi, jak walczy� z wi�ksz� si��.";
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
	AI_Output (other,self ,"DIA_Addon_Erol_Teach_15_00"); //Poka� mi, jak walczy� z wi�ksz� si��.

	if (MIS_Addon_Erol_BanditStuff != LOG_SUCCESS)
	{
		AI_Output	(self, other, "DIA_Addon_Erol_Teach_10_01"); //Owszem, ale nie za darmo.
		AI_Output	(self, other, "DIA_Addon_Erol_Teach_10_02"); //Pom� mi zachowa� dobre imi� i znajd� moje kamienne tabliczki.
		AI_Output	(self, other, "DIA_Addon_Erol_Teach_10_03"); //Wtedy poka�� ci, jak wykorzysta� sw� si�� w walce.
	}
	else if (Erol_Bonus == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_00"); //Dobrze. Patrz uwa�nie. To prosta, lecz u�yteczna sztuczka.
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_01"); //Kiedy uderzasz, u�ywaj si�y ca�ego cia�a, nie tylko ramion.
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_02"); //Kiedy wyci�gasz rami�, obr�� biodro.
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_03"); //Je�li troch� po�wiczysz, zauwa�ysz r�nic�.
		B_RaiseAttribute (other, ATR_STRENGTH, 1);
		Erol_Bonus = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_04"); //Je�li chcesz podszkoli� si� bardziej, musisz potrenowa�.
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






