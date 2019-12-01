table! {
    attachment (id) {
        id -> Uuid,
        paste_id -> Uuid,
        file_name -> Nullable<Text>,
        file_hash -> Nullable<Text>,
        file_size -> Nullable<Int4>,
        mime_type -> Nullable<Text>,
    }
}

table! {
    paste (id) {
        id -> Uuid,
        user_id -> Uuid,
        created_at -> Timestamp,
        expiry_timestamp -> Timestamp,
        title -> Nullable<Text>,
        language -> Nullable<Text>,
        password -> Nullable<Text>,
        contents -> Text,
        views -> Int4,
        is_public -> Bool,
        deletion_hash -> Text,
    }
}

table! {
    users (id) {
        id -> Uuid,
        created_at -> Timestamp,
        last_updated_at -> Timestamp,
        name -> Varchar,
        username -> Varchar,
        password -> Text,
        email -> Varchar,
        is_active -> Bool,
        api_key -> Text,
    }
}

joinable!(attachment -> paste (paste_id));
joinable!(paste -> users (user_id));

allow_tables_to_appear_in_same_query!(
    attachment,
    paste,
    users,
);
