var int URSHAK_SUCKED;
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_Urshak_EXIT   (C_INFO)
{
	npc         = NONE_110_Urshak;
	nr          = 999;
	condition   = DIA_Urshak_EXIT_Condition;
	information = DIA_Urshak_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Urshak_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Urshak_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_HALLO		(C_INFO)
{
	npc		 = 	NONE_110_Urshak;
	nr		 = 	5;
	condition	 = 	DIA_Urshak_HALLO_Condition;
	information	 = 	DIA_Urshak_HALLO_Info;
	important	 = 	TRUE;
};

func int DIA_Urshak_HALLO_Condition ()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (URSHAK_SUCKED	== FALSE)
		{
			return TRUE;
		};	
};

func void DIA_Urshak_HALLO_Info ()
{
	AI_Output			(self, other, "DIA_Urshak_HALLO_18_00"); //(Con agresividad) ¡¡¡KHROTOK JABARTH!!!
	AI_Output			(self, other, "DIA_Urshak_HALLO_18_01"); //¡Esperar! Yo conocerte. Tú amigo humano de voz dulce.
	AI_Output			(self, other, "DIA_Urshak_HALLO_18_02"); //Amigo matar demonio maligno KRUSHAK.
	
	B_GivePlayerXP (XP_UrshakFound);
	
	Log_CreateTopic (TOPIC_Urshak, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Urshak, LOG_RUNNING);
	B_LogEntry (TOPIC_Urshak,"He encontrado a mi viejo amigo orco Ur-Shak."); 

	Info_ClearChoices	(DIA_Urshak_HALLO);
	Info_AddChoice	(DIA_Urshak_HALLO, "¿Qué estás haciendo aquí?", DIA_Urshak_HALLO_freund );
	Info_AddChoice	(DIA_Urshak_HALLO, "¿Un orco que habla?", DIA_Urshak_HALLO_wer );
};
func void DIA_Urshak_HALLO_wer ()
{
	AI_Output			(other, self, "DIA_Urshak_HALLO_wer_15_00"); //¿Un orco que habla?
	AI_Output			(self, other, "DIA_Urshak_HALLO_wer_18_01"); //¿Tú olvidar a Ur-Shak? Yo estar muy triste.
	AI_Output			(self, other, "DIA_Urshak_HALLO_wer_18_02"); //Ur-Shak ayudar amigo días antes de ULU-MULU por ir a mi aldea. Por eso, orcos respetar a amigo y amigo no morir a manos de los orcos.
	AI_Output			(self, other, "DIA_Urshak_HALLO_wer_18_03"); //Luego amigo entrar en templo orco y desterrar demonio maligno. Muchos días antes. ¿No acordar?

};

func void DIA_Urshak_HALLO_freund ()
{
	AI_Output			(other, self, "DIA_Urshak_HALLO_freund_15_00"); //Has escogido un mal momento para cruzarte en mi camino. Casi te mato. ¿Qué haces aquí?
	AI_Output			(self, other, "DIA_Urshak_HALLO_freund_18_01"); //Ur-Shak inspeccionar tierra y ver qué ser de tierra y de mi gente.
	Info_ClearChoices	(DIA_Urshak_HALLO);
};



///////////////////////////////////////////////////////////////////////
//	Info WasmachenOrks
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_WASMACHENORKS		(C_INFO)
{
	npc		 = 	NONE_110_Urshak;
	nr		 = 	6;
	condition	 = 	DIA_Urshak_WASMACHENORKS_Condition;
	information	 = 	DIA_Urshak_WASMACHENORKS_Info;

	description	 = 	"¿Por qué atacan los orcos a los humanos?";
};

func int DIA_Urshak_WASMACHENORKS_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Urshak_HALLO))
	&& (URSHAK_SUCKED	== FALSE)
		{
				return TRUE;
		};
};

