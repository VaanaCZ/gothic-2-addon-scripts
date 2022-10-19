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

	description	 = 	"Was ist los?";
};

func int DIA_Addon_Erol_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Erol_Hallo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Erol_Hallo_15_00"); //Was ist los?
	AI_Output	(self, other, "DIA_Addon_Erol_Hallo_10_01"); //(verärgert) Was los ist? Schau dir doch mal die Sauerei dort drüben unter der Brücke an.
	AI_Output	(self, other, "DIA_Addon_Erol_Hallo_10_02"); //(verärgert) Sowas habe ich mein ganzes Leben noch nicht erlebt. Diese Saubande sollte man ausräuchern, sag ich dir.
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

	description	 = 	"Was ist passiert?";
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
	AI_Output	(other, self, "DIA_Addon_Erol_what_15_00"); //Was ist passiert?
	AI_Output	(self, other, "DIA_Addon_Erol_what_10_01"); //Ich war mit meinen Gehilfen unterwegs, da kamen diese grässlichen Kerle wie aus dem nichts auf meinen Wagen gesprungen und haben alle niedergemetzelt.
	AI_Output	(self, other, "DIA_Addon_Erol_what_10_02"); //Ich kann von Glück sagen, dass ich auch heute noch einen ordentlichen rechten Haken verteilen kann, sonst hätten sie mich sicher auch noch erwischt.

	Log_CreateTopic (TOPIC_Addon_Erol, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Erol, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Erol,"Der Händler Erol ist von mehreren Banditen überfallen worden. Ihm sind sämtliche Waren gestohlen worden. Die Banditen auf der Brücke in der Nähe der Taverne 'Zur Toten Harpie' haben noch seine wertvollen Steintafeln. Die will Erol zurück haben."); 

	MIS_Addon_Erol_BanditStuff = LOG_RUNNING;

	Info_ClearChoices	(DIA_Addon_Erol_what);
	Info_AddChoice	(DIA_Addon_Erol_what, "Der Kram da unter der Brücke gehört dir?", DIA_Addon_Erol_what_dein );
	Info_AddChoice	(DIA_Addon_Erol_what, "Was waren das für Kerle?", DIA_Addon_Erol_what_wer );
};
func void DIA_Addon_Erol_what_back ()
{
	Info_ClearChoices	(DIA_Addon_Erol_what);
};
func void DIA_Addon_Erol_what_dein ()
{
	AI_Output (other, self, "DIA_Addon_Erol_what_dein_15_00"); //Der Kram da unter der Brücke gehört dir?
	AI_Output (self, other, "DIA_Addon_Erol_what_dein_10_01"); //Der Karren, die Waren, einfach alles.
	if (Npc_HasItems (other, itmi_erolskelch) > 0)
	{
		AI_Output (other, self, "DIA_Addon_Erol_what_dein_Add_15_00"); //Ich habe da ein bißchen was von deinem Kram eingesammelt..
		AI_Output (self, other, "DIA_Addon_Erol_what_dein_Add_10_01"); //Behalt das Zeug. Nichts davon ist wirklich von Wert für mich.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Erol_what_dein_Add_10_02"); //Aber nichts davon ist wirklich von Wert für mich.
	};
	AI_Output (self, other, "DIA_Addon_Erol_what_dein_10_02"); //Das einzige, was unersetzlich für mich ist, sind meine drei Steintafeln, die sie mir gestohlen haben.

	Info_AddChoice	(DIA_Addon_Erol_what, DIALOG_BACK, DIA_Addon_Erol_what_back );
	Info_AddChoice	(DIA_Addon_Erol_what, "Steintafeln?", DIA_Addon_Erol_what_Was );
};
func void DIA_Addon_Erol_what_Was ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_Was_15_00"); //Steintafeln?
	AI_Output			(self, other, "DIA_Addon_Erol_what_Was_10_01"); //Der Wassermagier in der Stadt will sie mir abkaufen und ich hab ihm die Dinger versprochen.
	AI_Output			(self, other, "DIA_Addon_Erol_what_Was_10_02"); //Ich will sie unbedingt wieder haben, sonst schadet das meinem guten Ruf.

	Info_AddChoice	(DIA_Addon_Erol_what, "Wo hattest du die Steintafeln her?", DIA_Addon_Erol_what_woher );
	Info_AddChoice	(DIA_Addon_Erol_what, "Was will ein Wassermagier damit?", DIA_Addon_Erol_what_KDW );
};
func void DIA_Addon_Erol_what_KDW ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_KDW_15_00"); //Was will ein Wassermagier damit?
	AI_Output			(self, other, "DIA_Addon_Erol_what_KDW_10_01"); //Er sagte, er wolle sie studieren und hat mich beauftragt, ihm mehr davon zu bringen.
};
func void DIA_Addon_Erol_what_woher ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_woher_15_00"); //Wo hattest du die Steintafeln her?
	AI_Output			(self, other, "DIA_Addon_Erol_what_woher_10_01"); //Ich hab sie bei alten Bauwerken, wie Mausoleen oder auch ab und zu in Höhlen gefunden.
	AI_Output			(self, other, "DIA_Addon_Erol_what_woher_10_02"); //Ich konnte schon eine ganze Menge an den Wassermagier in der Stadt verkaufen.
	AI_Output			(self, other, "DIA_Addon_Erol_what_woher_10_03"); //Hier unten sind sie jedoch eher selten. Im Nordosten von Khorinis war meine Ausbeute am Größten.

	Info_AddChoice	(DIA_Addon_Erol_what, "Warum suchst du dir nicht einfach neue?", DIA_Addon_Erol_what_neue );
};
func void DIA_Addon_Erol_what_neue ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_neue_15_00"); //Warum suchst du dir nicht einfach neue?
	AI_Output			(self, other, "DIA_Addon_Erol_what_neue_10_01"); //Bei der Keilerei mit den Banditen habe ich mir meinen Knöchel verstaucht.
	AI_Output			(self, other, "DIA_Addon_Erol_what_neue_10_02"); //Ich kann zwar noch laufen, aber sehr weit will ich mit dem schlimmen Fuß im Moment nicht gehen.
};
func void DIA_Addon_Erol_what_wer ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_wer_15_00"); //Was waren das für Kerle?
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_01"); //Die Banditen. Wer sonst? Sie haben die Brücke da oben in Beschlag genommen.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_02"); //Jeder, der die Brücke passieren will, wird von ihnen ausgeraubt.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_03"); //Ich wusste, dass sie dort oben auf der Lauer liegen, also bin ich unter der Brücke durch.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_04"); //Aber mein Karren und meine Waren waren eine zu verlockende Beute für sie.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_05"); //Die Mistkerle sind einfach von der Brücke gesprungen - direkt auf meinen Wagen.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_06"); //Ich hätte versuchen sollen, mich nachts vorbeizuschleichen ...
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

	description	 = 	"Ich brauche Informationen über eine Waffenlieferung an die Banditen.";
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
	AI_Output	(other, self, "DIA_Addon_Erol_FernandosWeapons_15_00"); //Ich brauche Informationen über eine Waffenlieferung an die Banditen.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_01"); //Waffenlieferung? Ja, die gab es. Irgendein Schwein aus der Stadt hat ihnen so viele Waffen verkauft, dass sie sie kaum schleppen konnten.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_02"); //Einige davon haben die Kerle auf der Brücke, bei der sie mich überfallen haben.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_03"); //Die anderen müssen irgendwo auf dem Weidenplateau bei Bengars Hof weitergezogen sein.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_04"); //Vielleicht wollten sie damit über den Pass.
	
	Info_ClearChoices	(DIA_Addon_Erol_FernandosWeapons);
	Info_AddChoice	(DIA_Addon_Erol_FernandosWeapons, DIALOG_BACK, DIA_Addon_Erol_FernandosWeapons_back );
	Info_AddChoice	(DIA_Addon_Erol_FernandosWeapons, "Wo ist das Weidenplateau?", DIA_Addon_Erol_FernandosWeapons_bengar );
};
func void DIA_Addon_Erol_FernandosWeapons_bengar ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_FernandosWeapons_bengar_15_00"); //Wo ist das Weidenplateau?
	AI_Output			(self, other, "DIA_Addon_Erol_FernandosWeapons_bengar_10_01"); //Etwa in der Mitte der Insel Khorinis liegt die Taverne von Orlan. Sie heißt 'Zur Toten Harpie'.
	AI_Output			(self, other, "DIA_Addon_Erol_FernandosWeapons_bengar_10_02"); //Von dort aus gibt es einen Weg Richtung Süden. Dort ist das Weidenplateau und der Eingang zum Pass ins Minental.
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

	description	 = 	"Wegen den Steintafeln...";
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
	AI_Output	(other, self, "DIA_Addon_Erol_Stoneplates_15_00"); //Wegen der Steintafeln ...

	if (Npc_HasItems (other,ItWr_StonePlateCommon_Addon) >= 1)
	{
			var int StoneplatesCount;
			var int XP_Addon_BringStoneplates;
			var int StoneplatesGeld;
		
			
			StoneplatesCount = Npc_HasItems(other, ItWr_StonePlateCommon_Addon);
		
		
			if (StoneplatesCount == 1)
				{
					AI_Output		(other, self, "DIA_Addon_Erol_Stoneplates_15_01"); //Ich hab hier eine.
					B_GivePlayerXP (XP_Addon_BringStoneplate);
					B_GiveInvItems (other, self, ItWr_StonePlateCommon_Addon, 1);
				
					StoneplatesCounter = StoneplatesCounter + 1;
					
				}
				else
				{
					AI_Output		(other, self, "DIA_Addon_Erol_Stoneplates_15_02"); //Ich hab einige davon.
		
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
				
				
			AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_03"); //Ich danke dir.
		
			if (StoneplatesCounter == 1)
			{
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_04"); //Jetzt fehlen mir noch 2.
			}
			else if	(StoneplatesCounter == 2)
			{
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_05"); //Eine fehlt mir jetzt noch.
			}
			else // mindestens 3 Steintafeln hat er schon.
			{
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_06"); //Das sind genug. Damit werde ich mein Versprechen bei dem Wassermagier der Stadt einlösen können und kann endlich wieder nach Hause.
				
				MIS_Addon_Erol_BanditStuff = LOG_SUCCESS;
				Wld_AssignRoomToGuild ("grpwaldhuette01",	GIL_PUBLIC);
			};
		
			AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_07"); //Natürlich werde ich sie dir bezahlen.

			StoneplatesGeld	= (Addon_ErolsStoneplatesOffer * Npc_HasItems (self, ItWr_StonePlateCommon_Addon ));
		
			CreateInvItems (self, ItMi_Gold, StoneplatesGeld); 
			B_GiveInvItems (self, other, ItMi_Gold, StoneplatesGeld);
			
			Npc_RemoveInvItems	(self ,ItWr_StonePlateCommon_Addon 	, Npc_HasItems (self, ItWr_StonePlateCommon_Addon ));//Joly: weil er zum Händler wird.
			
			if (MIS_Addon_Erol_BanditStuff == LOG_SUCCESS)
			{
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_08"); //Ich geh' jetzt heim. Komm mit, wenn du willst.
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_09"); //Vielleicht kann ich dir ein paar Dinge verkaufen, die dich interessieren könnten, wenn wir da sind.
				
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
				AI_Output			(other, self, "DIA_Addon_Erol_Stoneplates_15_10"); //Was ist denn mit dieser hier?
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_11"); //Nein. Solche Steintafeln sind magisch aufgeladen.
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_12"); //Tafeln dieser Art will der Wassermagier leider nicht kaufen.
			}
			else
			{			
				AI_Output			(other, self, "DIA_Addon_Erol_Stoneplates_15_13"); //Wie viele waren es denn?
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_14"); //Um meinen guten Ruf bei dem Wassermagier der Stadt zu retten, brauche ich 3 Tafeln.
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

	description	 = 	"Bist du ein Bürger der Stadt?";
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
	AI_Output	(other, self, "DIA_Addon_Erol_Buerger_15_00"); //Bist du ein Bürger der Stadt?
	AI_Output	(self, other, "DIA_Addon_Erol_Buerger_10_01"); //Schon lange nicht mehr, mein Junge. Ich habe nichts übrig für die korrupten Schweine im oberen Viertel von Khorinis.
	AI_Output	(self, other, "DIA_Addon_Erol_Buerger_10_02"); //Ich hatte dort früher einmal großen Einfluss, musst du wissen. Aber das ist schon einige Monde her.
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

	description	 = 	"Du hast die Banditen in die Flucht geschlagen?";
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
	AI_Output	(other, self, "DIA_Addon_Erol_PreTeach_15_00"); //Du hast die Banditen in die Flucht geschlagen?
	AI_Output	(self, other, "DIA_Addon_Erol_PreTeach_10_01"); //Ja. Aber sie sind bestimmt noch oben auf der Brücke.
	AI_Output	(other, self, "DIA_Addon_Erol_PreTeach_15_02"); //Kannst du mir beibringen, auch so hart zuzuschlagen?
	AI_Output	(self, other, "DIA_Addon_Erol_PreTeach_10_03"); //Sicher kann ich das.
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

	description	 = 	"Zeig mir deine Ware.";
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
	AI_Output	(self, other, "DIA_Addon_Erol_PreTrade_10_00"); //Ich kann dir nichts verkaufen. Mein ganzer Kram liegt dahinten unter der Brücke, Bursche.
	AI_Output	(self, other, "DIA_Addon_Erol_PreTrade_10_01"); //Ich kann dir erst wieder was verkaufen, wenn ich zu Hause bin.

	if (MIS_Addon_Erol_BanditStuff != LOG_SUCCESS)
	{
		AI_Output	(self, other, "DIA_Addon_Erol_PreTrade_10_02"); //Aber solange ich meine Steintafeln nicht wieder habe, gehe ich hier nicht weg.
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

	description	 = 	"Das hier ist DEINE Hütte?";
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
	AI_Output	(other, self, "DIA_Addon_Erol_SLD_15_00"); //(überrascht) Das hier ist DEINE Hütte?
	AI_Output	(self, other, "DIA_Addon_Erol_SLD_10_01"); //Ja. Warum? Was stimmt damit nicht?
	AI_Output	(other, self, "DIA_Addon_Erol_SLD_15_02"); //Hast du keine Probleme mit den Söldnern?
	AI_Output	(self, other, "DIA_Addon_Erol_SLD_10_03"); //Solange ich sie bei ihren Geschäften nicht störe, lassen sie mich auch in Ruhe.
	AI_Output	(self, other, "DIA_Addon_Erol_SLD_10_04"); //Außerdem sind es gute Kunden von mir und ich bezahle sie dafür, dass sie in meiner Abwesendheit auf mein Haus aufpassen.
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
	description	 = 	"Zeig mir deine Ware.";
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
	AI_Output	(self, other, "DIA_Addon_Erol_Trade_10_00"); //Die Auswahl ist nicht sehr groß.
	
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
	description = "Zeig mir, wie ich härter zuschlagen kann.";
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
	AI_Output (other,self ,"DIA_Addon_Erol_Teach_15_00"); //Zeig mir, wie ich härter zuschlagen kann.

	if (MIS_Addon_Erol_BanditStuff != LOG_SUCCESS)
	{
		AI_Output	(self, other, "DIA_Addon_Erol_Teach_10_01"); //Aber dafür bekomme ich auch was von dir.
		AI_Output	(self, other, "DIA_Addon_Erol_Teach_10_02"); //Hilf mir, meinen guten Ruf zu retten und bring mir meine Steintafeln zurück.
		AI_Output	(self, other, "DIA_Addon_Erol_Teach_10_03"); //Dann kann ich dir zeigen, wie du deine Stärke im Kampf besser einsetzt.
	}
	else if (Erol_Bonus == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_00"); //Gut. Pass auf. Es gibt einen einfachen Trick.
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_01"); //Wenn du zuschlägst, holst du nicht die Kraft aus dem Arm, sondern aus deinem ganzen Körper.
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_02"); //Dreh die Hüfte, zieh die Schulter nach vorne und gleichzeitig streckst du den Arm aus.
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_03"); //(lacht) Wenn du richtig triffst, wirst du den Unterschied merken!
		B_RaiseAttribute (other, ATR_STRENGTH, 1);
		Erol_Bonus = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_04"); //Wenn du noch mehr lernen willst, geht das nur über hartes Training...
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






