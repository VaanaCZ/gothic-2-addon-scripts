///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Regis_EXIT   (C_INFO)
{
	npc         = VLK_425_Regis;
	nr          = 999;
	condition   = DIA_Regis_EXIT_Condition;
	information = DIA_Regis_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Regis_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Regis_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Regis_PICKPOCKET (C_INFO)
{
	npc			= VLK_425_Regis;
	nr			= 900;
	condition	= DIA_Regis_PICKPOCKET_Condition;
	information	= DIA_Regis_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Regis_PICKPOCKET_Condition()
{
	C_Beklauen (40, 35);
};
 
FUNC VOID DIA_Regis_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Regis_PICKPOCKET);
	Info_AddChoice		(DIA_Regis_PICKPOCKET, DIALOG_BACK 		,DIA_Regis_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Regis_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Regis_PICKPOCKET_DoIt);
};

func void DIA_Regis_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Regis_PICKPOCKET);
};
	
func void DIA_Regis_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Regis_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Regis_Hallo		(C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	1;
	condition	 = 	DIA_Regis_Hallo_Condition;
	information	 = 	DIA_Regis_Hallo_Info;
	permanent    =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Regis_Hallo_Condition ()
{	
	if (Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};
func void DIA_Regis_Hallo_Info ()
{	
	AI_Output			(self, other, "DIA_Regis_Hallo_13_00"); //Oye, eres nuevo en la ciudad, �no?
	AI_Output			(other, self, "DIA_Regis_Hallo_15_01"); //S�, �y t�?
	AI_Output			(self, other, "DIA_Regis_Hallo_13_02"); //He venido del continente y ahora ando por aqu�. Casi no me queda dinero y supongo que lo �nico que puedo hacer es unirme a la milicia.
	AI_Output			(self, other, "DIA_Regis_Hallo_13_03"); //Pero no quiero hacer eso. No me dejar� asesinar por unos orcos de parte del Rey.
};
///////////////////////////////////////////////////////////////////////
//	Info MILIZ
///////////////////////////////////////////////////////////////////////
instance DIA_Regis_MILIZ		(C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	5;
	condition	 = 	DIA_Regis_MILIZ_Condition;
	information	 = 	DIA_Regis_MILIZ_Info;
	permanent    =  FALSE;
	description	 = 	"�Qu� puedes decirme de la milicia?";
};
func int DIA_Regis_MILIZ_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Regis_Hallo) 
	{
		return TRUE;
	};
};
func void DIA_Regis_MILIZ_Info ()
{
	AI_Output (other, self, "DIA_Regis_MILIZ_15_00"); //�Qu� puedes decirme de la milicia?
	AI_Output (self, other, "DIA_Regis_Add_13_01"); //Uno de los paladines se ha hecho cargo de ella. Un tal lord Andre.
	AI_Output (self, other, "DIA_Regis_Add_13_02"); //Est� intentando movilizar media cuidad en caso de que los orcos ataquen.
	AI_Output (self, other, "DIA_Regis_Add_13_03"); //Pero necesitas ser ciudadano para poder ser admitido.
	AI_Output (self, other, "DIA_Regis_Add_13_04"); //Por lo que yo s�, si no eres ciudadano, puedes entrenarte de todas formas, pero no ser�s admitido oficialmente.
};
///////////////////////////////////////////////////////////////////////
//	Info ANDRE
///////////////////////////////////////////////////////////////////////
instance DIA_Regis_ANDRE		(C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	5;
	condition	 = 	DIA_Regis_ANDRE_Condition;
	information	 = 	DIA_Regis_ANDRE_Info;
	permanent    =  FALSE;
	description	 = 	"�Qu� m�s puedes decirme sobre Lord Andre?";
};
func int DIA_Regis_ANDRE_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Regis_MILIZ) 
	{
		return TRUE;
	};
};
func void DIA_Regis_ANDRE_Info ()
{
	AI_Output (other, self, "DIA_Regis_ANDRE_15_00"); //�Qu� m�s puedes decirme sobre lord Andre?
	AI_Output (self, other, "DIA_Regis_Add_13_05"); //Tambi�n se ha hecho cargo del puesto de juez.
	AI_Output (self, other, "DIA_Regis_Add_13_06"); //Si causas alg�n problema en esta ciudad, tendr�s que responder ante �l.
	AI_Output (self, other, "DIA_Regis_Add_13_07"); //Una vez tuve una pelea con un ciudadano.
	AI_Output (self, other, "DIA_Regis_Add_13_08"); //Se fue llorando a ver a lord Andre y me delat�.
	AI_Output (self, other, "DIA_Regis_Add_13_09"); //Ese asuntillo me cost� 50 monedas de oro.
	AI_Output (self, other, "DIA_Regis_Add_13_10"); //Tuve suerte de que pas� por la noche y no me vio nadie m�s.
	AI_Output (self, other, "DIA_Regis_Add_13_11"); //Cuanta m�s gente se queje de ti en la ciudad, mayor ser� tu sanci�n.
};

// ****************************************************
// 					Pr�gelei mit Valentino
// ****************************************************
instance DIA_Regis_Valentino (C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	5;
	condition	 = 	DIA_Regis_Valentino_Condition;
	information	 = 	DIA_Regis_Valentino_Info;
	permanent    =  FALSE;
	description	 = 	"�Con qui�n te peleaste?";
};
func int DIA_Regis_Valentino_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Regis_ANDRE) 
	{
		return TRUE;
	};
};
func void DIA_Regis_Valentino_Info ()
{
	AI_Output (other, self, "DIA_Regis_Add_15_12"); //�Con qui�n te peleaste?
	AI_Output (self, other, "DIA_Regis_Add_13_13"); //Con un tipo llamado Valentino. Suele andar por la taberna, cerca del templo.
	AI_Output (self, other, "DIA_Regis_Add_13_14"); //No suelo ser una persona violenta, pero ESE tipo necesitaba que le partieran la cara urgentemente...
};