func void DIA_Urshak_WASMACHENORKS_Info ()
{
	AI_Output			(other, self, "DIA_Urshak_WASMACHENORKS_15_00"); //¿Por qué atacan los orcos a los humanos?
	AI_Output			(self, other, "DIA_Urshak_WASMACHENORKS_18_01"); //Ur-Shak siempre decir a gente orca que humanos no ser malos y que haber muchos amigos.
	AI_Output			(self, other, "DIA_Urshak_WASMACHENORKS_18_02"); //Pero chamán no hacer caso a Ur-Shak. Ur-Shak caer en desgracia de gente.
	AI_Output			(self, other, "DIA_Urshak_WASMACHENORKS_18_03"); //Por eso Ur-Shak no escuchar cuál ser gran plan de guerra contra humanos.
	B_LogEntry (TOPIC_Urshak,"Todavía no ha conseguido que su gente le escuche. Aún está exiliado."); 
};


///////////////////////////////////////////////////////////////////////
//	Info soviele
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_SOVIELE		(C_INFO)
{
	npc		 = 	NONE_110_Urshak;
	nr		 = 	7;
	condition	 = 	DIA_Urshak_SOVIELE_Condition;
	information	 = 	DIA_Urshak_SOVIELE_Info;

	description	 = 	"¿Por qué de pronto hay tantos de los vuestros?";
};

func int DIA_Urshak_SOVIELE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Urshak_HALLO))
	&& (URSHAK_SUCKED	== FALSE)
		{
				return TRUE;
		};
};

func void DIA_Urshak_SOVIELE_Info ()
{
	AI_Output			(other, self, "DIA_Urshak_SOVIELE_15_00"); //¿Por qué de pronto hay tantos de los vuestros?
	AI_Output			(self, other, "DIA_Urshak_SOVIELE_18_01"); //Orcos venir de montañas, pero otros venir con barcos y hacer gran valla.
};


///////////////////////////////////////////////////////////////////////
//	Info Zaun
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_ZAUN		(C_INFO)
{
	npc		 = 	NONE_110_Urshak;
	nr		 = 	8;
	condition	 = 	DIA_Urshak_ZAUN_Condition;
	information	 = 	DIA_Urshak_ZAUN_Info;

	description	 = 	"¿Qué hay detrás de la larga empalizada orca del este?";
};

func int DIA_Urshak_ZAUN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Urshak_HALLO))
	&& (URSHAK_SUCKED	== FALSE)
		{
				return TRUE;
		};
};

func void DIA_Urshak_ZAUN_Info ()
{
	AI_Output			(other, self, "DIA_Urshak_ZAUN_15_00"); //¿Qué hay detrás de la larga empalizada orca del este?
	AI_Output			(self, other, "DIA_Urshak_ZAUN_18_01"); //Orcos siempre levantar gran valla y campamento para guerra.
	AI_Output			(self, other, "DIA_Urshak_ZAUN_18_02"); //Valla buena para guerra. Servir para esconder fuerza de ejército y proteger orcos.
};



///////////////////////////////////////////////////////////////////////
//	Info washastduvor
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_WASHASTDUVOR		(C_INFO)
{
	npc		 = 	NONE_110_Urshak;
	nr		 = 	9;
	condition	 = 	DIA_Urshak_WASHASTDUVOR_Condition;
	information	 = 	DIA_Urshak_WASHASTDUVOR_Info;

	description	 = 	"¿Qué piensas hacer ahora?";
};

func int DIA_Urshak_WASHASTDUVOR_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Urshak_HALLO))
	&& (URSHAK_SUCKED	== FALSE)
		{
				return TRUE;
		};
};

