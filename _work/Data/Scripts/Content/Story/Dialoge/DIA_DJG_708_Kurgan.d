
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_Kurgan_EXIT   (C_INFO)
{
	npc         = DJG_708_Kurgan;
	nr          = 999;
	condition   = DIA_Kurgan_EXIT_Condition;
	information = DIA_Kurgan_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Kurgan_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Kurgan_EXIT_Info()
{
	AI_StopProcessInfos (self);
	Npc_SetRefuseTalk (Biff,400);	//Joly: Damit Biff nicht sofort am Anfang Kohle einfordert.
};

//************************************************************************
//	Hello
//************************************************************************
instance DIA_Kurgan_HELLO		(C_INFO)
{
	npc		 	= 	DJG_708_Kurgan;
	condition	= 	DIA_Kurgan_HELLO_Condition;
	information	= 	DIA_Kurgan_HELLO_Info;

	important	= 	TRUE;
};

func int DIA_Kurgan_HELLO_Condition ()
{
	return TRUE;
};

func void DIA_Kurgan_HELLO_Info ()
{
	AI_Output			(self ,other, "DIA_Kurgan_HELLO_01_00"); //¡Eh, tú! Los tipos como tú deberían tener cuidado de adónde van.
	AI_Output			(other,self , "DIA_Kurgan_HELLO_15_01"); //¿Qué tratas de decirme?
	AI_Output			(self ,other, "DIA_Kurgan_HELLO_01_02"); //Me refiero a que este aire no es saludable. La región está infestada de orcos y monstruos.
	AI_Output			(self ,other, "DIA_Kurgan_HELLO_01_03"); //Por no hablar de los dragones. No es más que una advertencia bienintencionada.
	B_LogEntry (TOPIC_Dragonhunter,"Un grupo de cazadores de dragones me ha recibido en la entrada del Valle de las Minas. Parecen bien armados, pero me temo que no saben mucho de dragones.");
};

//**************************************************************************
//	Was sonst noch?
//**************************************************************************

instance DIA_Kurgan_ELSE		(C_INFO)
{
	npc		 	= 	DJG_708_Kurgan;
	condition	= 	DIA_Kurgan_ELSE_Condition;
	information	= 	DIA_Kurgan_ELSE_Info;
	description	= 	"¿Puedes contarme algo que aún no sepa?";

};

func int DIA_Kurgan_ELSE_Condition ()
{
	return TRUE;
};

func void DIA_Kurgan_ELSE_Info ()
{
	AI_Output			(other,self , "DIA_Kurgan_ELSE_15_00"); //¿Puedes contarme algo que aún no sepa?
	AI_Output			(self ,other, "DIA_Kurgan_ELSE_01_01"); //Puedo darte un buen consejo, y es gratis.
	AI_Output			(self ,other, "DIA_Kurgan_ELSE_01_02"); //Aquí no nos resulta útil alguien que se desmaya en cuanto un dragón se tira un pedo.
	AI_Output			(self ,other, "DIA_Kurgan_ELSE_01_03"); //Vete a casa, éste es un trabajo para hombres de verdad.
	
};

//**************************************************************************
//	Bist du hier der Anführer?
//**************************************************************************

instance DIA_Kurgan_Leader		(C_INFO)
{
	npc		 	= 	DJG_708_Kurgan;
	condition	= 	DIA_Kurgan_Leader_Condition;
	information	= 	DIA_Kurgan_Leader_Info;
	description	= 	"¿Eres el jefe?";

};

func int DIA_Kurgan_Leader_Condition ()
{
	return TRUE;
};

func void DIA_Kurgan_Leader_Info ()
{
	AI_Output			(other,self , "DIA_Kurgan_Leader_15_00"); //¿Eres el jefe?
	AI_Output			(self ,other, "DIA_Kurgan_Leader_01_01"); //¿Lo parezco? Claro que no. No necesitamos que un fantoche engreído nos mandonee.
	AI_Output			(self ,other, "DIA_Kurgan_Leader_01_02"); //Cuando Sylvio intentó comportarse como si fuera el jefe, tanto a él como a sus amigos les dejamos claro lo que opinábamos al respecto.
	AI_Output			(self ,other, "DIA_Kurgan_Leader_01_03"); //Hubo una pelea, y al final se largaron.
	AI_Output			(self ,other, "DIA_Kurgan_Leader_01_04"); //Espero que Sylvio acabe en la sopera de algún orco.
};

//**************************************************************************
//	Wolltet ihr nicht ein paar Drachen töten?
//**************************************************************************

instance DIA_Kurgan_KillDragon		(C_INFO)
{
	npc		 	= 	DJG_708_Kurgan;
	condition	= 	DIA_Kurgan_KillDragon_Condition;
	information	= 	DIA_Kurgan_KillDragon_Info;
	description	= 	"¿Así que quieres matar dragones?";

};

func int DIA_Kurgan_KillDragon_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Kurgan_Leader))
		{
				return TRUE;
		};
};
var int Kurgan_KillDragon_Day;
func void DIA_Kurgan_KillDragon_Info ()
{
	AI_Output			(other,self , "DIA_Kurgan_KillDragon_15_00"); //(Burlón) ¿Quieres matar dragones?
	AI_Output			(self ,other, "DIA_Kurgan_KillDragon_01_01"); //Listillo. ¿Así que sabes matar dragones?
	AI_Output			(self ,other, "DIA_Kurgan_KillDragon_01_02"); //¿Crees que el animal se queda cruzado de brazos mientras le cortas la cabeza?
	AI_Output			(self ,other, "DIA_Kurgan_KillDragon_01_03"); //Algo así se tiene que planificar con cuidado, y luego hay que actuar con decisión.
	AI_Output			(other,self , "DIA_Kurgan_KillDragon_15_04"); //Entiendo. Y, ¿cómo vais a hacerlo?
	AI_Output			(self ,other, "DIA_Kurgan_KillDragon_01_05"); //En primer lugar, descubriremos la posición de las bestias.
	AI_Output			(self ,other, "DIA_Kurgan_KillDragon_01_06"); //Solo entonces pensaremos en la mejor manera de atacar.

	
	Kurgan_KillDragon_Day = Wld_GetDay(); 

	Info_AddChoice	(DIA_Kurgan_KillDragon, "Me encantaría ver cómo lo hacéis, pero tengo que ponerme en camino.", DIA_Kurgan_KillDragon_weg );
	Info_AddChoice	(DIA_Kurgan_KillDragon, "¿Como vais a hacer que los orcos os dejen pasar?"					, DIA_Kurgan_KillDragon_orks );
	Info_AddChoice	(DIA_Kurgan_KillDragon, "Creo que no sois capaces de encontrar ni a una oveja ciega.", DIA_Kurgan_KillDragon_spott );


};
func void DIA_Kurgan_KillDragon_spott ()
{
	AI_Output			(other, self, "DIA_Kurgan_KillDragon_spott_15_00"); //Creo que no sois capaces de encontrar ni a una oveja ciega.
	AI_Output			(self, other, "DIA_Kurgan_KillDragon_spott_01_01"); //¿Qué? ¿Quieres que te parta esa cara de imbécil?
	AI_StopProcessInfos (self);

	B_Attack (self, other, AR_NONE, 1);	
};

