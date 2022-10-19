///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Pedro_DI_EXIT   (C_INFO)
{
	npc         = NOV_600_Pedro_DI;
	nr          = 999;
	condition   = DIA_Pedro_DI_EXIT_Condition;
	information = DIA_Pedro_DI_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Pedro_DI_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Pedro_DI_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Verr�ter
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_DI_YOU		(C_INFO)
{
	npc			 = 	NOV_600_Pedro_DI;
	nr			 = 	2;
	condition	 = 	DIA_Pedro_DI_YOU_Condition;
	information	 = 	DIA_Pedro_DI_YOU_Info;
	
	description	 = 	"�Traidor!";
	
};
func int DIA_Pedro_DI_YOU_Condition ()
{	
	return TRUE;
};

func void DIA_Pedro_DI_YOU_Info ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_00"); //�Traidor! Por fin te he encontrado.

		if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_01"); //No creas que voy a apiadarme de ti porque soy uno de los paladines.
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_02"); //Muchos de los mercenarios han vendido las almas a Beliar, y a menudo tengo remordimientos al matarlos como si tal cosa. Pero en tu caso, escoria, har� una excepci�n.
		};

		if (hero.guild == GIL_KDF)
		{
			AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_03"); //De todos los bastardos desalmados con los que me he topado en mi vida, t� eres el peor. Eres una verg�enza para la orden.
		};

	AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_04"); //Deber�a matarte ahora mismo.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_09_05"); //Basta, te lo suplico. Me han hechizado. Jam�s habr�a traicionado al monasterio por mi propia voluntad.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_09_06"); //No tienes ni idea de lo que he sufrido estos �ltimos d�as. Me han metido una voz en la cabeza y no pod�a defenderme de ella.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_09_07"); //El coronel orco me interrog� durante d�as y no dej� de pegarme. Perd�name la vida. Soy inocente. Tienes que creerme.
	
	Info_ClearChoices	(DIA_Pedro_DI_YOU);
	Info_AddChoice	(DIA_Pedro_DI_YOU, "Entonces, dime lo que sabes.", DIA_Pedro_DI_YOU_verschon );
	Info_AddChoice	(DIA_Pedro_DI_YOU, "No tengo que hacer nada. Voy a matarte ahora mismo.", DIA_Pedro_DI_YOU_tot );
	Info_AddChoice	(DIA_Pedro_DI_YOU, "Dame solo una raz�n para que te crea.", DIA_Pedro_DI_YOU_grund );
	if (MIS_Gorax_KillPedro == LOG_RUNNING)
	{
		Info_AddChoice	(DIA_Pedro_DI_YOU, "Serpentes me orden� que te matara.", DIA_Pedro_DI_YOU_Serpentes );
	};
};

func void DIA_Pedro_DI_YOU_grund ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_grund_15_00"); //Dame solo una raz�n para que te crea.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_grund_09_01"); //(Suplicante) D�jame vivir. Puedo darte informaci�n que te ayudar� a salir de aqu�. Tienes que escucharme.

};
var int PedroDI_Flee;
func void DIA_Pedro_DI_YOU_tot ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_tot_15_00"); //No tengo que hacer nada. Voy a matarte ahora mismo.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_tot_09_01"); //Por todos los dioses...

	AI_StopProcessInfos (self);

	Npc_ExchangeRoutine	(self,"Ship");
	B_Attack (self, other, AR_NONE, 1);
	PedroDI_Flee = LOG_RUNNING;
};

func void DIA_Pedro_DI_YOU_Serpentes ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_Serpentes_15_00"); //Serpentes me orden� que te matara y, por cuesti�n de principios, obedezco.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_Serpentes_09_01"); //(Suplicante) No, por favor. No lo hagas. A�n te puedo ser �til, ya ver�s.

	B_GivePlayerXP (XP_Pedro_SerpentesMission);
	MIS_Gorax_KillPedro = LOG_SUCCESS;	//Joly: bei erfolgreicher Mission in folgenden Dialogen muss hei�en; if ((Npc_IsDead(PedroDI)) && (MIS_Gorax_KillPedro == LOG_SUCCESS))

};