func void DIA_Urshak_WASHASTDUVOR_Info ()
{
	AI_Output			(other, self, "DIA_Urshak_WASHASTDUVOR_15_00"); //¿Qué piensas hacer ahora?
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_18_01"); //Ur-Shak esperar que exploradores orcos llevarlo ante Hosh-Pak.
	AI_Output			(other, self, "DIA_Urshak_WASHASTDUVOR_15_02"); //¿Quién es Hosh-Pak?
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_18_03"); //Ser chamán muy importante. Tener mucha influencia en guerreros y hacer grandes planes para orcos.

	B_LogEntry (TOPIC_Urshak,"El plan de Ur-Shak es encontrarse con el chamán orco Hosh-Pak y convencerlo de que le vuelva a aceptar en el concilio de chamanes."); 

	Info_ClearChoices	(DIA_Urshak_WASHASTDUVOR);

	Info_AddChoice	(DIA_Urshak_WASHASTDUVOR, DIALOG_BACK, DIA_Urshak_WASHASTDUVOR_weiter );
	Info_AddChoice	(DIA_Urshak_WASHASTDUVOR, "¿Dónde puedo encontrar a ese tal Hosh-Pak?", DIA_Urshak_WASHASTDUVOR_ );
	Info_AddChoice	(DIA_Urshak_WASHASTDUVOR, "Entonces, ¿por qué no vas a verle?", DIA_Urshak_WASHASTDUVOR_hoshpak );
};
func void DIA_Urshak_WASHASTDUVOR_hoshpak ()
{
	AI_Output			(other, self, "DIA_Urshak_WASHASTDUVOR_hoshpak_15_00"); //Entonces, ¿por qué no vas a verle?
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_hoshpak_18_01"); //Ur-Shak intentar obtener otra vez honor y antiguo puesto en consejo de chamanes.
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_hoshpak_18_02"); //Pero por ahora, Hosh-Pak no hacer caso a Ur-Shak. Orcos matar a Ur-Shak si aparecer sin exploradores. Ur-Shak tener que hablar con Hosh-Pak.
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_hoshpak_18_03"); //A lo mejor hoy tener suerte.
	
};

func void DIA_Urshak_WASHASTDUVOR_ ()
{
	AI_Output			(other, self, "DIA_Urshak_WASHASTDUVOR_Urshak_15_00"); //¿Dónde puedo encontrar a ese tal Hosh-Pak?
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_Urshak_18_01"); //Estar en fortaleza de gran volcán donde poder controlar a guerreros orcos.

};

func void DIA_Urshak_WASHASTDUVOR_weiter ()
{
	Info_ClearChoices	(DIA_Urshak_WASHASTDUVOR);
};



///////////////////////////////////////////////////////////////////////
//	Info hoshpakDead
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_HOSHPAKDEAD		(C_INFO)
{
	npc		 = 	NONE_110_Urshak;
	nr		 = 	9;
	condition	 = 	DIA_Urshak_HOSHPAKDEAD_Condition;
	information	 = 	DIA_Urshak_HOSHPAKDEAD_Info;

	description	 = 	"Hosh-Pak ha muerto.";
};

func int DIA_Urshak_HOSHPAKDEAD_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Urshak_WASHASTDUVOR))
		&& (Npc_IsDead(Hosh_pak))
		&& (URSHAK_SUCKED	== FALSE)
		{
				return TRUE;
		};
};

func void DIA_Urshak_HOSHPAKDEAD_Info ()
{
	AI_Output			(other, self, "DIA_Urshak_HOSHPAKDEAD_15_00"); //Hosh-Pak ha muerto.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKDEAD_18_01"); //¿Hosh-Pak muerto? ¡RUSHTASOK!
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKDEAD_18_02"); //Mi corazón estar muy triste. Ur-Shak nunca olvidar gran orco que nombrar chamán a Ur-Shak.
	AI_Output			(other, self, "DIA_Urshak_HOSHPAKDEAD_15_03"); //Entiendo. Hosh-Pak fue tu mentor.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKDEAD_18_04"); //Ur-Shak sentir dolor y tener que dar extremaunción a Hosh-Pak. Ur-Shak tener que irse.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKDEAD_18_05"); //Ser mejor que amigo cruzar paso. Aquí haber mucho peligro.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKDEAD_18_06"); //Ur-Shak triste si amigo humano también morir.

	B_LogEntry (TOPIC_Urshak,"Hosh-Pak está muerto. Mi amigo orco se dirige hacia las tiendas de Hosh-Pak. Está de luto por la muerte de su mentor. Debería dejarle ir."); 

	AI_StopProcessInfos (self);
	Npc_SetRefuseTalk (self,20);
	Npc_ExchangeRoutine	(self,"Start");
	Wld_InsertNpc   (OrcWarrior_Rest,"FP_CAMPFIRE_HOSHPAK_01");	
	Wld_InsertNpc   (OrcWarrior_Rest,"FP_CAMPFIRE_HOSHPAK_02");	
};