// ****************************************************
// 					Valentino DEFEATED
// ****************************************************
instance DIA_Regis_ValDefeat (C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	5;
	condition	 = 	DIA_Regis_ValDefeat_Condition;
	information	 = 	DIA_Regis_ValDefeat_Info;
	permanent    =  FALSE;
	description	 = 	"Me encontr� con Valentino...";
};
func int DIA_Regis_ValDefeat_Condition ()
{	
	if (Npc_KnowsInfo (other,DIA_Regis_Valentino))
	&& (Valentino.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Regis_ValDefeat_Info ()
{
	AI_Output (other, self, "DIA_Regis_Add_15_15"); //Me encontr� con Valentino...
	AI_Output (self, other, "DIA_Regis_Add_13_16"); //�Y?
	AI_Output (other, self, "DIA_Regis_Add_15_17"); //Le di una tremenda paliza...
	AI_Output (self, other, "DIA_Regis_Add_13_18"); //(Se r�e) Se la merec�a...
	if (!Npc_IsDead (Valentino))
	{
		AI_Output (self, other, "DIA_Regis_Add_13_19"); //Toma, encontr� este anillo sobre �l cuando nuestras peque�as diferencias se hab�an arreglado.
		B_GiveInvItems (self, other, ItRi_ValentinosRing, 1);
		Regis_Ring = TRUE;
		AI_Output (self, other, "DIA_Regis_Add_13_20"); //(Sonr�e) P�saselo a la pr�xima persona que le apalee...
	};
};

// **************************************************************
// 							PERM
// **************************************************************
//--------------------------
	var int Regis_Bogendieb;
//--------------------------
instance DIA_Regis_PERM		(C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr 			 =  200;
	condition	 = 	DIA_Regis_PERM_Condition;
	information	 = 	DIA_Regis_PERM_Info;
	permanent	 = 	TRUE;
	description	 = 	"�Ha ocurrido algo excitante?";
};
func int DIA_Regis_PERM_Condition ()
{
	return TRUE;
};
func void DIA_Regis_PERM_Info ()
{
	AI_Output (other, self, "DIA_Regis_PERM_15_00"); //�Ha ocurrido algo excitante?
	
	if (Regis_Bogendieb == FALSE)
	&& (MIS_Bosper_Bogen != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Regis_PERM_13_01"); //Podr�a decirse.
		AI_Output (self, other, "DIA_Regis_PERM_13_02"); //Han robado a Bosper el arquero. �Qu� cosa tan insolente!
		AI_Output (self, other, "DIA_Regis_PERM_13_03"); //El tipo entr� en la tienda a plena luz del d�a y se pill� un arco.
		AI_Output (self, other, "DIA_Regis_PERM_13_04"); //Y Bosper sali� tras �l, gritando: ''�detente ah� mismo, ladr�n!''. Pero el chorizo fue demasiado r�pido.
		
		
		MIS_Bosper_Bogen = LOG_RUNNING;
		Regis_Bogendieb = TRUE;
	}
	else if (MIS_Bosper_Bogen == LOG_SUCCESS)
		 && (Regis_Bogendieb != 2)	
	{
		AI_Output (self, other, "DIA_Regis_PERM_13_05"); //Y luego alguien mucho m�s honesto recuper� el arco de Bosper y se lo devolvi�.
		AI_Output (self, other, "DIA_Regis_PERM_13_06"); //Qu� raro. Uno piensa que esta �poca es puramente ego�sta, pero este t�o va y devuelve el arco.
		Regis_Bogendieb = 2;
	}
	else
	{
		if (Kapitel != 3)
		{
			AI_Output (self, other, "DIA_Regis_PERM_13_07"); //Bueno, todo est� tranquilo. Supongo que cuando los orcos lleguen, seguro que los veremos...
		}
		else 
		{
			if (MIS_RescueBennet == LOG_SUCCESS)
			{
				AI_Output (self, other, "DIA_Regis_PERM_13_08"); //Al final averiguaron que el mercenario es inocente y lo han soltado.
				AI_Output (self, other, "DIA_Regis_PERM_13_09"); //Lord Hagen debe estar hecho una furia.
			}
			else
			{
				AI_Output (self, other, "DIA_Regis_PERM_13_10"); //Toda la ciudad habla de ello. �Recuerdas a Lothar, el palad�n?
				AI_Output (other,self , "DIA_Regis_PERM_15_11"); //Tal vez.
				AI_Output (self, other, "DIA_Regis_PERM_13_12"); //Bueno, pues est� muerto. Asesinado en plena calle. Echan la culpa a los mercenarios, claro.
			};
		};
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Crew
///////////////////////////////////////////////////////////////////////
instance DIA_Regis_Crew		(C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	51;
	condition	 = 	DIA_Regis_Crew_Condition;
	information	 = 	DIA_Regis_Crew_Info;
	permanent    =  FALSE;
	description	 = 	"Estoy intentando encontrar tripulaci�n para un viaje por mar.";
};
func int DIA_Regis_Crew_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Regis_Crew_Info ()
{
	AI_Output			(other, self, "DIA_Regis_Crew_15_00"); //Estoy intentando encontrar tripulaci�n para un viaje por mar.
	AI_Output			(self, other, "DIA_Regis_Crew_13_01"); //No puedo ayudarte con eso. Deber�as echar un vistazo por el puerto, o quiz� en la taberna.
	AI_Output			(self, other, "DIA_Regis_Crew_13_02"); //Si queda alg�n marino por aqu�, seguro que lo encuentras all�.

};