func void DIA_Kurgan_KillDragon_orks ()
{
	AI_Output			(other, self, "DIA_Kurgan_KillDragon_orks_15_00"); //¿Como vais a hacer que los orcos os dejen pasar?
	AI_Output			(self, other, "DIA_Kurgan_KillDragon_orks_01_01"); //Ya nos ocuparemos de estos detalles más adelante.

};

func void DIA_Kurgan_KillDragon_weg ()
{
	AI_Output			(other, self, "DIA_Kurgan_KillDragon_weg_15_00"); //Me encantaría ver cómo lo hacéis, pero tengo que ponerme en camino.
	AI_Output			(self, other, "DIA_Kurgan_KillDragon_weg_01_01"); //Vuelve por el desfiladero si no quieres perder un par de extremidades.

	AI_StopProcessInfos (self);
};
	
///////////////////////////////////////////////////////////////////////
//	Info SEENDRAGON
///////////////////////////////////////////////////////////////////////
instance DIA_Kurgan_SEENDRAGON		(C_INFO)
{
	npc		 = 	DJG_708_Kurgan;
	condition	 = 	DIA_Kurgan_SEENDRAGON_Condition;
	information	 = 	DIA_Kurgan_SEENDRAGON_Info;
	permanent	 = 	TRUE;

	description	 = 	"¿Habéis visto ya a algún dragón?";
};

func int DIA_Kurgan_SEENDRAGON_Condition ()
{
	if (Kurgan_KillDragon_Day<=(Wld_GetDay()-2))
		{
				return TRUE;
		};
};

func void DIA_Kurgan_SEENDRAGON_Info ()
{
	AI_Output			(other, self, "DIA_Kurgan_SEENDRAGON_15_00"); //¿Habéis visto ya a algún dragón?
	AI_Output			(self, other, "DIA_Kurgan_SEENDRAGON_01_01"); //Por ahora no, pero esas bestias no van a poder esconderse eternamente.
};

//*********************************************************************
//	AllDragonsDead 
//*********************************************************************
INSTANCE DIA_Kurgan_AllDragonsDead   (C_INFO)
{
	npc         = DJG_708_Kurgan;
	nr          = 5;
	condition   = DIA_Kurgan_AllDragonsDead_Condition;
	information = DIA_Kurgan_AllDragonsDead_Info;
	permanent   = FALSE;
	description	= "Los dragones están muertos.";
				
};

FUNC INT DIA_Kurgan_AllDragonsDead_Condition()
{
	if (MIS_AllDragonsDead == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Kurgan_AllDragonsDead_Info()
{
	AI_Output	(other,self ,"DIA_Kurgan_AllDragonsDead_15_00"); //Los dragones están muertos.
	AI_Output 	(self ,other,"DIA_Kurgan_AllDragonsDead_01_01"); //Ja, y ¿quién se supone que los ha matado? ¿Los paladines?
	AI_Output 	(other,self ,"DIA_Kurgan_AllDragonsDead_15_02"); //He sido yo.
	AI_Output 	(self ,other,"DIA_Kurgan_AllDragonsDead_01_03"); //(Se ríe) Ja. Ni tú te lo crees. No me cabrees.
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Kurgan_PICKPOCKET (C_INFO)
{
	npc			= DJG_708_Kurgan;
	nr			= 900;
	condition	= DIA_Kurgan_PICKPOCKET_Condition;
	information	= DIA_Kurgan_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Kurgan_PICKPOCKET_Condition()
{
	C_Beklauen (34, 120);
};
 
FUNC VOID DIA_Kurgan_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Kurgan_PICKPOCKET);
	Info_AddChoice		(DIA_Kurgan_PICKPOCKET, DIALOG_BACK 		,DIA_Kurgan_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Kurgan_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Kurgan_PICKPOCKET_DoIt);
};

func void DIA_Kurgan_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Kurgan_PICKPOCKET);
};
	
func void DIA_Kurgan_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Kurgan_PICKPOCKET);
};