func void DIA_Pedro_DI_YOU_verschon ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_verschon_15_00"); //Entonces, dime lo que sabes.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_verschon_09_01"); //(Aliviado) S�, por supuesto. Te dir� todo lo que quieras saber... con una condici�n. Tienes que sacarme de esta isla maldita, �me oyes?
	
	Info_ClearChoices	(DIA_Pedro_DI_YOU);
	Info_AddChoice	(DIA_Pedro_DI_YOU, "No tengo que hacer nada. Voy a matarte ahora mismo.", DIA_Pedro_DI_YOU_tot );
	Info_AddChoice	(DIA_Pedro_DI_YOU, "De acuerdo. S�gueme, te llevar� al barco.", DIA_Pedro_DI_YOU_FollowShip );

};

var int MIS_Pedro_DI_FollowShip;
func void DIA_Pedro_DI_YOU_FollowShip ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_FollowShip_15_00"); //De acuerdo. S�gueme, te llevar� al barco.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_FollowShip_09_01"); //Gracias. No te vas a arrepentir.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"FollowShip");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	MIS_Pedro_DI_FollowShip = LOG_RUNNING;

};

///////////////////////////////////////////////////////////////////////
//	Info ArrivedAtShip
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_DI_ArrivedAtShip		(C_INFO)
{
	npc		 = 	NOV_600_Pedro_DI;
	nr		 = 	4;
	condition	 = 	DIA_Pedro_DI_ArrivedAtShip_Condition;
	information	 = 	DIA_Pedro_DI_ArrivedAtShip_Info;

	description	= "�Aqu� est�!";	
};

func int DIA_Pedro_DI_ArrivedAtShip_Condition ()
{
	if (Npc_GetDistToWP(self,"SHIP")<6000) 
	&& (MIS_Pedro_DI_FollowShip == LOG_RUNNING)
		{
				return TRUE;
		};
};

func void DIA_Pedro_DI_ArrivedAtShip_Info ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_15_00"); //�Aqu� est�!
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_09_01"); //Tienes un barco impresionante. Desde luego, eres un gran general.
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_15_02"); //Deja de balbucear y dime lo que quiero saber.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_09_03"); //Eh... claro. �Por d�nde empiezo?
	
	Info_ClearChoices	(DIA_Pedro_DI_ArrivedAtShip);
	Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "Ya he o�do bastante.", DIA_Pedro_DI_ArrivedAtShip_Back );
	Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "�C�mo se va al interior de la isla?", DIA_Pedro_DI_ArrivedAtShip_Innere );
	Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "�Qu� otros monstruos frecuentan esta isla?", DIA_Pedro_DI_ArrivedAtShip_Monster );
	Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "�Qu� hay de ese coronel orco?", DIA_Pedro_DI_ArrivedAtShip_OrkOberst );


};
func void DIA_Pedro_DI_ArrivedAtShip_OrkOberst ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_OrkOberst_15_00"); //�Qu� hay de ese coronel orco?
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_01"); //Me arrebat� la �ltima pizca de esperanza de volver a ver mi tierra natal.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_02"); //Desde que llegu�, me ha estado interrogando acerca del posicionamiento estrat�gico de los paladines en Khorinis.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_03"); //Por supuesto, no le dije gran cosa. �C�mo iba a hacerlo, maldita sea? Soy un novicio del fuego.
	
	if ((Npc_IsDead(OrkElite_AntiPaladinOrkOberst_DI)))
	{
		Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "El coronal orco ha muerto.", DIA_Pedro_DI_ArrivedAtShip_OberstTot );
	};
};

