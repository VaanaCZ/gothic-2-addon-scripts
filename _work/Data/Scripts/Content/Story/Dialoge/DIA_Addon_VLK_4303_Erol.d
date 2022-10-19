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

	description	 = 	"��Qu� pasa??";
};

func int DIA_Addon_Erol_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Erol_Hallo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Erol_Hallo_15_00"); //�Qu� ocurre?
	AI_Output	(self, other, "DIA_Addon_Erol_Hallo_10_01"); //(enfadado) �Qu� ocurre? Mira qu� desastre bajo ese puente de all�.
	AI_Output	(self, other, "DIA_Addon_Erol_Hallo_10_02"); //(enfadado) No he visto nada igual en toda mi vida. Habr�a que exterminar a esos cerdos, te lo digo.
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

	description	 = 	"�Qu� ha pasado?";
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
	AI_Output	(other, self, "DIA_Addon_Erol_what_15_00"); //�Qu� ha pasado?
	AI_Output	(self, other, "DIA_Addon_Erol_what_10_01"); //Pasaba por aqu� con mis ayudantes cuando  aparecieron esas bestias de la nada, saltaron a mi carro y masacraron a todo el mundo.
	AI_Output	(self, other, "DIA_Addon_Erol_what_10_02"); //Suerte que tengo un buen derechazo o me hubieran matado a m� tambi�n.

	Log_CreateTopic (TOPIC_Addon_Erol, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Erol, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Erol,"Unos bandidos atacaron al comerciante Erol. Le robaron todos sus bienes. Los bandidos del puente, junto a la taberna 'La arp�a muerta' conservan sus valiosas tablillas. Erol quiere recuperarlas."); 

	MIS_Addon_Erol_BanditStuff = LOG_RUNNING;

	Info_ClearChoices	(DIA_Addon_Erol_what);
	Info_AddChoice	(DIA_Addon_Erol_what, "�Todo eso de debajo del puente es tuyo?", DIA_Addon_Erol_what_dein );
	Info_AddChoice	(DIA_Addon_Erol_what, "�Qui�nes eran �sos?", DIA_Addon_Erol_what_wer );
};
func void DIA_Addon_Erol_what_back ()
{
	Info_ClearChoices	(DIA_Addon_Erol_what);
};
func void DIA_Addon_Erol_what_dein ()
{
	AI_Output (other, self, "DIA_Addon_Erol_what_dein_15_00"); //�Todo eso de debajo del puente es tuyo?
	AI_Output (self, other, "DIA_Addon_Erol_what_dein_10_01"); //El carro, la mercanc�a, todo.
	if (Npc_HasItems (other, itmi_erolskelch) > 0)
	{
		AI_Output (other, self, "DIA_Addon_Erol_what_dein_Add_15_00"); //Mira, te he recogido algunas cosas
		AI_Output (self, other, "DIA_Addon_Erol_what_dein_Add_10_01"); //Puedes qued�rtelo. Nada de eso tiene mucho valor para m�.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Erol_what_dein_Add_10_02"); //Pero nada de eso tiene mucho valor para m�.
	};
	AI_Output (self, other, "DIA_Addon_Erol_what_dein_10_02"); //Lo �nico que es irreemplazable son las tres tablillas de piedra que me han quitado.

	Info_AddChoice	(DIA_Addon_Erol_what, DIALOG_BACK, DIA_Addon_Erol_what_back );
	Info_AddChoice	(DIA_Addon_Erol_what, "�Tablillas de piedra?", DIA_Addon_Erol_what_Was );
};
func void DIA_Addon_Erol_what_Was ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_Was_15_00"); //�Tablillas de piedra?
	AI_Output			(self, other, "DIA_Addon_Erol_what_Was_10_01"); //El Mago de Agua de la ciudad quiere compr�rmelas y yo le promet� que se las conseguir�a.
	AI_Output			(self, other, "DIA_Addon_Erol_what_Was_10_02"); //Debo recuperarlas a toda costa o mi reputaci�n quedar� manchada.

	Info_AddChoice	(DIA_Addon_Erol_what, "�D�nde conseguiste esas tablillas de piedra?", DIA_Addon_Erol_what_woher );
	Info_AddChoice	(DIA_Addon_Erol_what, "�Para qu� las querr� un Mago de Agua?", DIA_Addon_Erol_what_KDW );
};
func void DIA_Addon_Erol_what_KDW ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_KDW_15_00"); //�Para qu� las querr� un Mago de Agua?
	AI_Output			(self, other, "DIA_Addon_Erol_what_KDW_10_01"); //Dijo que iba a estudiarlas y me pidi� que le llevara m�s.
};
func void DIA_Addon_Erol_what_woher ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_woher_15_00"); //�D�nde conseguiste esas tablillas de piedra?
	AI_Output			(self, other, "DIA_Addon_Erol_what_woher_10_01"); //Las he encontrado cerca de construcciones antiguas, como mausoleos, o incluso cuevas.
	AI_Output			(self, other, "DIA_Addon_Erol_what_woher_10_02"); //Ya le he vendido un mont�n al Mago de Agua de la ciudad.
	AI_Output			(self, other, "DIA_Addon_Erol_what_woher_10_03"); //Pero por aqu� no son muy comunes. Yo he encontrado casi todas al noreste de Khorinis.

	Info_AddChoice	(DIA_Addon_Erol_what, "�Y por qu� no vas a buscar otras?", DIA_Addon_Erol_what_neue );
};
func void DIA_Addon_Erol_what_neue ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_neue_15_00"); //�Y por qu� no vas a buscar otras?
	AI_Output			(self, other, "DIA_Addon_Erol_what_neue_10_01"); //Me hice un esguince en el tobillo durante la pelea con los bandidos.
	AI_Output			(self, other, "DIA_Addon_Erol_what_neue_10_02"); //Puedo ir cojeando, pero no quiero andar mucho con el pie as�.
};
func void DIA_Addon_Erol_what_wer ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_what_wer_15_00"); //�Qui�nes eran esos tipos?
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_01"); //Bandidos. �Qui�n si no? Han tomado el puente de ah� arriba.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_02"); //Roban a todo el que intenta cruzarlo.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_03"); //Sab�a que andaban por aqu�, por eso fui por debajo del puente.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_04"); //Pero les habr�n parecido muy tentadores mi carro y mis bienes .
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_05"); //Esos granujas saltaron sin m�s desde el puente, directamente a mi carro.
	AI_Output			(self, other, "DIA_Addon_Erol_what_wer_10_06"); //Tendr�a que haber intentado pasar de noche.
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

	description	 = 	"Necesito informaci�n sobre un env�o de armas para los bandidos.";
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
	AI_Output	(other, self, "DIA_Addon_Erol_FernandosWeapons_15_00"); //Necesito informaci�n sobre un env�o de armas para los bandidos.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_01"); //�Env�o de armas? S�, ya s� qu� dices. Alg�n malnacido de la ciudad les vendi� tantas armas que casi no pod�an ni llevarlas.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_02"); //Algunas las tienen en el puente donde esos bastardos me atacaron.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_03"); //El resto se las llevar�an a los altos pastos, m�s all� de la granja de Bengar.
	AI_Output	(self, other, "DIA_Addon_Erol_FernandosWeapons_10_04"); //Tan vez los bandidos quer�an llevarlas m�s all� del paso.
	
	Info_ClearChoices	(DIA_Addon_Erol_FernandosWeapons);
	Info_AddChoice	(DIA_Addon_Erol_FernandosWeapons, DIALOG_BACK, DIA_Addon_Erol_FernandosWeapons_back );
	Info_AddChoice	(DIA_Addon_Erol_FernandosWeapons, "�D�nde est�n esos altos pastos?", DIA_Addon_Erol_FernandosWeapons_bengar );
};
func void DIA_Addon_Erol_FernandosWeapons_bengar ()
{
	AI_Output			(other, self, "DIA_Addon_Erol_FernandosWeapons_bengar_15_00"); //�D�nde est�n esos altos pastos?
	AI_Output			(self, other, "DIA_Addon_Erol_FernandosWeapons_bengar_10_01"); //La taberna de Orlan est� m�s o menos en el centro de la isla de Khorinis. Se llama 'La arp�a feliz'.
	AI_Output			(self, other, "DIA_Addon_Erol_FernandosWeapons_bengar_10_02"); //Al sur de all� hay un camino que lleva a los altos pastos y a la entrada al paso del Valle de Minas.
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

	description	 = 	"Sobre las tablillas de piedra�";
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
	AI_Output	(other, self, "DIA_Addon_Erol_Stoneplates_15_00"); //Sobre esas tablillas de piedra

	if (Npc_HasItems (other,ItWr_StonePlateCommon_Addon) >= 1)
	{
			var int StoneplatesCount;
			var int XP_Addon_BringStoneplates;
			var int StoneplatesGeld;
		
			
			StoneplatesCount = Npc_HasItems(other, ItWr_StonePlateCommon_Addon);
		
		
			if (StoneplatesCount == 1)
				{
					AI_Output		(other, self, "DIA_Addon_Erol_Stoneplates_15_01"); //Tengo una aqu�.
					B_GivePlayerXP (XP_Addon_BringStoneplate);
					B_GiveInvItems (other, self, ItWr_StonePlateCommon_Addon, 1);
				
					StoneplatesCounter = StoneplatesCounter + 1;
					
				}
				else
				{
					AI_Output		(other, self, "DIA_Addon_Erol_Stoneplates_15_02"); //Tengo unas cuantas.
		
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
				
				
			AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_03"); //Gracias.
		
			if (StoneplatesCounter == 1)
			{
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_04"); //A�n me faltan dos.
			}
			else if	(StoneplatesCounter == 2)
			{
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_05"); //Ya s�lo me falta una.
			}
			else // mindestens 3 Steintafeln hat er schon.
			{
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_06"); //Ya est�. Ahora podr� cumplir la promesa que le hice al Mago de Agua de la ciudad e irme por fin a casa.
				
				MIS_Addon_Erol_BanditStuff = LOG_SUCCESS;
				Wld_AssignRoomToGuild ("grpwaldhuette01",	GIL_PUBLIC);
			};
		
			AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_07"); //Te pagar� por ellas, claro est�.

			StoneplatesGeld	= (Addon_ErolsStoneplatesOffer * Npc_HasItems (self, ItWr_StonePlateCommon_Addon ));
		
			CreateInvItems (self, ItMi_Gold, StoneplatesGeld); 
			B_GiveInvItems (self, other, ItMi_Gold, StoneplatesGeld);
			
			Npc_RemoveInvItems	(self ,ItWr_StonePlateCommon_Addon 	, Npc_HasItems (self, ItWr_StonePlateCommon_Addon ));//Joly: weil er zum H�ndler wird.
			
			if (MIS_Addon_Erol_BanditStuff == LOG_SUCCESS)
			{
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_08"); //Ahora me voy a casa. Si quieres, puedes acompa�arme.
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_09"); //Quiz� all� pueda venderte cosas que te interesen.
				
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
				AI_Output			(other, self, "DIA_Addon_Erol_Stoneplates_15_10"); //�Y qu� te parece esta?
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_11"); //No. Esta clase de tablilla de piedra tiene carga m�gica.
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_12"); //Es una pena, el Mago de Agua no compra estas tablillas.
			}
			else
			{			
				AI_Output			(other, self, "DIA_Addon_Erol_Stoneplates_15_13"); //�Cu�ntas hab�a?
				AI_Output			(self, other, "DIA_Addon_Erol_Stoneplates_10_14"); //Necesito 3 tablillas para salvar mi reputaci�n con el Mago de Agua en la ciudad.
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

	description	 = 	"�Eres de la ciudad?";
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
	AI_Output	(other, self, "DIA_Addon_Erol_Buerger_15_00"); //�Eres de la ciudad?
	AI_Output	(self, other, "DIA_Addon_Erol_Buerger_10_01"); //Hace a�os que no soy ciudadano, amigo. Esos bastardos corruptos del barrio alto de Khorinis y yo no nos tenemos mucho aprecio.
	AI_Output	(self, other, "DIA_Addon_Erol_Buerger_10_02"); //Antes ten�a bastante influencia en la zona, ya sabes. Pero eso era hace meses.
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

	description	 = 	"�Has conseguido alejar a los bandidos?";
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
	AI_Output	(other, self, "DIA_Addon_Erol_PreTeach_15_00"); //�Has conseguido alejar a los bandidos?
	AI_Output	(self, other, "DIA_Addon_Erol_PreTeach_10_01"); //S�, pero seguro que siguen por el puente.
	AI_Output	(other, self, "DIA_Addon_Erol_PreTeach_15_02"); //�Puedes ense�arme a golpear as�?
	AI_Output	(self, other, "DIA_Addon_Erol_PreTeach_10_03"); //Pues claro que s�.
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

	description	 = 	"Ens��ame tu mercanc�a.";
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
	AI_Output	(self, other, "DIA_Addon_Erol_PreTrade_10_00"); //No te puedo vender nada. Todo lo que ten�a est� ah�, bajo el puente.
	AI_Output	(self, other, "DIA_Addon_Erol_PreTrade_10_01"); //S�lo podr� venderte algo cuando vuelva a casa.

	if (MIS_Addon_Erol_BanditStuff != LOG_SUCCESS)
	{
		AI_Output	(self, other, "DIA_Addon_Erol_PreTrade_10_02"); //Pero no me mover� de aqu� hasta recuperar mis tablillas de piedra.
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

	description	 = 	"�Esta es TU caba�a?";
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
	AI_Output	(other, self, "DIA_Addon_Erol_SLD_15_00"); //(sorprendido) �Esta de aqu� es TU caba�a?
	AI_Output	(self, other, "DIA_Addon_Erol_SLD_10_01"); //S�, �por qu�? �Tiene algo de malo?
	AI_Output	(other, self, "DIA_Addon_Erol_SLD_15_02"); //�No tienes problemas con los mercenarios?
	AI_Output	(self, other, "DIA_Addon_Erol_SLD_10_03"); //Mientras yo no interfiera en sus negocios, ellos tambi�n me dejan en paz.
	AI_Output	(self, other, "DIA_Addon_Erol_SLD_10_04"); //Adem�s, son incluso buenos clientes y les pago por vigilarme la casa cuando yo no estoy.
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
	description	 = 	"Ens��ame tu mercanc�a.";
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
	AI_Output	(self, other, "DIA_Addon_Erol_Trade_10_00"); //Tampoco es que haya mucha alternativa.
	
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
	description = "Ens��ame a dar golpes m�s fuertes.";
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
	AI_Output (other,self ,"DIA_Addon_Erol_Teach_15_00"); //Ens��ame a dar golpes m�s fuertes.

	if (MIS_Addon_Erol_BanditStuff != LOG_SUCCESS)
	{
		AI_Output	(self, other, "DIA_Addon_Erol_Teach_10_01"); //Muy bien, pero estar�s en deuda conmigo.
		AI_Output	(self, other, "DIA_Addon_Erol_Teach_10_02"); //Ay�dame a salvar mi reputaci�n y recuperar mis tablillas de piedra.
		AI_Output	(self, other, "DIA_Addon_Erol_Teach_10_03"); //Si lo haces, te ense�ar� a aprovechar mejor tu fuerza en combate.
	}
	else if (Erol_Bonus == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_00"); //Bien. Atento. Hay un truco muy sencillo.
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_01"); //Cuando golpees, no lo hagas con la fuerza de tu brazo, sino con la de todo el cuerpo.
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_02"); //Gira la cadera, adelanta los hombros y lanza el brazo a la vez.
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_03"); //(r�e) �Si golpeas como es debido, notar�s la diferencia!
		B_RaiseAttribute (other, ATR_STRENGTH, 1);
		Erol_Bonus = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Erol_Teach_Add_10_04"); //Si quieres aprender m�s, tendr�s que entrenar duro
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






