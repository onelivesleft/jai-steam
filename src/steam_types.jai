VALVE_BIG_ENDIAN :: false;
UINT64_MAX :: -1;

SteamAPIWarningMessageHook_t :: *void;
CGameID :: u64;

//
// clientpublic
//

CSteamID :: u64;

EGameIDType :: enum {
    k_EGameIDTypeApp        :: 0;
    k_EGameIDTypeGameMod    :: 1;
    k_EGameIDTypeShortcut   :: 2;
    k_EGameIDTypeP2P        :: 3;
}

GameID_t :: u64;

QUERY_PORT_NOT_INITIALIZED ::  0xFFFF;    // We haven't asked the GS for this query port's actual value yet.
QUERY_PORT_ERROR           ::  0xFFFE;    // We were unable to get the query port for this server.

ValvePackingSentinel_t :: struct {
    m_u32 : uint32;
    m_u64 : uint64;
    m_u16 : uint16;
    m_d : double;
}


//
// input
//

STEAM_INPUT_MAX_COUNT           :: 16;
STEAM_INPUT_MAX_ANALOG_ACTIONS  :: 16;
STEAM_INPUT_MAX_DIGITAL_ACTIONS :: 128;
STEAM_INPUT_MAX_ORIGINS         :: 8;
STEAM_INPUT_MAX_ACTIVE_LAYERS   :: 16;

// When sending an option to a specific controller handle, you can send to all devices via this command
STEAM_INPUT_HANDLE_ALL_CONTROLLERS :: UINT64_MAX;
STEAM_INPUT_MIN_ANALOG_ACTION_DATA :: -1.0;
STEAM_INPUT_MAX_ANALOG_ACTION_DATA ::  1.0;


//
// controller
//

STEAM_CONTROLLER_MAX_COUNT ::  16;
STEAM_CONTROLLER_MAX_ANALOG_ACTIONS ::  16;
STEAM_CONTROLLER_MAX_DIGITAL_ACTIONS ::  128;
STEAM_CONTROLLER_MAX_ORIGINS ::  8;
STEAM_CONTROLLER_MAX_ACTIVE_LAYERS ::  16;

STEAM_CONTROLLER_HANDLE_ALL_CONTROLLERS ::  UINT64_MAX;

STEAM_CONTROLLER_MIN_ANALOG_ACTION_DATA ::  -1.0;
STEAM_CONTROLLER_MAX_ANALOG_ACTION_DATA ::   1.0;


//
// networkingsockets
//


EType :: enum {
    k_EType_String;
    k_EType_Int; // For most small integral values.  Uses google protobuf sint64, so it's small on the wire.  WARNING: In some places this value may be transmitted in JSON, in which case precision may be lost in backend analytics.  Don't use this for an "identifier", use it for a scalar quantity.
    k_EType_Fixed64; // 64 arbitrary bits.  This value is treated as an "identifier".  In places where JSON format is used, it will be serialized as a string.  No aggregation / analytics can be performed on this value.
}

ExtraField :: struct {
    m_eType : s32; /* EType */ ;
    m_szName : [28] char;

    union {
        m_szStringValue : [128] char ;
        m_nIntValue : int64;
        m_nFixed64Value : uint64;
    }
}

SteamDatagramRelayAuthTicket :: struct {
	/// Identity of the gameserver we want to talk to.  This is required.
	m_identityGameserver : SteamNetworkingIdentity;

	/// Identity of the person who was authorized.  This is required.
	m_identityAuthorizedClient : SteamNetworkingIdentity;

	/// SteamID is authorized to send from a particular public IP.  If this
	/// is 0, then the sender is not restricted to a particular IP.
	///
	/// Recommend to leave this set to zero.
	m_unPublicIP : uint32;

	/// Time when the ticket expires.  Recommended: take the current
	/// time and add 6 hours, or maybe a bit longer if your gameplay
	/// sessions are longer.
	///
	/// NOTE: relays may reject tickets with expiry times excessively
	/// far in the future, so contact us if you wish to use an expiry
	/// longer than, say, 24 hours.
	m_rtimeTicketExpiry : RTime32;

	/// Routing information where the gameserver is listening for
	/// relayed traffic.  You should fill this in when generating
	/// a ticket.
	///
	/// When generating tickets on your backend:
	/// - In production: The gameserver knows the proper routing
	///   information, so you need to call
	///   ISteamNetworkingSockets::GetHostedDedicatedServerAddress
	///   and send the info to your backend.
	/// - In development, you will need to provide public IP
	///   of the server using SteamDatagramServiceNetID::SetDevAddress.
	///   Relays need to be able to send UDP
	///   packets to this server.  Since it's very likely that
	///   your server is behind a firewall/NAT, make sure that
	///   the address is the one that the outside world can use.
	///   The traffic from the relays will be "unsolicited", so
	///   stateful firewalls won't work -- you will probably have
	///   to set up an explicit port forward.
	/// On the client:
	/// - this field will always be blank.
	m_routing : SteamDatagramHostedAddress;

	/// App ID this is for.  This is required, and should be the
	/// App ID the client is running.  (Even if your gameserver
	/// uses a different App ID.)
	m_nAppID : uint32;

	/// Restrict this ticket to be used for a particular virtual port?
	/// Set to -1 to allow any virtual port.
	///
	/// This is useful as a security measure, and also so the client will
	/// use the right ticket (which might have extra fields that are useful
	/// for proper analytics), if the client happens to have more than one
	/// appropriate ticket.
	///
	/// Note: if a client has more that one acceptable ticket, they will
	/// always use the one expiring the latest.
	m_nRestrictToVirtualPort : s32;

	//
	// Extra fields.
	//
	// These are collected for backend analytics.  For example, you might
	// send a MatchID so that all of the records for a particular match can
	// be located.  Or send a game mode field so that you can compare
	// the network characteristics of different game modes.
	//
	// (At the time of this writing we don't have a way to expose the data
	// we collect to partners, but we hope to in the future so that you can
	// get visibility into network conditions.)
	//


	m_nExtraFields : s32;
	m_vecExtraFields : [16] ExtraField;
}


// steam_api_internal

CallbackMsg_t :: struct {
	m_hSteamUser : HSteamUser;  // Specific user to whom this callback applies.
	m_iCallback  : s32;         // Callback identifier.  (Corresponds to the k_iCallback enum in the callback structure.)
	m_pubParam   : *uint8;      // Points to the callback structure
	m_cubParam   : s32;         // Size of the data pointed to by m_pubParam
};


#scope_module


char :: u8;
int32_t :: s32;
int64_t :: s64;
intptr_t :: u64;
double :: float64;
uint :: u32;
size_t :: u64;