func void DIA_Pedro_DI_ArrivedAtShip_Monster ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_Monster_15_00"); //�Qu� otros monstruos frecuentan esta isla?
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Monster_09_01"); //Durante el d�a se suele ver al pueblo lagarto caminando hacia la costa. A menudo llevan huevos muy grandes.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Monster_09_02"); //Desde mi celda no ve�a demasiado, pero creo que se est�n preparando para marcharse de la isla.
};

func void DIA_Pedro_DI_ArrivedAtShip_Innere ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_Innere_15_00"); //�C�mo se va al interior de la isla?
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_01"); //Hay un pasadizo secreto en el sal�n del trono del coronel orco.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_02"); //Me arrastraban hasta all� cada vez que quer�an interrogarme, y lo vi.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_03"); //Uno de los chamanes pon�a en marcha un mecanismo al tirar de las antorchas colgadas en las paredes del sal�n.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_04"); //Um... creo que primero tiraba de la antorcha de la izquierda y luego de la que est� a la derecha, pero no me acuerdo bien.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_05"); //En la parte de atr�s se abr�a de pronto un pasadizo secreto que se adentraba en la monta�a.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_06"); //No s� d�nde acaba el pasadizo.

};

func void DIA_Pedro_DI_ArrivedAtShip_OberstTot ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_OberstTot_15_00"); //El coronel orco ha muerto.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_OberstTot_09_01"); //�Muerto? Alabado sea Innos. Jam�s olvidar� su repugnante rostro.

};

func void DIA_Pedro_DI_ArrivedAtShip_Back ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_Back_15_00"); //Ya he o�do bastante. B�scate un puesto en mi barco. A�n tienes cosas que hacer.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Back_09_01"); //Que el poder de Innos te acompa�e. Rezar� por ti.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Ship");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
};


///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_DI_PERM		(C_INFO)
{
	npc		 = 	NOV_600_Pedro_DI;
	nr		 = 	5;
	condition	 = 	DIA_Pedro_DI_PERM_Condition;
	information	 = 	DIA_Pedro_DI_PERM_Info;
	permanent	 = 	TRUE;

	description	 = 	"�Est�s cansado?";
};
var int PedroDI_TalkNomore;
func int DIA_Pedro_DI_PERM_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Pedro_DI_YOU))
	&& (PedroDI_TalkNomore == FALSE)
		{
				return TRUE;
		};
};
func void DIA_Pedro_DI_PERM_Info ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_PERM_15_00"); //�Est�s cansado?

	if (Npc_GetDistToWP(self,"SHIP_DECK_05")<1000) 
	{	
		if (PedroDI_Flee == LOG_RUNNING)
		{
			AI_Output			(other, self, "DIA_Pedro_DI_PERM_15_01"); //�Quieres que te traiga una almohada?
			AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_02"); //D�jame, por favor. Me quedar� muy quieto y no har� ruido.
			AI_Output			(other, self, "DIA_Pedro_DI_PERM_15_03"); //Um.
			B_GivePlayerXP (XP_Ambient);
			PedroDI_Flee = LOG_SUCCESS;
		}
		else if (Npc_IsDead(Dragon_Undead))
		{
			AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_04"); //Estoy agotado.
			AI_Output			(other, self, "DIA_Pedro_DI_PERM_15_05"); //M�tete en el sobre. Pronto zarparemos.
			AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_06"); //Gracias, t�o. Pensaba que me iba a caer de este banco. Buenas noches.
			AI_StopProcessInfos (self);
			Npc_ExchangeRoutine	(self,"SleepShip");
			self.aivar[AIV_PARTYMEMBER] = FALSE;
			PedroDI_TalkNomore = TRUE;
		}
		else
		{
			AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_07"); //No pasa nada. Gracias.
			AI_StopProcessInfos (self);
		};
	}
	else
	{
		AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_08"); //Por favor. �D�jame vivir!
		AI_StopProcessInfos (self);
	};
};

