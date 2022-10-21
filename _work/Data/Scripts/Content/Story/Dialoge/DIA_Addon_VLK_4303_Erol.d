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

	description	 = 	"Co se d�je?";
};

func int DIA_Addon_Erol_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Erol_Hallo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Erol_Hallo_15_00"); //Co se d�je?
	AI_Output	(self, other, "DIA_Addon_Erol_Hallo_10_01"); //(na�tvan�) Co se d�je? Jen se koukni na ten binec tady pod t�m mostem.
	AI_Output	(self, other, "DIA_Addon_Erol_Hallo_10_02"); //(na�tvan�) N�co takov�ho jsem v �ivot� nevid�l. Ty svin� by m�l n�kdo zlikvidovat, to ti pov�m.
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

	description	 = 	"Co se stalo?";
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
	AI_Output	(other, self, "DIA_Addon_Erol_what_15_00"); //Co se stalo?
	AI_Output	(self, other, "DIA_Addon_Erol_what_10_01"); //Byl jsem se svejma pomocn�kama zrovna na cest�, kdy� mi z�istajasna na v�z sko�ily tyhle hnusn� bestie a ka�d�ho zabily.
	AI_Output	(self, other, "DIA_Addon_Erol_what_10_02"); //M�m kliku, �e jsem je�t� nezapomn�l pravej h�k, jinak by bylo taky po mn�.

	Log_CreateTopic (TOPIC_Addon_Erol, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Erol, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Erol,"Obchodn�k Erol se stal ob�t� bandit�, kte�� se ut�bo�ili u mostu pobl� hospody U Mrtv� harpyje. Sebrali mu v�echno jeho zbo��, v�etn� jak�chsi cenn�ch kamenn�ch desek. Erol by byl velmi r�d, kdybych mu je p�inesl zp�t."); 

	MIS_Addon_Erol_BanditStuff = LOG_RUNNING;

	Info_ClearChoices	(DIA_Addon_Erol_what);
	Info_AddChoice	(DIA_Addon_Erol_what, "Tady ty v�ci jsou tvoje?", DIA_Addon_Erol_what_dein );
	Info_AddChoice	(DIA_Addon_Erol_what, "Kdo byli ti lid�?", DIA_Addon_Erol_what_wer );
};
func void DIA_Addon_Erol_what_back ()
{
	Info_ClearChoices	(DIA_Addon_Erol_what);
};
func void DIA_Addon_Erol_what_dein ()
{
	AI_Output (other, self, "DIA_Addon_Erol_what_dein_15_00"); //Ty v�ci pod mostem jsou tvoje?
	AI_Output (self, other, "DIA_Addon_Erol_what_dein_10_01"); //V�z, zbo��, v�ecko.
	if (Npc_HasItems (other, itmi_erolskelch) > 0)
	{
		AI_Output (other, self, "DIA_Addon_Erol_what_dein_Add_15_00"); //Koukni, n�jak� v�ci jsem ti na�el.
		AI_Output (self, other, "DIA_Addon_Erol_what_dein_Add_10_01"); //M��e� si je nechat. Te� u� pro m� v�ci ��dnou cenu nemaj�.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Erol_what_dein_Add_10_02"); //Ale pro m� u� ��dnou cenu nem� vlastn� nic.
	};
	AI_Output (self, other, "DIA_Addon_Erol_what_dein_10_02"); //Jedin� nenahraditeln� v�c, kterou mi sebrali, jsou t�i kamenn� tabulky.

	Info_AddChoice	(DIA_Addon_Erol_what, DIALOG_BACK, DIA_Addon_Erol_what_back );
	Info_AddChoice	(DIA_Addon_Erol_what, "Kamenn� tabulky?", DIA_Addon_Erol_what_Was );
};
func void DIA_Addon_Erol_what_Was ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_Was_15_00"); //Kamenn� tabulky?
	AI_Output			(self, other, "DIA_Addon_Erol_what_Was_10_01"); //Sl�bil jsem jednomu vodn�mu m�govi z m�sta, �e mu je p�inesu � cht�l je ode m� koupit.
	AI_Output			(self, other, "DIA_Addon_Erol_what_Was_10_02"); //Mus�m je z�skat zp�tky za ka�dou cenu, jinak bude moje pov�st v tahu.

	Info_AddChoice	(DIA_Addon_Erol_what, "Kde jsi z�skal ty kamenn� tabulky?", DIA_Addon_Erol_what_woher );
	Info_AddChoice	(DIA_Addon_Erol_what, "Co s nimi m�gov� vody cht�j� d�lat?", DIA_Addon_Erol_what_KDW );
};
func void DIA_Addon_Erol_what_KDW ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_KDW_15_00"); //Co s nimi chce d�lat?
	AI_Output			(self, other, "DIA_Addon_Erol_what_KDW_10_01"); //Pr� je chce studovat, a tak m� po��dal, abych mu p�inesl je�t� dal��.
};
func void DIA_Addon_Erol_what_woher ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_woher_15_00"); //Kde jsi na�el ty kamenn� tabulky?
	AI_Output			(self, other, "DIA_Addon_Erol_what_woher_10_01"); //Bejvaji u starejch budov, jako jsou mauzolea. A ob�as taky v jeskyn�ch.
	AI_Output			(self, other, "DIA_Addon_Erol_what_woher_10_02"); //U� jsem jich tomu vodn�mu m�govi ve m�st� prodal spoustu.
	AI_Output			(self, other, "DIA_Addon_Erol_what_woher_10_03"); //Ale tady jsou p�kn� vz�cn�. V�t�inu z nich jsem na�el severov�chodn� od Khorinidu.

	Info_AddChoice	(DIA_Addon_Erol_what, "Pro� se prost� nepoohl�dne� po nov�ch?", DIA_Addon_Erol_what_neue );
};
func void DIA_Addon_Erol_what_neue ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_neue_15_00"); //Pro� se prost� nepoohl�dne� po nov�ch?
	AI_Output			(self, other, "DIA_Addon_Erol_what_neue_10_01"); //V t� bitce s bandity jsem si vymknul kotn�k.
	AI_Output			(self, other, "DIA_Addon_Erol_what_neue_10_02"); //Sice m��u kulhat, ale p�ky s tou nohou moc daleko nedojdu.
};
func void DIA_Addon_Erol_what_wer ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_wer_15_00"); //Co to bylo za lidi?
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_01"); //Banditi, kdo jinej? Obsadili tady ten most.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_02"); //Okradou ka�d�ho, kdo se ho pokus� p�ej�t.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_03"); //J� v�d�l, �e tu n�kde �mejd�j, a tak jsem to vzal dolem, pod mostem.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_04"); //Jen�e m�j v�z a v�ecko to zbo�� pro n� nejsp� bylo moc velk� l�kadlo.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_05"); //Ti �mejdi prost� sesko�ili z mostu � p��mo na m�j v�z.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_06"); //M�l jsem se tam zkusit propl�it v noci.
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

	description	 = 	"Pot�ebuji informace o dod�vce zbran� pro bandity.";
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
	AI_Output	(other, self, "DIA_Addon_Erol_FernandosWeapons_15_00"); //Pot�ebuju informace o dod�vk�ch zbran� pro bandity.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_01"); //Dod�vky zbran�? Jo, o tom v�m. ��k� svin� z m�sta jim prodala tolik zbran�, �e je sotva unesou.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_02"); //N�kter� maj i na tom most�, kde m� ti gr�zlov� p�epadli.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_03"); //Zbytek nejsp� odtahali na n�horn� pastviny za Bengarov�m statkem.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_04"); //Mo�n� je ti lot�i cht�li p�ev�zt p�es pr�smyk.
	
	Info_ClearChoices	(DIA_Addon_Erol_FernandosWeapons);
	Info_AddChoice	(DIA_Addon_Erol_FernandosWeapons, DIALOG_BACK, DIA_Addon_Erol_FernandosWeapons_back );
	Info_AddChoice	(DIA_Addon_Erol_FernandosWeapons, "Kde jsou ty horn� pastviny?", DIA_Addon_Erol_FernandosWeapons_bengar );
};
func void DIA_Addon_Erol_FernandosWeapons_bengar ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_FernandosWeapons_bengar_15_00"); //Kde jsou ty n�horn� pastviny?
	AI_Output			(self, other, "DIA_Addon_Erol_FernandosWeapons_bengar_10_01"); //Orlanova hospoda le�� zhruba uprost�ed ostrova Khorinis. Jmenuje se U Mrtv� harpyje.
	AI_Output			(self, other, "DIA_Addon_Erol_FernandosWeapons_bengar_10_02"); //Odtud vede cesta k jihu a �st� pr�v� na n�horn� pastviny u vchodu do pr�smyku k Hornick�mu �dol�.
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

	description	 = 	"K t�m kamenn�m tabulk�m...";
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
	AI_Output	(other, self, "DIA_Addon_Erol_Stoneplates_15_00"); //Co se t��e t�ch kamenn�ch tabulek...

	if (Npc_HasItems (other,ItWr_StonePlateCommon_Addon) >= 1)
	{
			var int StoneplatesCount;
			var int XP_Addon_BringStoneplates;
			var int StoneplatesGeld;
		
			
			StoneplatesCount = Npc_HasItems(other, ItWr_StonePlateCommon_Addon);
		
		
			if (StoneplatesCount == 1)
				{
					AI_Output		(other, self, "DIA_Addon_Erol_Stoneplates_15_01"); //Jednu tady m�m.
					B_GivePlayerXP (XP_Addon_BringStoneplate);
					B_GiveInvItems (other, self, ItWr_StonePlateCommon_Addon, 1);
				
					StoneplatesCounter = StoneplatesCounter + 1;
					
				}
				else
				{
					AI_Output		(other, self, "DIA_Addon_Erol_Stoneplates_15_02"); //P�r jich tu m�m.
		
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
				
				
			AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_03"); //D�kuju.
		
			if (StoneplatesCounter == 1)
			{
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_04"); //Je�t� po��d mi chyb� dv�.
			}
			else if	(StoneplatesCounter == 2)
			{
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_05"); //Te� u� mi sch�z� jenom jedna.
			}
			else // mindestens 3 Steintafeln hat er schon.
			{
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_06"); //To sta��. Te� m��u dodr�et slovo, odn�st je do m�sta a pak se kone�n� vr�tit dom�.
				
				MIS_Addon_Erol_BanditStuff = LOG_SUCCESS;
				Wld_AssignRoomToGuild ("grpwaldhuette01",	GIL_PUBLIC);
			};
		
			AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_07"); //Samoz�ejm� ti za n� zaplat�m.

			StoneplatesGeld	= (Addon_ErolsStoneplatesOffer * Npc_HasItems (self, ItWr_StonePlateCommon_Addon ));
		
			CreateInvItems (self, ItMi_Gold, StoneplatesGeld); 
			B_GiveInvItems (self, other, ItMi_Gold, StoneplatesGeld);
			
			Npc_RemoveInvItems	(self ,ItWr_StonePlateCommon_Addon 	, Npc_HasItems (self, ItWr_StonePlateCommon_Addon ));//Joly: weil er zum H�ndler wird.
			
			if (MIS_Addon_Erol_BanditStuff == LOG_SUCCESS)
			{
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_08"); //Te� u� m��u j�t dom�. M��e� j�t se mnou, jestli chce�.
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_09"); //A� tam dojdem, moh bych ti p�r v�c� prodat, kdy� bude� cht�t.
				
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
				AI_Output			(other, self, "DIA_Addon_Erol_Stoneplates_15_10"); //A co tahle?
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_11"); //Ne, tahle kamenn� tabulka je magicky nabit�.
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_12"); //A vodn� m�gov� bohu�el tyhle tabulky nevykupujou.
			}
			else
			{			
				AI_Output			(other, self, "DIA_Addon_Erol_Stoneplates_15_13"); //Kolik jich bylo?
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_14"); //Abych si zachr�nil pov�st u vodn�ch m�g� ve m�st�, pot�ebuju t�i tabulky.
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

	description	 = 	"Ty jsi ob�anem m�sta?";
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
	AI_Output	(other, self, "DIA_Addon_Erol_Buerger_15_00"); //Ty jsi ob�anem m�sta?
	AI_Output	(self, other, "DIA_Addon_Erol_Buerger_10_01"); //U� jsem tam nebyl jak dlouho, hochu. Ale po t�ch �mejdech z horn� khorinidsk� �tvrti se mi teda ani trochu nestejsk�.
	AI_Output	(self, other, "DIA_Addon_Erol_Buerger_10_02"); //Kdysi jsem tam sice n�jakej vliv m�l, ale to u� je p�r m�s�c�.
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

	description	 = 	"Tys dok�zal zahnat bandity?";
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
	AI_Output	(other, self, "DIA_Addon_Erol_PreTeach_15_00"); //Tys ty bandity zahnal?
	AI_Output	(self, other, "DIA_Addon_Erol_PreTeach_10_01"); //Jo, ale ur�it� je�t� z�stali na most�.
	AI_Output	(other, self, "DIA_Addon_Erol_PreTeach_15_02"); //M��e� m� nau�it d�vat taky takov� r�ny?
	AI_Output	(self, other, "DIA_Addon_Erol_PreTeach_10_03"); //Samoz�ejm� �e m��u.
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

	description	 = 	"Uka� mi sv� zbo��.";
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
	AI_Output	(self, other, "DIA_Addon_Erol_PreTrade_10_00"); //Nic ti prodat nem��u � v�ecko zbo�� m�m tamhle pod mostem, hochu.
	AI_Output	(self, other, "DIA_Addon_Erol_PreTrade_10_01"); //Prodat ti n�co m��u, teprve a� se dostanu dom�.

	if (MIS_Addon_Erol_BanditStuff != LOG_SUCCESS)
	{
		AI_Output	(self, other, "DIA_Addon_Erol_PreTrade_10_02"); //Ale nem��u odsud odej�t, dokud nebudu m�t sv� kamenn� tabulky.
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

	description	 = 	"Tohle je TVOJE chatr�?";
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
	AI_Output	(other, self, "DIA_Addon_Erol_SLD_15_00"); //(p�ekvapen�) Tohle je TVOJE chatr�?
	AI_Output	(self, other, "DIA_Addon_Erol_SLD_10_01"); //Ano, pro�? Co je s n�?
	AI_Output	(other, self, "DIA_Addon_Erol_SLD_15_02"); //Nem� probl�my se �old�ky?
	AI_Output	(self, other, "DIA_Addon_Erol_SLD_10_03"); //Kdy� se jim nepletu do �emesla, tak m� taky nech�vaj na pokoji.
	AI_Output	(self, other, "DIA_Addon_Erol_SLD_10_04"); //Krom toho jsou dob�� z�kazn�ci, a kdy� jim zaplat�m, dohl�ej mi tu na bar�k, dokud se nevr�t�m.
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
	description	 = 	"Uka� mi sv� zbo��.";
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
	AI_Output	(self, other, "DIA_Addon_Erol_Trade_10_00"); //Ob�v�m se, �e moc velkej v�b�r nem�m.
	
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
	description = "Uka� mi, jak nep��tel�m zasazovat v�t�� r�ny.";
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
	AI_Output (other,self ,"DIA_Addon_Erol_Teach_15_00"); //Uka� mi, jak d�vat v�t�� r�ny.

	if (MIS_Addon_Erol_BanditStuff != LOG_SUCCESS)
	{
		AI_Output	(self, other, "DIA_Addon_Erol_Teach_10_01"); //Dob�e, ale nebude to zadarmo.
		AI_Output	(self, other, "DIA_Addon_Erol_Teach_10_02"); //Pomoz mi zachr�nit pov�st a p�ines mi m� ztracen� kamenn� tabulky.
		AI_Output	(self, other, "DIA_Addon_Erol_Teach_10_03"); //Pak ti uk�u, jak v boji co nejl�p vyu��vat vlastn� s�ly.
	}
	else if (Erol_Bonus == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_00"); //Dob�e, tak d�vej pozor. Uk�u ti jeden trik.
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_01"); //Kdy� n�komu d�v� r�nu, ned�lej to jen silou pa�e, ale vlo� do toho s�lu cel�ho t�la.
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_02"); //Pooto� t�lem, vystr� rameno dop�edu a z�rove� �vihni pa��.
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_03"); //(sm�je se) Kdy� se dob�e stref�, pozn� ten rozd�l.
		B_RaiseAttribute (other, ATR_STRENGTH, 1);
		Erol_Bonus = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_04"); //Jestli se chce� nau�it v�c, bude� muset tvrd� tr�novat.
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






