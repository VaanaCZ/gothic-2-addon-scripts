///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Kati_EXIT   (C_INFO)
{
	npc         = BAU_941_Kati;
	nr          = 999;
	condition   = DIA_Kati_EXIT_Condition;
	information = DIA_Kati_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Kati_EXIT_Condition()
{
	if (Kapitel < 3)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Kati_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info SLDnochda
///////////////////////////////////////////////////////////////////////
instance DIA_Kati_SLDNOCHDA		(C_INFO)
{
	npc			 = 	BAU_941_Kati;
	nr			 = 	4;
	condition	 = 	DIA_Kati_SLDNOCHDA_Condition;
	information	 = 	DIA_Kati_SLDNOCHDA_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};
func int DIA_Kati_SLDNOCHDA_Condition ()
{
	if  !(Npc_IsDead (Alvares))
	&&  !(Npc_IsDead (Engardo))	
	&&  (Npc_IsInState (self,ZS_Talk))
	{
		return TRUE;
	};
};
func void DIA_Kati_SLDNOCHDA_Info ()
{
	//--------------------------------------
	var int Hilfe;
	//--------------------------------------
	
	if (Hilfe == FALSE)
	{
		AI_Output (self, other, "DIA_Kati_SLDNOCHDA_16_00"); //¡Esos asesinos amenazan a mi marido! ¡Somos ciudadanos leales al rey, y los mercenarios tienen pensado robarnos!
		Hilfe = TRUE;
	};
	AI_Output (self, other, "DIA_Kati_SLDNOCHDA_16_01"); //No te quedes ahí parado. ¡Haz algo! ¡Ayúdanos!
	Akils_SLDStillthere = TRUE;
	Log_CreateTopic (TOPIC_AkilsSLDStillthere, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AkilsSLDStillthere, LOG_RUNNING);
	B_LogEntry (TOPIC_AkilsSLDStillthere,"La granja de Akil está amenazada por mercenarios."); 

	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Kati_HALLO		(C_INFO)
{
	npc			 = 	BAU_941_Kati;
	nr			 = 	5;
	condition	 = 	DIA_Kati_HALLO_Condition;
	information	 = 	DIA_Kati_HALLO_Info;
	permanent 	 =  FALSE;
	description	 = 	"¿Estás bien?";
};

func int DIA_Kati_HALLO_Condition ()
{	
	if (Npc_IsDead (Alvares))
	&& (Npc_IsDead (Engardo))
	{
		return TRUE;
	};
};
func void DIA_Kati_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Kati_HALLO_15_00"); //¿Estás bien?
	
	if (Npc_IsDead (Akil))
	{
		AI_Output (self, other, "DIA_Kati_HALLO_16_01"); //(Solloza) ¡Mi querido marido ha muerto! Oh, Innos, ¿por qué me castigas con tanta dureza?
		
		Npc_ExchangeRoutine	(self,"Start");
		B_StartOtherRoutine	(Randolph,"Start");

		B_GivePlayerXP (XP_Akil_Tot);	
	}
	else
	{
		AI_Output (self, other, "DIA_Kati_HALLO_16_02"); //Nada, estoy bien, gracias.
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Essen
///////////////////////////////////////////////////////////////////////
instance DIA_Kati_ESSEN		(C_INFO)
{
	npc			 = 	BAU_941_Kati;
	nr			 = 	12;
	condition	 = 	DIA_Kati_ESSEN_Condition;
	information	 = 	DIA_Kati_ESSEN_Info;
	permanent 	 =  FALSE;
	description	 = 	"Akil me ha dicho que me vas a dar de comer.";
};

func int DIA_Kati_ESSEN_Condition ()
{
	if (Kati_Mahlzeit == TRUE)
	&& ((Npc_IsDead(Akil))== FALSE)
	{
		return TRUE;
	};
};
func void DIA_Kati_ESSEN_Info ()
{
	AI_Output (other, self, "DIA_Kati_ESSEN_15_00"); //Akil me ha dicho que me vas a dar de comer.
	AI_Output (self, other, "DIA_Kati_ESSEN_16_01"); //Desde que cayó la barrera lo hemos pasado muy mal y el país ya no es seguro.
	AI_Output (self, other, "DIA_Kati_ESSEN_16_02"); //Aquí tienes una barra de pan, algo de carne y un poco de agua. Me temo que no puedo ofrecerte nada más.
	
	B_GiveInvItems (self, other, ItFo_Bread, 1);			
	B_GiveInvItems (self, other, ItFo_Water, 1);			
	B_GiveInvItems (self, other, ItFoMutton, 1);			

};

///////////////////////////////////////////////////////////////////////
//	Info Akil ist tot Kati ist der Ersatz 
///////////////////////////////////////////////////////////////////////
instance DIA_Kati_Baltram		(C_INFO)
{
	npc			 = 	BAU_941_Kati;
	nr			 = 	4;
	condition	 = 	DIA_Kati_Baltram_Condition;
	information	 = 	DIA_Kati_Baltram_Info;
	permanent	 = 	FALSE;
	description	 = "Me manda Baltram...";
};
func int DIA_Kati_Baltram_Condition ()
{
	if  (Npc_IsDead (Akil))
	&&  (MIS_Baltram_ScoutAkil == LOG_RUNNING)
	&&  (Lieferung_Geholt == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Kati_Baltram_Info ()
{
	AI_Output (other, self, "DIA_Kati_Baltram_15_00"); //Me manda Baltram. Se supone que tengo que recoger un pedido para él.
	AI_Output (self, other, "DIA_Kati_Baltram_16_01"); //Sí, claro. Ten, ya lo he empaquetado.
	CreateInvItems 	(self, ItMi_BaltramPaket, 1 );
	B_GiveInvItems (self, other, ItMi_BaltramPaket,1);
	Lieferung_Geholt = TRUE;
};
	
///////////////////////////////////////////////////////////////////////
//	Info Bauernaufstand
///////////////////////////////////////////////////////////////////////
instance DIA_Kati_BAUERNAUFSTAND		(C_INFO)
{
	npc			 = 	BAU_941_Kati;
	nr			 = 	6;
	condition	 = 	DIA_Kati_BAUERNAUFSTAND_Condition;
	information	 = 	DIA_Kati_BAUERNAUFSTAND_Info;
	permanent    =  FALSE;
	description	 = 	"¿Por qué no os oponéis a la tiranía de Onar?";
};

func int DIA_Kati_BAUERNAUFSTAND_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Kati_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Kati_BAUERNAUFSTAND_Info ()
{
	AI_Output (other, self, "DIA_Kati_BAUERNAUFSTAND_15_00"); //¿Por qué no os oponéis a la tiranía de Onar?
	AI_Output (self, other, "DIA_Kati_BAUERNAUFSTAND_16_01"); //Para los granjeros que estamos cerca de la ciudad tiene más sentido estar a buenas con la milicia de la ciudad que confiar en los mercenarios de Onar.
	AI_Output (self, other, "DIA_Kati_BAUERNAUFSTAND_16_02"); //Por otro lado están Bengar y Sekob, que preferirían regalar sus granjas a trabajar para el rey.

};

///////////////////////////////////////////////////////////////////////
//	Info AndereHoefe
///////////////////////////////////////////////////////////////////////
instance DIA_Kati_ANDEREHOEFE		(C_INFO)
{
	npc			 = 	BAU_941_Kati;
	nr			 = 	7;
	condition	 = 	DIA_Kati_ANDEREHOEFE_Condition;
	information	 = 	DIA_Kati_ANDEREHOEFE_Info;
	permanent	 =  FALSE;
	description	 = 	"¿Dónde están las granjas de Bengar y de Sekob?";
};

func int DIA_Kati_ANDEREHOEFE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Kati_BAUERNAUFSTAND))
	{
		return TRUE;
	};
};

func void DIA_Kati_ANDEREHOEFE_Info ()
{
	AI_Output (other, self, "DIA_Kati_ANDEREHOEFE_15_00"); //¿Dónde están las granjas de Bengar y de Sekob?
	AI_Output (self, other, "DIA_Kati_ANDEREHOEFE_16_01"); //No están lejos de la granja donde vive el terrateniente. Desde aquí ve hacia el este y las encontrarás.
};

///////////////////////////////////////////////////////////////////////
//	Info HierWeg
///////////////////////////////////////////////////////////////////////
instance DIA_Kati_HIERWEG		(C_INFO)
{
	npc			 = 	BAU_941_Kati;
	nr			 = 	9;
	condition	 = 	DIA_Kati_HIERWEG_Condition;
	information	 = 	DIA_Kati_HIERWEG_Info;
	permanent	 =  FALSE;
	description	 = 	"¿Has pensado en mudarte de aquí?";
};

func int DIA_Kati_HIERWEG_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Kati_BAUERNAUFSTAND))
	{
		return TRUE;
	};
};