///////////////////////////////////////////////////////////////////////
//	Info geh
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_GEH		(C_INFO)
{
	npc		 = 	NONE_110_Urshak;
	condition	 = 	DIA_Urshak_GEH_Condition;
	information	 = 	DIA_Urshak_GEH_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Urshak_GEH_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Urshak_HOSHPAKDEAD))
		&& ((Npc_GetDistToWP(self,"OW_HOSHPAK_04")<1000) == FALSE)
		&& (Npc_RefuseTalk(self) == FALSE)
		&& (URSHAK_SUCKED	== FALSE)
		{
				return TRUE;
		};
};

func void DIA_Urshak_GEH_Info ()
{
	AI_Output			(self, other, "DIA_Urshak_GEH_18_00"); //Ser mejor que amigo cruzar paso ahora.
	Npc_SetRefuseTalk (self,10);
	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info HoshpakRache
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_HOSHPAKRACHE		(C_INFO)
{
	npc		 = 	NONE_110_Urshak;
	condition	 = 	DIA_Urshak_HOSHPAKRACHE_Condition;
	information	 = 	DIA_Urshak_HOSHPAKRACHE_Info;
	important	 = 	TRUE;
};

func int DIA_Urshak_HOSHPAKRACHE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Urshak_HOSHPAKDEAD))
		&& ((Npc_GetDistToWP(self,"OW_HOSHPAK_04")<=1000))
		&& (URSHAK_SUCKED == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Urshak_HOSHPAKRACHE_Info ()
{
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKRACHE_18_00"); //(Con agresividad) ¡KHROTOK! Yo enterarme de que tú estar allí cuando Hosh-Pak morir. Tú cometer grave error, forastero.
	AI_Output			(other, self, "DIA_Urshak_HOSHPAKRACHE_15_01"); //Veo que has ocupado su puesto. Me has estado tomando el pelo.
	AI_Output			(other, self, "DIA_Urshak_HOSHPAKRACHE_15_02"); //Tu situación entre tu gente es mejor de lo que querías admitir. No eres más que un peón del mal.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKRACHE_18_03"); //Forastero tener razón. Ur-Shak ahora sentir solo odio y ganas de venganza.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKRACHE_18_04"); //Ur-Shak ver que ser error confiar en humano malvado. Ur-Shak lamentar llamar amigo a humano e impedir que él morir.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKRACHE_18_05"); //Forastero por fin salir de valle y cruzar desfiladero. Ur-Shak no poder matar a forastero ahora. Honor de chamanes ordenar a Ur-Shak no matar.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKRACHE_18_06"); //Ser enemigos la próxima vez que vernos. Mejor irte.
	AI_StopProcessInfos (self);
	URSHAK_SUCKED = TRUE;
	B_LogEntry (TOPIC_Urshak,"Ur-Shak ha sido aceptado de nuevo en el concilio de chamanes orcos. Ahora está del lado del enemigo y la situación es algo tensa. Más me vale que me aparte de su camino hasta que las cosas se hayan suavizado con los orcos. Para entonces debería haberse calmado."); 
	B_GivePlayerXP (XP_UrshakBecomesShaman);
};


///////////////////////////////////////////////////////////////////////
//	Info keineWahl
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_KEINEWAHL		(C_INFO)
{
	npc		 = 	NONE_110_Urshak;
	condition	 = 	DIA_Urshak_KEINEWAHL_Condition;
	information	 = 	DIA_Urshak_KEINEWAHL_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Urshak_KEINEWAHL_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Urshak_HOSHPAKRACHE))
	&& (Npc_IsInState (self,ZS_Talk))
		{
				return TRUE;
		};
};

func void DIA_Urshak_KEINEWAHL_Info ()
{
	AI_Output			(self, other, "DIA_Urshak_KEINEWAHL_18_00"); //Irte. Yo no hablar con forastero.
	AI_StopProcessInfos (self);
	URSHAK_SUCKED = TRUE;
};





