func void DIA_Kati_HIERWEG_Info ()
{
	AI_Output (other, self, "DIA_Kati_HIERWEG_15_00"); //¿Has pensado en mudarte de aquí?
	AI_Output (self, other, "DIA_Kati_HIERWEG_16_01"); //No es fácil salir de esta zona del país. Toda la región está rodeada de una cordillera alta e infranqueable.
	AI_Output (self, other, "DIA_Kati_HIERWEG_16_02"); //Las únicas dos salidas son el desfiladero que lleva al Valle de las Minas y el puerto.
	AI_Output (self, other, "DIA_Kati_HIERWEG_16_03"); //Como no nos podemos permitir los pasajes en un barco, y del Valle de las Minas no se vuelve, nos tenemos que quedar aquí.
};

///////////////////////////////////////////////////////////////////////
//	Info Pass
///////////////////////////////////////////////////////////////////////
instance DIA_Kati_PASS		(C_INFO)
{
	npc		 	 = 	BAU_941_Kati;
	nr			 = 	10;
	condition	 = 	DIA_Kati_PASS_Condition;
	information	 = 	DIA_Kati_PASS_Info;
	permanent	 =  FALSE;
	description	 = 	"¿Qué sabes del desfiladero?";
};

func int DIA_Kati_PASS_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Kati_HIERWEG))
	{
		return TRUE;
	};
};

func void DIA_Kati_PASS_Info ()
{
	AI_Output (other, self, "DIA_Kati_PASS_15_00"); //¿Qué sabes del desfiladero?
	AI_Output (self, other, "DIA_Kati_PASS_16_01"); //No he estado, pero debe de encontrarse cerca de la granja de Bengar, en la pradera alta.
};


///////////////////////////////////////////////////////////////////////
//	Info permKap1
///////////////////////////////////////////////////////////////////////
instance DIA_Kati_PERMKAP1		(C_INFO)
{
	npc			 = 	BAU_941_Kati;
	nr			 = 	11;
	condition	 = 	DIA_Kati_PERMKAP1_Condition;
	information	 = 	DIA_Kati_PERMKAP1_Info;
	permanent	 = 	TRUE;
	description	 = 	"Cuidado con tu marido.";
};

func int DIA_Kati_PERMKAP1_Condition ()
{
	if 	(
		(!C_NpcIsDown (Akil))
		&& (Npc_KnowsInfo(other, DIA_KATI_HALLO))
		&& (Npc_KnowsInfo(other, DIA_KATI_BAUERNAUFSTAND))
		&& (Npc_KnowsInfo(other, DIA_KATI_ANDEREHOEFE))
		&& (Npc_KnowsInfo(other, DIA_KATI_HIERWEG))
		&& (Npc_KnowsInfo(other, DIA_KATI_PASS))
		&& (Kapitel < 3)
		)
			{
					return TRUE;
			};
};

func void DIA_Kati_PERMKAP1_Info ()
{
	AI_Output			(other, self, "DIA_Kati_PERMKAP1_15_00"); //Cuidado con tu marido.
	AI_Output			(self, other, "DIA_Kati_PERMKAP1_16_01"); //Haré lo posible.
	AI_StopProcessInfos (self);
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

INSTANCE DIA_Kati_KAP3_EXIT(C_INFO)
{
	npc			= BAU_941_Kati;
	nr			= 999;
	condition	= DIA_Kati_KAP3_EXIT_Condition;
	information	= DIA_Kati_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Kati_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Kati_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Kati_PERM		(C_INFO)
{
	npc		 = 	BAU_941_Kati;
	nr		 = 	3;
	condition	 = 	DIA_Kati_PERM_Condition;
	information	 = 	DIA_Kati_PERM_Info;
	permanent	 = 	TRUE;

	description	 = 	"¿Qué tal va todo?";
};

func int DIA_Kati_PERM_Condition ()
{
	if (Kapitel >= 3)
	&& (Npc_KnowsInfo(other, DIA_Kati_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Kati_PERM_Info ()
{
	AI_Output			(other, self, "DIA_Kati_PERM_15_00"); //¿Qué tal va todo?
	AI_Output			(self, other, "DIA_Kati_PERM_16_01"); //Nos las apañamos. Me pregunto cuánto tiempo vamos a tener que soportar a esos demonios de negro.
	AI_Output			(self, other, "DIA_Kati_PERM_16_02"); //Ya no lo soporto. Se dedican a rondar la casa y a hacer ruidos raros.
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

INSTANCE DIA_Kati_KAP4_EXIT(C_INFO)
{
	npc			= BAU_941_Kati;
	nr			= 999;
	condition	= DIA_Kati_KAP4_EXIT_Condition;
	information	= DIA_Kati_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Kati_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Kati_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
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

INSTANCE DIA_Kati_KAP5_EXIT(C_INFO)
{
	npc			= BAU_941_Kati;
	nr			= 999;
	condition	= DIA_Kati_KAP5_EXIT_Condition;
	information	= DIA_Kati_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Kati_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Kati_KAP5_EXIT_Info()
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


INSTANCE DIA_Kati_KAP6_EXIT(C_INFO)
{
	npc			= BAU_941_Kati;
	nr			= 999;
	condition	= DIA_Kati_KAP6_EXIT_Condition;
	information	= DIA_Kati_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Kati_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Kati_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Kati_PICKPOCKET (C_INFO)
{
	npc			= BAU_941_Kati;
	nr			= 900;
	condition	= DIA_Kati_PICKPOCKET_Condition;
	information	= DIA_Kati_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20_Female;
};                       

FUNC INT DIA_Kati_PICKPOCKET_Condition()
{
	C_Beklauen (13, 15);
};
 
FUNC VOID DIA_Kati_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Kati_PICKPOCKET);
	Info_AddChoice		(DIA_Kati_PICKPOCKET, DIALOG_BACK 		,DIA_Kati_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Kati_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Kati_PICKPOCKET_DoIt);
};

func void DIA_Kati_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Kati_PICKPOCKET);
};
	
func void DIA_Kati_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Kati_PICKPOCKET);
};






























